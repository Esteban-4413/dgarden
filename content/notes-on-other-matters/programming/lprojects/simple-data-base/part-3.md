# Part 3: An in-memory, append-only, single-table database

The look of the hard-coded table structure:

|Column | type |
| --- | --- |
| id | integer |
| username | varchar(32) |
| email | varchar(255) |


## Compact row and memory layout
In order to be able to insert information in our table we first need to update the `prepare_statment` function so it can parse the arguments.

```c
PrepareResult prepare_statement(InputBuffer *input_buffer, Statement *statement) {
	// we use strncmp since the "insert" keyword will be followed by the data.
	if (strncmp(input_buffer->buffer, "insert", 6) == 0) {
		statement->type = STATEMENT_INSERT;
		int args_assigned = sscanf(input_buffer->buffer, "insert %d %s %s", &(statement->row_to_insert.id),
								   statement->row_to_insert.username, statement->row_to_insert.email);
		if (args_assigned < 3) {
			return PREPARE_SYNTAX_ERROR;
		}
		return PREPARE_SUCCESS;
	}
	if (strcmp(input_buffer->buffer, "select") == 0) {
		statement->type = STATEMENT_SELECT;
		return PREPARE_SUCCESS;
	}
	return PREPARE_UNRECOGNIZED_STATEMENT;
}
```

insert statements are going to look like this:
`insert 1 cstack foo@bar.com`

Those parsed arguments are going to be stored in a Row structure inside the statement object:
```c
#define COLUMN_USERNAME_SIZE 32
#define COLUMN_EMAIL_SIZE 255
typedef struct {
	uint32_t id;
	char username[COLUMN_USERNAME_SIZE];
	char email[COLUMN_EMAIL_SIZE];
} Row;

typedef struct {
	StatementType type;
	Row row_to_insert; // only used by insert statement
} Statement;
```

To copy that data into some data structure that represents the table we will group rows into pages, just like a B-Tree but insetad of arranging those pages as a tree we will arrange them as an array.

The plan:
- Store rows in blocks of memory called pages.
- Each page stores as many rows as it can fit.
- Rows are serialized into a compact representation with each page.
- Pages are only allocated as needed.
- Keep a fixed-size array of pointers to pages.

The representation of a row:

```c
#define size_of_attribute(Struct, Attribute) sizeof(((Struct*)0)->Attribute)
const uint32_t ID_SIZE = size_of_attribute(Row, id);
const uint32_t USERNAME_SIZE = size_of_attribute(Row, username);
const uint32_t  EMAIL_SIZE= size_of_attribute(Row, username);
const uint32_t  ID_OFFSET = 0;
const uint32_t USERNAME_OFFSET = ID_OFFSET + ID_SIZE;
const uint32_t EMAIL_OFFSET = USERNAME_OFFSET + USERNAME_SIZE;
const uint32_t ROW_SIZE = ID_SIZE + USERNAME_SIZE + EMAIL_SIZE;
```
In C, compilers often introduce hidden padding bytes inside `struct` definitions to align memory boundaries to multiples of 4 or 8 bytes.
To store rows sequentially in binary format (both in-memory pages and on-disk files) without wasting space or relying on compiler-specific padding quirks, we use a custom compact binary layout. We manually calculate the byte size (`SIZE`) and byte position (`OFFSET`) for every column.

```c
#define size_of_attribute(Struct, Attribute) sizeof(((Struct*)0)->Attribute)
```

This macro retrieves the size in bytes of a specific field inside a struct without needing to instatiate an object in memory.
- `(Struct*)0`: Casts the null address (`0`) into a pointer of type `Struct*`
- `((Struct*)0->Attribute`: Accesses the target field through this hypothetical pointer.
- `sizeof(...)`: The `sizeof` operator evaluates expressions purely at compile-time, never at runtime. Because of this, it does not actually dereference the `NULL` pointer (avoiding a Segmentation Fault). It simply inspects the field's data type and replaces the whole expression with its size in bytes.

