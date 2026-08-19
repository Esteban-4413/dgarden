
# Part 4: Fixing some bugs

## Row
On the definition of a `Row`, we allocate exactly 32 and 255 bytes for username and email respectively. The thing is that strings in C are supposed to end with a null character, which at the moment we do not have space for. So we have to allocate one additional byte:
```c
#define COLUMN_USERNAME_SIZE 32
#define COLUMN_EMAIL_SIZE 255
typedef struct {
	uint32_t id;
	char username[COLUMN_USERNAME_SIZE + 1];
	char email[COLUMN_EMAIL_SIZE + 1];
} Row;
```

## Insert
At the moment we are allowing the insertion of usernames or emails that are longer than the column size. To correct this our parser is needed to be upgraded (`prepare_statement`). The problem is that the current definition is using `scanf()`, which has some disadvantages. If the string it's reading is larger than the buffer it's reading into, it will cause a buffer overflow and start writing into unexpected places. In a better definition we want to check the length of each string before we copy it into a `Row` structure. To do that we need to divide the input by spaces.

```c
PrepareResult preprare_insert(InputBuffer *input_buffer, Statement *statement) {
	statement->type = STATEMENT_INSERT;

	char *keyword = strtok(input_buffer->buffer, " ");
	char *id_string = strtok(NULL, " ");
	char *username = strtok(NULL, " ");
	char *email = strtok(NULL, " ");

	if (id_string == NULL || username == NULL || email == NULL)
		return PREPARE_SYNTAX_ERROR;

	int id = atoi(id_string);
	if (strlen(username) > COLUMN_USERNAME_SIZE)
		return PREPARE_STRING_TOO_LONG;

	if (strlen(username) > COLUMN_EMAIL_SIZE)
		return PREPARE_STRING_TOO_LONG;

	statement->row_to_insert.id = id;
	strcpy(statement->row_to_insert.username, username);
	strcpy(statement->row_to_insert.email, email);

	return PREPARE_SUCCESS;
}
```

Here we use `strtok` on the input buffer to break it into the substrings by inserting a null character whenever it reaches a delimiter (in this case the space) and then the function returns a pointer to the start of the substring.
After that we call `strlen()` on each text value to see if it's too long.

## Negative id
Now we gotta handle the case in which the user provides a negative a negative id. That is simple.

```c
typedef enum {
	PREPARE_SUCCESS,
	PREPARE_NEGATIVE_ID,
	PREPARE_STRING_TOO_LONG,
	PREPARE_SYNTAX_ERROR,
	PREPARE_UNRECOGNIZED_STATEMENT
} PrepareResult;
```

```c
PrepareResult preprare_insert(InputBuffer *input_buffer, Statement *statement) {
	statement->type = STATEMENT_INSERT;

	char *keyword = strtok(input_buffer->buffer, " ");
	char *id_string = strtok(NULL, " ");
	char *username = strtok(NULL, " ");
	char *email = strtok(NULL, " ");

	if (id_string == NULL || username == NULL || email == NULL)
		return PREPARE_SYNTAX_ERROR;

	int id = atoi(id_string);
	if (id < 0)
		return PREPARE_NEGATIVE_ID;
	if (strlen(username) > COLUMN_USERNAME_SIZE)
		return PREPARE_STRING_TOO_LONG;

	if (strlen(username) > COLUMN_EMAIL_SIZE)
		return PREPARE_STRING_TOO_LONG;

	statement->row_to_insert.id = id;
	strcpy(statement->row_to_insert.username, username);
	strcpy(statement->row_to_insert.email, email);

	return PREPARE_SUCCESS;
}
```

```c
int main(int argc, char *argv[]) {
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
		case (PREPARE_NEGATIVE_ID):
			printf("ID must be positive.\n");
			continue;
		case (PREPARE_STRING_TOO_LONG):
			printf("String is too long.\n");
			continue;
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
