#include <stdio.h>
#include <conio.h>

typedef struct Node {
	int data;
	struct Node* next;
}Node;

Node *front, *rear;

void display()
{
	Node *temp = front;

	//handle empty queue
	if (temp == NULL) {
		printf("Queue empty!! Nothing to display...\n");
		getch();
		return 0;
	}

	printf("Items in queue: ");
	while(temp != NULL) {
		printf("%d ", temp->data);
		temp = temp->next;
	}
	printf("\n");
	getch();
}

void enqueue(int item)
{
	Node* newNode = (Node *)malloc(sizeof(Node));
	newNode -> data = item;
	newNode -> next = NULL;

	//handle empty queue condition
	if (front == NULL) {
		front = newNode;
		rear = newNode;
	}
	else {
		rear -> next = newNode;
		rear = newNode;
	}
	printf("%d added to queue!\n", newNode -> data);
	display();
}

void dequeue()
{
	Node* temp = front;

	//handle empty queue condition
	if (front == NULL) {
		printf("Queue Empty!! Nothing to delete...\n");
		getch();
		return;
	}

	front = front -> next;
	printf("%d deleted from Queue!\n", temp->data);
	display();
}


int main()
{
	int choice = 0, item = -1;
	front = NULL;
	rear = NULL;

	do {
		clrscr();
		printf("1. Enqueue\n");
		printf("2. Dequeue\n");
		printf("3. Display\n");
		printf("Enter your choice:(4 to exit) ");
		scanf("%d", &choice);

		switch(choice) {
			case 1:
				printf("Item: ");
				scanf("%d", &item);
				enqueue(item);
				break;

			case 2:
				dequeue();
				break;

			case 3:
				display();
				break;

			default:
				return;
		}
	}while(1);

	//enqueue(2);
	//display();
	//enqueue(3);
	//display();
	//dequeue();
	//display();
	//dequeue();
	//dequeue();
	//display();

	getch();
	clrscr();
	return 0;
}