## Linked lists

### Inserting a node at the beginning of the list:

```c
struct Node {
	int data;
	struct Node* next;
};

void Insert(Node** head, int x){
	Node* temp = malloc(sizeof(struct Node));
	temp->data = x;
	temp->next = head;
	head = temp;
}

void Print(Node* head){
	printf("List is;)
	while(temp != NULL){
		printf("%d", temp->data);
		temp = temp->next
	}
	printf("\n");
}

int main(){
	struct Node* head = NULL; // empty list;
	printf("How many numbers?");
	int n, i, x;
	scanf("%d", &n);
	for(i = 0; i < n; i++){
		printf("Enter the number\n");
		scanf("%d", &x);
		Insert(&head, x);
		print(head);
	}
}
```

### Inserting a node at $n^{th}$ position
```c
struct Node{
	int data;
	struct Node* next;
};

struct Node* head;
void Print(){
	Node* temp = head;
	while(temp != NULL){
		printf("%d", temp->data);
		temp = temp->next;
	}
	printf("\n");
}

void Insert(int data, int n){
	struct *Node temp1 = malloc(sizeof(struct Node));
	temp1->data = data;
	temp1->next = NULL;
	if(n == 1){
		temp1->next = head;
		head = temp1;
		return;
	}
	Node* temp2 = head;
	for(int i = 0; i < n - 2; i++){
		temp2 = temp2->next;
	}
	temp1->next = temp2->next;
	temp2->next = temp1;
}

int main(){
	head = NULL; // empty list
	Insert(2, 1); // List: 2
	Insert(3, 2); // List: 2 3
	Insert(4, 1); // List: 4 2 3
	Insert(5, 2); // List: 4 5 2 3 
	Printf();
}
```

### Delete a node at $n^{th}$ position
```c
struct Node{
	int data;
	struct Node* next;
};

struct Node* head;

voide Insert(int data);

void Print();

void Delete(int n){
	struct Node* temp1 = head;
	if(n == 1){
		head = temp1->next; // head now points to second node.
		free(temp1);
		return; 
	}
	
	//temp1 points to the (n - 1)th node
	for(int i = 0; i < n - 2; i++) temp1 = temp1->next;
	struct Node* temp2 = temp1->next; //nth node
	temp1->next = tem2->next; // (n + 1)th node
	free(temp2);
}

int main(){
	head = NULL;
	Insert(2);
	Insert(4);
	Insert(6);
	Insert(5); // List: 2, 4, 6, 5
	int n;
	printf("Enter a position\n");
	scanf("%d", &n);
	Delete(n);
	Print();
}
```

### Reverse a linked list 
##### Iterative approach:
```c
struct Node{
	int data;
	struct Node* next;
};

struct Node* Reverse(struct Node* head){
	struct Node *cuurent, *prev, *next;
	current = head;
	prev = NULL;
	while(temp != NULL){
		next = current->next;
		current->next = prev;
		prev = current;
		current = next;
	}
	head = prev;
	return head; 
}

int main(){
	struct Node* head = NULL;
	head = Insert(head, 2);
	head = Insert(head, 4);
	head = Insert(head, 6);
	head = Insert(head, 8);
	Print(head);
	head = Reverse(head);
	Print(head);
}
```

##### Recursive approach:
```c
struct Node {
	int data;
	struct Node* next;
}

struct Node* head;

void ReversePrint(struct Node* p){
	if(p == NULL) return;
	ReversePrint(p->next);
	printf("%d ", p->data)
}

void Reverse(struct Node* p){
	if(p->next == NULL){
		head = p;
		return;
	}
	Reverse(p->next);
	struct Node* q = p->next;
	q->next = p;
	p->next = NULL;
}
```

## Stack
LIFO - Last In First Out 
A list with the restriction that insertion and deletion can be performed only from one end, called the top.
### Stack - Linked List implementation 
```c
struct Node {
	int data;
	struct Node* link;
};

struct Node* top = NULL;

void Push(int x){
	struct Node* temp = (struct Node*)malloc(sizeof(struct Node*));
	temp->data = x;
	temp->link = top;
	top = temp;
}

void Pop(){
	struct Node * temp;
	if(top == NULL) return;
	temp = top; // top is the head of the linked list so we basically want to remove the linked list he is pointing to
	top = top->link;
	free(temp);
}
```

## Queues
FIFO - First In First Out.
A list or collection with the restriction that insertion can be performed at one end (rear) and deletion can be performed at the other end (front).

### Operations (pseudocode)
```txt
int A[10];
front <- -1
rear <- -1 

isEmpty()
{
	if front == -1 && rear == -1
		return true
	else 
		return false
}

isFull()
{
	return rear == size(A) - 1
}

enqueue(x)
{
	if isFull()
		return
	else if isEmpty()
	{
		front <- rear <- 0
	}
	else
	{
		rear <- rear + 1
	}
	A[rear] <- x
}

dequeue()
{
	if isEmpty()
		return
	else if front == rear
		front <- rear <- -1
	else
		front <- front + 1
}

front()
{
	return A[front]
}
```

### Circular interpretation
In the circular interpretation of the array we can say the following:
- current position = i
- Next position = (i + 1) % N
- Previous position = (i + N - 1) % N
![[Pasted image 20260525201829.png]]

Taking this into account we can modify our previous functions to this:
```txt
int A[10];
front <- -1
rear <- -1 

isEmpty()
{
	if front == -1 && rear == -1
		return true
	else 
		return false
}

isFull()
{
	return (rear + 1) % N == front
}

enqueue(x)
{
	if isFull()
		return
	else if isEmpty()
	{
		front <- rear <- 0
	}
	else
	{
		rear <- (rear + 1) % N
	}
	A[rear] <- x
}

dequeue()
{
	if isEmpty()
		return
	else if front == rear
		front <- rear <- -1
	else
		front <- (front + 1) % N 
}

front()
{
	return A[front]
}
```

### Queue - Linked list implementation
 ![[Pasted image 20260525210656.png]]

```c
struct Node{
	int data;
	struct Node* next;
};

struct Node* front = NULL;
struct Node* rear = NULL;

void Enqueue(int x){
	struct Node* temp = (struct Node*)malloc(sizeof(struct Node*));
	temp->data = x;
	temp->next = NULL;
	if(front == NULL && rear == NULL){
		front = rear = temp;
		return;
	}
	rear->next = temp;
	rear = temp;
}

void Dequeue(){
	struct Node* temp = front;
	if(front == NULL) return;
	if(front == rear){
		front = rear = NULL;
	}
	else {
		front = front->next;
	}
	free(temp);
}