We use the macro to determine the raw size of each field based on the `ROW` definition (`id: uint32_t, username: char[32], email: char[255]`):
- `ID_SIZE`: 4 bytes
- `USERNAME_SIZE`: 32 bytes
- `EMAIL_SIZE`: 255 bytes

And the offsets define the exact index where each attribute starts inside the row block:
- `ID_OFFSET` = 0
- `USERNAME_OFFSET`= 0 + 4 = 4 (starts immediately after `id`)
- `EMAIL_OFFSET` = 4 + 32 = 36 (starts immediately after `username`)
- `ROW_SIZE` = 4 + 32 + 255 = 291 bytes (total packed row size)

So when serialized using `memcpy`, a row resides in memory as a compact, contiguous stream of bytes with zero padding overhead:

| offset (byte) | Column          | Size      | Data type   |     |
| ------------- | --------------- | --------- | ----------- | --- |
| 0             | `id`            | 4 bytes   | `uint32_t`  |     |
| 4             | `username`      | 32 bytes  | `char[32]`  |     |
| 36            | `email`         | 255 bytes | `char[255]` |     |
| 291           | (Next row slot) | -         | -           |     |


So to convert to and from the compact representation we are going to do the following:
```c
void serialize_row(Row *source, void *destination) {
	memcpy(destination + ID_OFFSET, &(source->id), ID_SIZE);
	memcpy(destination + USERNAME_OFFSET, &(source->username), USERNAME_SIZE);
	memcpy(destination + EMAIL_OFFSET, &(source->email), EMAIL_SIZE);
}

void deserialize_row(void *source, Row *destination) {
	memcpy(&(destination->id), source + ID_OFFSET, ID_SIZE);
	memcpy(&(destination->username), source + USERNAME_OFFSET, USERNAME_SIZE);
	memcpy(&(destination->email), source + EMAIL_OFFSET, EMAIL_SIZE);
}
```

>[!info] What does `memcpy` do?
> `void* memcpy(void *restrict dst, const void *restrict src, size_t n);`
> The memcpy() function copies n bytes from memory area src to memory area dst.

## Table structure and memory paging
To store records efficiently, memory is divided into fixed-size chunks called Pages.

The page:
```c
const uint32_t PAGE_SIZE = 4096;
#define TABLE_MAX_PAGES 100
const uint32_t ROWS_PER_PAGE = PAGE_SIZE / ROW_SIZE; // 14 rows per page
const uint32_t TABLE_MAX_ROWS = ROWS_PER_PAGE * TABLE_MAX_PAGES; // 1400 rows

typedef struct {
  uint32_t num_rows;
  void* pages[TABLE_MAX_PAGES];
} Table;
```
>[!info] Memory design 
> - 4 KB page size: 4096 bytes matches the virtual memory page size of most modern CPU architectures. This ensure the operating system can transfer pages to and from disk as complete, unbroken units.
> - No splitting across page boundaries: With `PAGE_SIZE = 4096` and `ROW_SIZE = 291`, each page stores up to `4096 / 291 = 14` rows (occupying 4074 bytes). The remaining 22 bytes are left unused to ensure that rows never span across two separate pages, simplifying read and write operations.
> - Table capacity: With a maximum allocation of 100 pages, the initial in-memory table supports up to `14 * 100 = 1400` rows.

## Slot resolution and lazy allocation
The `row_slot` functions locates the exact address for any given row index, allocating page blocks only when they are first accessed.
```c
void *row_slot(Table *table, uint32_t row_num) {
	uint32_t page_num = row_num / ROWS_PER_PAGE;
	void *page = table->pages[page_num];
	if (page == NULL) {
		// Allocate memory only when we try to access page
		page = table->pages[page_num] = malloc(PAGE_SIZE);
	}
	uint32_t row_offset = row_num % ROWS_PER_PAGE;
	uint32_t byte_offset = row_offset * ROW_SIZE;
	return page + byte_offset;
}
```
- Page indexing: `page_num = row_num / ROWS_PER_PAGE` identifies the target page.
- Lazy allocation: If `table->pages[page_num]` is `NULL`, memory is allocated on-demand via `malloc(PAGE_>SIZE)`.
- Offset calculation: `row_offset = row_num % ROWS_PER_PAGE` determines the position within the page, and `byte_offset = row_offset * ROW_SIZE`.
- Pointer resolution: Returns `page + byte_offset` as a direct pointer to the row's binary memory slot.

