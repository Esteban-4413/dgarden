# Part 6: The Cursor
As we prepare to transition our data structure from a flat array of rows to a B-Tree, relying directly on row numbers and harcoded array iterations becomes higly inneficient.
To solve this, we are going to need to introduce the **Cursor** abstraction. A cursor basically represents a specific location within a table. This allows our Virtual Machine (`execute_select`, `execute_insert`) to interact with the database without needing to know how the data is physically stored under the hood.

Things we can do with cursors now:
1. Create a cursor at the beginning of the table.
2. Create a cursor at the end of the table.
3. Access the row memory the cursor is pointing to.
4. Advance the cursor to the next row.

## The `Cursor` struct 
```c
typedef struct {
	Table *table;
	uint32_t row_num;
	bool end_of_table; // Indicates a position one past the last element
} Cursor;
```
- `table`: A reference to the table the cursor belongs to.
- `row_num`: The current position in the table.
- `end_of_table`: A boolean flag that lets us safely represent a position just past the end of the table. This is exactly where we want to point when inserting a new row.

## Creating cursor
Two constructors are introduced to initialize cursors at the boundaries of our table:
```c
Cursor* table_start(Table* table) {
  Cursor* cursor = malloc(sizeof(Cursor));
  cursor->table = table;
  cursor->row_num = 0;
  cursor->end_of_table = (table->num_rows == 0);

  return cursor;
}

Cursor* table_end(Table* table) {
  Cursor* cursor = malloc(sizeof(Cursor));
  cursor->table = table;
  cursor->row_num = table->num_rows;
  cursor->end_of_table = true;

  return cursor;
}
```
- `table_start`: Points to `row_num = 0`. If the table is empty, `end_of_table` is immediately set to `true`.
- `table_end`: Points directly to `table->num_rows` (the first empty slot after the last inserted row), intentionally setting `end_of_table = true`.

## Cursor operations
### 1. Retrieving the value (`cursor_value`)
We completely replace the old `row_slot()` function with `cursor_value()`. It performs the exact same page/offset calculations, but extracts the `row_num` and `pager` directly from the cursor instance.
```c
void* cursor_value(Cursor* cursor) {
  uint32_t row_num = cursor->row_num;
  uint32_t page_num = row_num / ROWS_PER_PAGE;
  void *page = get_page(cursor->table->pager, page_num);
  uint32_t row_offset = row_num % ROWS_PER_PAGE;
  uint32_t byte_offset = row_offset * ROW_SIZE;
  
  return page + byte_offset;
}
```
### 2. Advancing the cursor (`cursor_advance`)
Moving to the next record is currently as simple as incrementing the `row_num`. (This logic will become significantly more complex once the B-Tree is implemented).

## Refactoring the virtual machine
Finally, we update our `execute` functions to rely entirely on cursors rather than raw `Table` metrics.

### Inserting rows
Instead of manually fetching `table->num_rows`, we create a cursor at the end of the table, serialize the data into that cursor's memory block, and free the cursor.
```c
ExecuteResult execute_insert(Statement* statement, Table* table) {
  if (table->num_rows >= TABLE_MAX_ROWS) {
    return EXECUTE_TABLE_FULL;
  }

  Row* row_to_insert = &(statement->row_to_insert);
  Cursor* cursor = table_end(table);

  serialize_row(row_to_insert, cursor_value(cursor));
  table->num_rows += 1;

  free(cursor);
  return EXECUTE_SUCCESS;
}
```

### Selecting rows
The `for` loop is replaced by a `while` loop that depends strictly on the cursor's `end_of_table` state.
```c
ExecuteResult execute_select(Statement* statement, Table* table) {
  Cursor* cursor = table_start(table);
  Row row;
  
  while (!(cursor->end_of_table)) {
    deserialize_row(cursor_value(cursor), &row);
    print_row(&row);
    cursor_advance(cursor);
  }

  free(cursor);
  return EXECUTE_SUCCESS;
}
```
With this refactor complete, the virtual machine is effectively decoupled from the underlying storage mechanism, leaving us with a clean slate to begin building the B-Tree structure.
