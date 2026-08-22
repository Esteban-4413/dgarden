
# Part 8: B-Tree Leaf Node Format

## Reviewing Alternative Table Formats
Before diving into the B-Tree code, it helps to document exactly why the tutorial moves away from the previous flat array structure.

*   **Unsorted Array of Rows (The previous approach):**
    *   *Pros:* Extremely space-efficient (pages contain only data). Insertion is $O(1)$ because records are just appended to the end.
    *   *Cons:* Finding a row requires scanning the entire table ($O(n)$). Deleting a row is also $O(n)$ because every subsequent row must be shifted to fill the gap.
*   **Sorted Array of Rows:**
    *   *Pros:* Finding a row is fast ($O(\log n)$) using binary search.
    *   *Cons:* Insertion is very slow ($O(n)$) because lots of rows must be shifted to make space for the new one.
*   **Tree of Nodes (The current approach):**
    *   *Pros:* Insertion, deletion, and lookup are all $O(\log n)$.
    *   *Cons:* Requires more storage space due to the overhead of internal nodes and node metadata.

---

## Node Header Format & Memory Layout

In this implementation, every node will correspond to exactly **one page (4096 bytes)**. Because internal nodes and leaf nodes have different layouts, an enum is used to track the type:

```c
typedef enum { NODE_INTERNAL, NODE_LEAF } NodeType;
```

Nodes need to store metadata at the beginning of the page (the "Header"). Below is the visual representation of how a Leaf Node is laid out in memory:

## The constants breakdown
The tutorial defines the memory offsets byte by byte. A "cell" represents a single key/value pair.

| Byte range | Field | Size | Description |
| --- | --- | --- | --- |
| 0 | `node_type` | 1 byte | Enum: `NODE_INTERNAL` or `NODE_LEAF` | 
| 1 | `is_root | 1 byte | Boolean flag (using a full byte for simplicity) |
| 2 - 5 | `parent_pointer` | 4 bytes | Points to the parent page number |
| 6 - 9 | `num_cells` | 4 bytes | How many key/value pairs are currently in this node |
| 10 - 13 | `key 0` | 4 bytes | the ID of the first row (`uint32_t`) |
| 14 - 306 | `value 0` | 293 bytes | The serialized row data | 
| 307 - 310 | `key 1` | 4 bytes | The ID of the second row | 
| 311 - 603 | `value 1` | 293 bytes | The serialized row data | 
| ... | ... | ... | ... |
| 3578 - 3871 | `value 12` | 293 bytes | The 13th row (Max capacity for a 4KB page) |
| 3871 - 4095 | `wasted space` | 224 bytes | Empty space (noe enough to fit another 297-byte cell) |

>[!note] Capacity
>The common header is 6 bytes, and the leaf header adds 4 bytes (total 10 bytes). Each cell takes exactly 297 bytes (4 for the key + 293 for the value). Doing the math (`(4096 - 10) / 297`), a leaf node can hold exactly 13 cells before it runs out of space.

To access these values in C, the tutorial uses pointer arithmetic functions like `leaf_node_num_cells(node)` which add these exact byte offsets to the page's base pointer.

## Refactoring the architecture 
Switching to a tree requires changing how the database tracks size and location.

### 1. Pager and tables updates
- No more partial pages: Since every node takes up exactly one page, `pager_flush()` now always writes exactly `PAGE_SIZE` (4096 bytes) to disk.
- Tracking Pages, not Rows: The Pager object now tracks `num_pages` instead of `file_length`.
- The Root Node: A B-Tree is entirely identified by its root node. Therefore, the `Table` struct no longer tracks `num_rows`; it now tracks `root_page_num` (which starts at 0).

### 2. The cursor resolution
When the table was a flat array, the `Cursor` simply tracked a `row_num`. Now that data is nested inside tree nodes, a position must be identified by the Page Number and the Cell Number within that page.

```c
typedef struct {
  Table* table;
  uint32_t page_num;
  uint32_t cell_num;
  bool end_of_table;
} Cursor;
```
- `table_start`() now points to `page_num = root_page_num` and `cell_num = 0`.
- `table_end`() reads the root node and sets `cell_num` to whatever `num_cells` currently is (pointing to the first empty slot).

## Inserting int a Leaf node (Single-Node tree)
At this stage of the tutorial, the implementation only supports a single-node tree. The root node starts as a Leaf Node. When a new database file is created, Page 0 is initialized as an empty leaf.

The `execute_insert` function now relies on a helper called `leaf_node_insert()`:
```c
void leaf_node_insert(Cursor* cursor, uint32_t key, Row* value) {
  void* node = get_page(cursor->table->pager, cursor->page_num);
  uint32_t num_cells = *leaf_node_num_cells(node);

  if (num_cells >= LEAF_NODE_MAX_CELLS) {
    // Node full
    printf("Need to implement splitting a leaf node.\n");
    exit(EXIT_FAILURE);
  }

  if (cursor->cell_num < num_cells) {
    // Make room for new cell by shifting existing cells to the right
    for (uint32_t i = num_cells; i > cursor->cell_num; i--) {
      memcpy(leaf_node_cell(node, i), leaf_node_cell(node, i - 1),
             LEAF_NODE_CELL_SIZE);
    }
  }

  *(leaf_node_num_cells(node)) += 1;
  *(leaf_node_key(node, cursor->cell_num)) = key;
  serialize_row(value, leaf_node_value(node, cursor->cell_num));
}
```

## Current limitations (to be fixed)
1. No Splitting: If more than 13 rows are inserted, the program currently halts because leaf node splitting hasn't been implemented yet.
2. Unsorted Data: Because `execute_insert()` still opens a cursor using `table_end()`, the new rows are blindly appended to the end of the node. The data is still unsorted.
