# A little cheatography

![[thesujit_lazyvim-neovim.pdf]]
[cheatsheet](https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/cheatsheet)

# Basic motions

## Normal mode

| Key | Action                          |
| --- | ------------------------------- |
| i   | Insert mode                     |
| v   | visual mode                     |
| h   | <- (navigate left)              |
| j   | ↓ (navigate down)               |
| k   | ↑ (navigate up)                 |
| l   | -> (navigate right)             |
| w   | jump around words               |
| e   | jumps to the end of the word    |
| ge  | jumps to the end of a word backwards |
| b   | jump around wors back words     |

editing 

| Key | Action |
| ---- | ---- | 
| d | delete | 
| c | change | 
| y | yank (copy) |
| p | paste |
| g~ | switch case | 
| > | shift right | 
| < | shift left | 
| = | format |
| . | repeat the last change |



> [!INFO] Vim has the concept of special words (with letters, digits and numbers) that also include special character like `.`, `(`, `{`. They are called WORDs.
> So for example:
> ```text
>this is a WORD: Iam_A_WORD(WORD)
> this function call sum(2, 3) is also a WORD
> this array [1, 2, 3, 42, 5] is a WORD as well
> ```
> If you want to move WORD by WORD you can use the capitalized equivalents of the word by word motions (W, B, E, gE).


### Multipliers
Counts are numbers which let you multiply the effect of a command.

```text
{count}{command}
```

Example:
- `2w` moves the cursor 2 words forward.
- `5j` moves the cursor to 5 lines below.
- `3;` lets you go the next third occurrence of a character.
- `2/jbb` sends you to the second occurrence of `jbb` in a document.

In general, use `{count}{motion}` to multiply a motion `{count}` times.

# Advanced motions 

## Normal mode

Moving around

| Key      | Motion                                                                       |     |
| -------- | ---------------------------------------------------------------------------- | --- |
| gg       | goes to the top of the document                                              |     |
| {line}gg | go to {line}                                                                 |     |
| G        | goes all the way down to the end of the document                             |     |
| M        | Takes you to the middle of the visble screen                                 |     |
| zz       | Scrolls the document so that the current line is at the center of the screen |     |
| CTRL-d   | moves you down half a page by scrolling the page                             |     |
| CTRL-u   | moves you up half a page by scrolling                                        |     |
| $        | go to the end of the line                                                    |     |
| 0        | go to the beginning of the line                                              |     |
| ^        | Line's first character                                                       |     |
| g_       | Moves to the non-blank character at the end of a line                        |     |
| }        | jumps entire paragraphs downwars                                             |     |
| {        | jumps entire paragraphs upwards                                              |     |
| gd       | Go to the definition (of the word under the cursor)                          |     |
| gf       | Go to file (for file under the cursor)                                       |     |


Searching

| Key | Motion |
| --- | ------ |
| f{character}   | find                            |
| F{character}   | find backwards of the cursor    |
| ;   | repeat find                     |
| ,   | repeat find backwards           |
| t{character}   |Find the next occurrence of character and place cursor just before it |  
| T{character} | Find previous occurrence of character and place cursor just before it |
| %   | Will take you to the matching counterpart of the selected pair |  
| /{pattern} | Search for {pattern} |
| ?{pattern} | Search for {pattern} backwards |
| n | go to next match |
| N | go to prevoius match |


Inserting

|Key  | Motion |
| --- | ------ | 
| a   | Insert after cursor             |
| A   | Insert after line               |
| I   | Insert before the line          |
| o   | Inser new line below current line and go into insert mode |
| O   | Insert new line above current line and go into insert mode |
| gi  | go to the last place you left insert mode |


linewise operators

| Key | Motion                |     |
| --- | --------------------- | --- |
| dd  | delete a line         |     |
| cc  | change a line         |     |
| yy  | yank (copy) a line    |     |
| g~~ | switch case of a line |     |
| >>  | shift line right      |     |
| <<  | shift line left       |     |
| ==  | format line           |     |


text objects

| Key | Action                     |  
| ---- | ------                     | 
| diw  | delete inner word | 
| daw | delete a word        | 
| dis | delete inner sentece | 
| das | delete a sentence |
| dip | delete inner paragraph | 
| dap | delete a paragraph | 
| di( (or: dib) | delete inside parentheses |
| da( (or : dab) | delete text inside parentheses (including the parentheses) |
| di{ (or: diB) | delete inside braces | 
| da{ (or: daB) | delete text inside braces (including braces) |
|di[ | delete inside brackets | 
| da[ | delete text inside brackets (including brackets) |
| di" | delete inside quotes |
| da" | delete a quoted text (including quotes) | 


## Visual mode

| Key                                     | Motion                                                                       |     |
| --------------------------------------- | ---------------------------------------------------------------------------- | --- |
| v                                       | go into character-wise visual mode                                           |     |
| V                                       | go into line-wise visual mode                                                |     |
| CTRL-v                                  | go into block-wise visual mode (selects rectangular blocks of text)          |     |
| {trigger visual mode}{motion}{operator} | First you specify the motion to select text, and then you apply the operator |     |
