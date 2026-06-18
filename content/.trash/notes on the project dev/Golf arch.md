# Architecture 

- [] Define the basic game object data structure
- [] Implement and test the basic interactions between the cards
- [] Define more game data structure (game board, piles of cards)
- [] Implement common operations on these structures (linked list fun)
- [] Display the current game state on the screen 
- [] Parse user input
- [] Execute actions based on the input use
## The cards
Standard 52-card deck with four suits: 
♥ Heart, ♠ Spade, ♣ Club, ♦ Diamond

and thirteen ranks (in ascending order):
A, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K

example of a card structure: 
```c
enum {
	SUIT_HEART, SUIT_SPADE, SUIT_CLUB, SUIT_DIAMOND // ♥♠♣♦
} ;

enum {
	RANK_A, RANK_2, RANK_3, RANK_4, RANK_5, RANK_6, RANK_7, RANK_8, RANK_9, RANK_10, RANK_J, RANK_Q, RANK_K
};

typedef struct card {
	int suit;
	int rank;
};
```

example of the game deck: 
```c
#define CARD_COUNT 52

typedef struct card_node {
  card *value;
  struct card_node *next;
} card_node;

typedef struct pile {
  card_node *head;
  int num_cards;
} pile;

typedef struct game_state {
  pile **piles;
  int pile_count;
} game_state;
```
`pile **piles` is an array of pointers to piles, it could also be written as pile \*piles[PILE_COUNT]

>*Note: array vs linked list*
> 
> We could represent the collection of cards in a pile with a linked list, or just assume there will never be a larger pile than 52 and go with an array as the backing store and a counter. With this, at the expense of more memory overhead per pile. As there is a known number of piles: unturned and turned card deck, 4 foundations, 7 columns, the total is 2+4+7=13 piles. On a 32-bit system, that’s at most `13 * (sizeof card*) * CARD_COUNT = 13 * 4 * 52 = 2704` bytes overhead, not that much on a PC, could be a factor on a microcontroller.

On the other hand, linked lists are a kind of a traditional C structure, so it may be nicer with them.

