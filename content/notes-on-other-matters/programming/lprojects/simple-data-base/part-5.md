
# Part 5: Persistence to disk
Right now the database lets us insert records and them back out but just as long as the program is running. If the process is killed all the records are gone. In order to persist records we are going to save the entire database to a file.
Having the rows serialized into page-sized memory blocks, to add persistence, we can simply write those blocks of memory to a file, and read them back into memory the next time the program starts ups.

## The pager abstraction
To handle file I/O and caching, we introduce a new abstraction layer: the **pager**. Instead of the `Table` directly managing memory pages, the `Table` now delegates this to the `Pager`

![[sqlite_diff.png]]

```c
typedef struct {
	int file_descriptor;
	uint32_t file_length;
	void *pages[TABLE_MAX_PAGES];
} Pager;

typedef struct {
	Pager *pager;
	uint32_t num_rows;
} Table;
```

The Pager's job is to:
1. Access the database file on disk.
2. Maintain an in-memory cache of pages.
3. Handle Cache Misses: If a page is requested and is not in the cache, the Pager reads it from disk into memory.

## System calls for file I/O (The OS interface)
To interact directly with the file system in C, se use POSIX sytem calls. Here is how they work

```c
Pager *pager_open(const char *filename) {
	int fd = open(filename, O_RDWR | O_CREAT, S_IWUSR | S_IRUSR);
	if (fd == -1) {
		printf("Unable to open file\n");
		exit(EXIT_FAILURE);
	}

	off_t file_length = lseek(fd, 0, SEEK_END);

	Pager *pager = malloc(sizeof(Pager));
	pager->file_descriptor = fd;
	pager->file_length = file_length;

	for (uint32_t i = 0; i < TABLE_MAX_PAGES; i++)
		pager->pages[i] = NULL;

	return pager;
}

Table *db_open(const char *filename) {
	Pager *pager = pager_open(filename);
	uint32_t num_rows = pager->file_length / ROW_SIZE;
	Table *table = malloc(sizeof(Table));
	table->pager = pager;
	table->num_rows = num_rows;

	return table;
}
```

1. `open()`
Opense a file a returns a file descriptor (an integer representing the open file in the OS).

```c
int fd = open(filename, O_RDWR | O_CREAT, S_IWUSR | S_IRUSR);
```
  - `filename`: The string path to the file.
  - Flags (`O_RDWR | O_CREAT`):
    - `O_RDWR`: Opens the file in Read/Write mode.
    - `O_CREAT`: Tells the OS to create the file if it does not exist.
  - Mode (`S_IWUSR | S_IRUSR`): Sets the permission of the newly created file.
    - `S_IWUSR`: User has Write permission.
    - `S_IRUSR`: User has Read permission.

2. `lseek()`
Repositions the read/write file offset (the "cursor" inside the file).
```c
off_t file_length = lseek(fd, 0, SEEK_END);
off_t offset = lseek(fd, page_num * PAGE_SIZE, SEEK_SET);
```
- `fd`: The file descriptor returned by `open()`.
- `offset`: The number of bytes to move the cursos.
- `whence` (the reference point):
  - `SEEK_SET`: Moves the cursor relative to the beginning of the file. (Used to jump to an specific page).
  - `SEEK_END`: Moves the cursor relative to the end of the file. (Used with offset `0` to quickly find out the total size of the file).

3. `write() and read()`
Transfers raw bytes between RAM and the disk file.
```c
ssize_t bytes_written = write(fd, buffer, size);
ssize_t bytes_read = read(fd, buffer, size);
```
- `fd`: The file descriptor
- `buffer`: A `void*` pointer to the memory block you want to write to disk, or where you want to store the data read from disk.
- `size`: The exact amount of bytes to transfer.

## Fetching pages (handling cache misses)
The `get_page` function implements our cache logic. Pages are stored sequentially in the file: Page 0 at offset 0, Page 1 at offset 4096, etc.
```c
void *get_page(Pager *pager, uint32_t page_num) {
	if (page_num > TABLE_MAX_PAGES) {
		printf("Tried to fetch page number out of bounds. %d > %d\n", page_num, TABLE_MAX_PAGES);
		exit(EXIT_FAILURE);
	}

	if (pager->pages[page_num] == NULL) {
		// cache miss. Allocate memory and load from file. (pd: we could use calloc instead)
		void *page = malloc(PAGE_SIZE);
    // NOTE: Using calloc(1, PAGE_SIZE) is safer to prevent uninitialized junk memory.

		uint32_t num_pages = pager->file_length / PAGE_SIZE;

		// might save a partial page at the end of the file
		if (pager->file_length % PAGE_SIZE)
			num_pages += 1;

		if (page_num <= num_pages) {
			lseek(pager->file_descriptor, page_num * PAGE_SIZE, SEEK_SET);
			ssize_t bytes_read = read(pager->file_descriptor, page, PAGE_SIZE);
			if (bytes_read == -1) {
				printf("Error reading file: %d\n", errno);
				exit(EXIT_FAILURE);
			}
		}
		pager->pages[page_num] = page;
	}
	return pager->pages[page_num];
}
```

