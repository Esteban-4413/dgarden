
# Part 2: SQL Compiler and Virtual Machine

## Architecture Overview
To keep the system modular and easy to reason about, the query execution pipeline is split into two distinct steps:
1. **Front-end (SQL Compiler):** Parses the raw string input and translates it into an internal representation called **bytecode** (represented as a `Statement` structure).
2. **Back-end (Virtual Machine):** Receives the prepared statement/bytecode and executes it against the storage engine.

![[SQLITE-arch2.png]]

### Advantages of This Split
- **Complexity Reduction:** The Virtual Machine does not need to worry about syntax errors or string parsing; it only executes validated, structured statements.
- **Query Caching:** Common or repeated queries can be compiled once and cached in bytecode form to improve execution performance.

---

## Refactoring the REPL Loop

The REPL loop in `main` is updated to process two types of inputs before execution: **Meta-Commands** and **SQL Statements**.

```c
int main(int argc, char* argv[]) {
  InputBuffer* input_buffer = new_input_buffer();
  while (true) {
    print_prompt();
    read_input(input_buffer);

    // 1. Meta-commands (start with '.')
    if (input_buffer->buffer[0] == '.') {
      switch (do_meta_command(input_buffer)) {
        case (META_COMMAND_SUCCESS):
          continue;
        case (META_COMMAND_UNRECOGNIZED_COMMAND):
          printf("Unrecognized command '%s'\n", input_buffer->buffer);
          continue;
      }
    }

    // 2. SQL Compiler / Statement Preparation
    Statement statement;
    switch (prepare_statement(input_buffer, &statement)) {
      case (PREPARE_SUCCESS):
        break;
      case (PREPARE_UNRECOGNIZED_STATEMENT):
        printf("Unrecognized keyword at start of '%s'.\n",
               input_buffer->buffer);
        continue;
    }

    // 3. Virtual Machine Execution
    execute_statement(&statement);
    printf("Executed.\n");
  }
}
```

## Result codes vs. Exceptions
Since C does not support exceptions, we use custom `enum` result codes (`MetaCommandResult` and `PrepareResult`) to indicate success or failure.

```c
typedef enum {
  META_COMMAND_SUCCESS,
  META_COMMAND_UNRECOGNIZED_COMMAND
} MetaCommandResult;

typedef enum {
  PREPARE_SUCCESS,
  PREPARE_UNRECOGNIZED_STATEMENT
} PrepareResult;
```

>[!note]
> Using enums ensures safety during compilation; if a `switch` statement omits a member of the enum, the compiler will throw a warning, forcing us to handle every possible outcome explicitly.

## Component details
### Meta-Command Processor (`do_meta_command`)
Non-SQL commands (like `.exit`) start with a dot (`.`). These are handled in a separate pipeline stage from standard SQL queries.

```c
MetaCommandResult do_meta_command(InputBuffer* input_buffer) {
  if (strcmp(input_buffer->buffer, ".exit") == 0) {
    close_input_buffer(input_buffer);
    exit(EXIT_SUCCESS);
  } else {
    return META_COMMAND_UNRECOGNIZED_COMMAND;
  }
}
```

### Statement and SQL compiler (`prepare_statement`)
The `Statement` structure acts as our bytecode/internal representation. Currently, it supports two basic statement types: `STATEMENT_INSERT` and `STATEMENT_SELECT`.

```c
typedef enum { STATEMENT_INSERT, STATEMENT_SELECT } StatementType;

typedef struct {
  StatementType type;
} Statement;

PrepareResult prepare_statement(InputBuffer* input_buffer,
                                Statement* statement) {
  if (strncmp(input_buffer->buffer, "insert", 6) == 0) {
    statement->type = STATEMENT_INSERT;
    return PREPARE_SUCCESS;
  }
  if (strcmp(input_buffer->buffer, "select") == 0) {
    statement->type = STATEMENT_SELECT;
    return PREPARE_SUCCESS;
  }

  return PREPARE_UNRECOGNIZED_STATEMENT;
}
```

Note that: 
- `strncmp` for `inser`: We use `strncmp` with a length of 6 for `"insert"` because the keyword will be followed by values/arguments (e.g., `insert 1 cstack foo@bar.com`).
- `strcmp` for `select`: We use `strcmp` for `"select"` as it is currently evaluated as a standalone keyword.

### Virtual Machine Execution (`execute_statement`)
The initial implementation of out Virtual Machine uses a `switch` statement over `statement->type` to execute stubs for supported queries.

```c
void execute_statement(Statement* statement) {
  switch (statement->type) {
    case (STATEMENT_INSERT):
      printf("This is where we would do an insert.\n");
      break;
    case (STATEMENT_SELECT):
      printf("This is where we would do a select.\n");
      break;
  }
}
```