## Virtual machine execution and table lifecycle 
With the paging architecture in place, the virtual machine (in this case our `execute_statement`) can read and write directly to the in-memory `Table` structure.

### Execution logic (`execute_insert` and `execute select`)
The execution engine translates prepared statements into physical operations on the table slots:

```c
typedef enum { EXECUTE_SUCCESS, EXECUTE_TABLE_FULL } ExecuteResult;

ExecuteResult execute_insert(Statement *statement, Table *table) {
	if (table->num_rows >= TABLE_MAX_ROWS)
		return EXECUTE_TABLE_FULL;

	Row *row_to_insert = &(statement->row_to_insert);

	serialize_row(row_to_insert, row_slot(table, table->num_rows));
	table->num_rows += 1;

	return EXECUTE_SUCCESS;
}

ExecuteResult execute_select(Statement *statement, Table *table) {
	Row row;
	for (uint32_t i = 0; i < table->num_rows; i++) {
		deserialize_row(row_slot(table, i), &row);
		print_row(&row);
	}
	return EXECUTE_SUCCESS;
}

ExecuteResult execute_statement(Statement *statement, Table *table) {
	switch (statement->type) {
	case (STATEMENT_INSERT):
		return execute_insert(statement, table);
	case (STATEMENT_SELECT):
		return execute_select(statement, table);
	}
}
```

- `execute_insert`: Checks whether the table has reached `TABLE_MAX_ROWS`. If space available, it writes the serialized row data into the slot address computed buy `row_slot(table, table->num_rows)` and increments `num_rows`.
- `execute_select`: Performs a full scan by iterating from row `0` up to `table->num_rows - 1`. For each row, it retrieves the memory slot, deserializes the bytes back into a `Row` struct, and prints the values to `stdout`. 

## Table memory management(`new_table` and `free_table`)
Managing memory correctly requires initializing all page pointers to `NULL` to support lazy allocation, as well as freeing each allocated page block on exit.
```c
Table *new_table() {
	Table *table = (Table *)malloc(sizeof(Table));
	table->num_rows = 0;
	for (uint32_t i = 0; i < TABLE_MAX_PAGES; i++)
		table->pages[i] = NULL;
	return table;
}

void free_table(Table *table) {
	for (int i = 0; table->pages[i]; i++)
		free(table->pages[i]);
	free(table);
}
```
- `new_table`: Allocates the `Table` struct and zeroes out the `pages` pointer array.
- `free_table`: Loops through all populated pages and frees each allocated 4 KB buffer before freeing the `Table` struct itself to prevent memory leaks.

## Updated REPL drive (`main`)
Now the main function ties all together

```c
main(int argc, char *argv[]) {
	Table *table = new_table();
	InputBuffer *input_buffer = new_input_buffer();
	while (true) {
		print_prompt();
		read_input(input_buffer);
		if (input_buffer->buffer[0] == '.') {
			switch (do_meta_command(input_buffer, table)) {
			case (META_COMMAND_SUCCESS):
				continue;
			case (META_COMMAND_UNRECOGNIZED_COMMAND):
				printf("Unrecognized command '%s'\n", input_buffer->buffer);
				continue;
			}
		}
		Statement statement;
		switch (prepare_statement(input_buffer, &statement)) {
		case (PREPARE_SUCCESS):
			break;
		case (PREPARE_SYNTAX_ERROR):
			printf("Syntax error. Could not parse statement.\n");
			continue;
		case (PREPARE_UNRECOGNIZED_STATEMENT):
			printf("Unrecognized keyword at start of '%s'.\n", input_buffer->buffer);
			continue;
		}
		execute_statement(&statement, table);
		switch (execute_statement(&statement, table)) {
		case (EXECUTE_SUCCESS):
			printf("Executed.\n");
			break;
		case (EXECUTE_TABLE_FULL):
			printf("Error: Table full.\n");
			break;
		}
	}
}
```
