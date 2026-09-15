
---
tags:
  - computer-science
  - computer-science/programming/C
  - computer-science/DataBases
---

# Part 9: Binary Search and Duplicate Keys

## The Current Flaw in our B-Tree
In the previous part, we transitioned the physical structure of our database to a B-Tree format. However, a major flaw remained: when we inserted a new record, the `execute_insert()` function blindly opened a cursor at the very end of the table and appended the new row. The data was not being sorted, and there was no protection against inserting duplicate IDs.

Our goal now is to fix this by implementing a **binary search** that finds the exact sorted position where a new key belongs. If the key already exists at that position, we reject the insertion as a duplicate.

---

## 1. Updating `execute_insert`

We need to modify the insertion logic to search for the correct position rather than just jumping to the end.

```c
ExecuteResult execute_insert(Statement* statement, Table* table) {
  void* node = get_page(table->pager, table->root_page_num);
  uint32_t num_cells = (*leaf_node_num_cells(node));
  
  if (num_cells >= LEAF_NODE_MAX_CELLS) {
    return EXECUTE_TABLE_FULL;
  }

  Row* row_to_insert = &(statement->row_to_insert);
  uint32_t key_to_insert = row_to_insert->id;
  
  // Find the exact cursor position for this key
  Cursor* cursor = table_find(table, key_to_insert);

  // Check for duplicate keys
  if (cursor->cell_num < num_cells) {
    uint32_t key_at_index = *leaf_node_key(node, cursor->cell_num);
    if (key_at_index == key_to_insert) {
      return EXECUTE_DUPLICATE_KEY;
    }
  }
  
  leaf_node_insert(cursor, row_to_insert->id, row_to_insert);
  free(cursor);
  return EXECUTE_SUCCESS;
}
```

>[!note] We no longer need the `table_end()` function, so it can be deleted completely.

We also need to define the new error code in our enum and handle it in the `main()` REPL loop:
```c
enum ExecuteResult_t {
  EXECUTE_SUCCESS,
  EXECUTE_DUPLICATE_KEY,
  EXECUTE_TABLE_FULL
};

// Inside main() switch:
case (EXECUTE_DUPLICATE_KEY):
  printf("Error: Duplicate key.\n");
  break;
```

## 2.Searching the table (`table_find`)
The new `table_find` function acts as a dispatcher. It looks at the root node, checks its type, and delegates the search to either a leaf node search or an internal node search.

```c  
/*
 * Return the position of the given key.
 * If the key is not present, return the position where it should be inserted.
 */
Cursor* table_find(Table* table, uint32_t key) {
  uint32_t root_page_num = table->root_page_num;
  void* root_node = get_page(table->pager, root_page_num);

  if (get_node_type(root_node) == NODE_LEAF) {
    return leaf_node_find(table, root_page_num, key);
  } else {
    printf("Need to implement searching an internal node\n");
    exit(EXIT_FAILURE);
  }
}
```
(Because we only have a single-node tree so far, the internal node branch is just a stub.)

## 3. Node type utilities
To make `table_find` work, we need getter and setter functions to manipulate the `node_type` field in the page header. We cast the value to `uint8_t` to guarantee it only takes up exactly one byte of memory.
```c  
NodeType get_node_type(void* node) {
  uint8_t value = *((uint8_t*)(node + NODE_TYPE_OFFSET));
  return (NodeType)value;
}

void set_node_type(void* node, NodeType type) {
  uint8_t value = type;
  *((uint8_t*)(node + NODE_TYPE_OFFSET)) = value;
}

void initialize_leaf_node(void* node) {
  set_node_type(node, NODE_LEAF);
  *leaf_node_num_cells(node) = 0;
}
```

## 4. Binary search in a Leaf node (`leaf_node_find`)
This is the core algorithm that keeps the B-Tree sorted. It performs a standard binary search on the array of cells within a specific page

```c  
Cursor* leaf_node_find(Table* table, uint32_t page_num, uint32_t key) {
  void* node = get_page(table->pager, page_num);
  uint32_t num_cells = *leaf_node_num_cells(node);

  Cursor* cursor = malloc(sizeof(Cursor));
  cursor->table = table;
  cursor->page_num = page_num;

  // Binary search implementation
  uint32_t min_index = 0;
  uint32_t one_past_max_index = num_cells;
  
  while (one_past_max_index != min_index) {
    uint32_t index = (min_index + one_past_max_index) / 2;
    uint32_t key_at_index = *leaf_node_key(node, index);
    
    if (key == key_at_index) {
      cursor->cell_num = index;
      return cursor;
    }
    
    if (key < key_at_index) {
      one_past_max_index = index;
    } else {
      min_index = index + 1;
    }
  }

  cursor->cell_num = min_index;
  return cursor;
}
```
This function is guaranteed to return a cursor pointing to one of three possible outcomes:

1. The exact position of the existing key (triggering the duplicate error).
2. The position where a new key should be inserted, requiring existing cells to shift to the right.
3. The position just past the last existing key (if the new key is the highest value so far).
With these changes, the database now actively maintains sorted order and correctly rejects duplicate entries.

# Next 
-> [[part-10.md]]
## Links 
- [[part-1]]
- [[part-2]]
- [[part-3]]
- [[part-4]]
- [[part-5]]
- [[part-6]]
- [[part-7]]
- [[part-8.md]]