## Flushing and closing the database
Currently, the database only writes data to disk when the user types `.exit`. The `db_close()` function iterates through the Pager's cache. If a page is not `NULL`, it calls `pager_flush()` to write it to disk.
```c
void pager_flush(Pager *pager, uint32_t page_num, uint32_t size) {
	if (pager->pages[page_num] == NULL) {
		printf("Tried to flush null page.\n");
		exit(EXIT_FAILURE);
	}

	off_t offset = lseek(pager->file_descriptor, page_num * PAGE_SIZE, SEEK_SET);

	if (offset == -1) {
		printf("Error seeking: %d\n", errno);
		exit(EXIT_FAILURE);
	}

	ssize_t bytes_written = write(pager->file_descriptor, pager->pages[page_num], size);

	if (bytes_written == -1) {
		printf("Error writing: %d\n", errno);
		exit(EXIT_FAILURE);
	}
}
```
>[!note]
> In this initial design, we flush the exact size of the active rows in the last page, meaning we write a partial page at the end of the file. This will change later when we implement the B-Tree.

## Current file format and layout 
```bash
~/projects/simpleDataBase  𝛌  ./db mydb.db
db > insert 1 esteban esteban@gmail.com
Executed.
db > insert 2 who foo@bar.com
Executed.
db > .exit

~/projects/simpleDataBase  𝛌  ./db mydb.db                                           24s
db > select
(1, esteban, esteban@gmail.com)
(2, who, foo@bar.com)
Executed.
db > .exit
```

Let's inspect the `mydb.db` binary file using `xxd`(a hex dump utility) to see exactly how the `serialize_row()` function has written the data into memory.

Visualizing the database in vim:
```bash
vim mydb.db
```

```vim
:%!xxd
```

Hex dump output:
```txt
00000000: 0100 0000 6573 7465 6261 6e00 0000 0000  ....esteban.....
00000010: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000020: 0000 0000 0065 7374 6562 616e 4067 6d61  .....esteban@gma
00000030: 696c 2e63 6f6d 0000 0000 0000 0000 0000  il.com..........
00000040: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000050: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000060: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000080: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000090: 0000 0000 0000 0000 0000 0000 0000 0000  ................
000000a0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
000000b0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
000000c0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
000000d0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
000000e0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
000000f0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000100: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000110: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000120: 0000 0000 0002 0000 0077 686f 0000 0000  .........who....
00000130: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000140: 0000 0000 0000 0000 0000 666f 6f40 6261  ..........foo@ba
00000150: 722e 636f 6d00 0000 0000 0000 0000 0000  r.com...........
00000160: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000170: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000180: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000190: 0000 0000 0000 0000 0000 0000 0000 0000  ................
000001a0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
000001b0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
000001c0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
000001d0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
000001e0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
000001f0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000200: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000210: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000220: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000230: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000240: 0000 0000 0000 0000 0000 0a              ...........
```

1. The ID (First 4 bytes)
  - Hex: `0100 0000`
  - Explanation: This represents the `uint32_t` ID of the first row. It is stored in **Little Endian** byte order, meaning the least significant byte (`01`) comes first, followed by the higher-order bytes (`00 00 00`).
>[!note]
> Because we used `memcpy()` directly from our struct, the data is saved in the native byte order of the machine compiling program. If we needed cross-platform compability with Big-Endian architectures, we would have to enforce a standard byte order in our serialization methods.

2. The username (Next 33 bytes)
  - Hex: `6573 7465 6261 6e00` followed by zeroes.
  - Explanation: This is the ASCII representation of "esteban". The `00` byte at the end acts as the C-style null terminator (`\0`). The remaining bytes up to the 33-byte limit are filled with zeroes (since we switched to `strncpy` to prevent garbage from uninitialized memory).

3. The email (Next 256 bytes)
  - Hex: `6573 7465 6261 6e40 676d 6169 6c2e 636f 6d00`
  - Explanation: The ASCII string "esteban@gmail.com", followed by its null terminator and zero padding for the rest of the 256 allocated bytes.

The exact same structure is repeated at offset `00000120` (approx 291 bytes later) for the second row containing ID `2` (`0200 0000`), username "who" (`7768 6f00`), and email "foo@bar.com" (`666f 6f40 6261 722e 636f 6d00`).
