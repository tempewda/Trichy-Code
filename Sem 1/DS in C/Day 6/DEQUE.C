#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

typedef struct Node {
	int data;
	struct Node *prev;
	struct Node *next;
}Node;

Node *front, *rear;

void display()
{
	Node *temp = front;

	//handle empty deque
	if (temp == NULL)
		printf("Deque empty!!Nothing to display...\n");
	else {
		printf("Items in deque: ");
		while(temp != NULL) {
			printf("%d ", temp->data);
			temp = temp->next;
		}
		printf("\n");
	}
	getch();
}

//enqueue at front or back depending upon mode
//mode = 0 means enqueue at front
//mode = 1 means enqueue at rear
void enqueue(int mode, int data)
{
	Node *newNode = (Node *)malloc(sizeof(Node));
	newNode->data = data;
	newNode->next = NULL;
	newNode->prev = NULL;

	//handle empty deque condition
	if (front == NULL && rear == NULL) {
		front = newNode;
		rear = newNode;
	}

	//deque not empty
	else {
		//enqueue at front
		if (mode == 0) {
			newNode->next = front;
			front->prev = newNode;
			front = newNode;
		}

		//enqueue at rear
		else {
			rear->next = newNode;
			newNode->prev = rear;
			rear = newNode;
		}
	}
	printf("%d enqueued...\n", data);
	display();
}

//mode = 0, means dequeue from front
//mode = 1, means dequeue from rear
void dequeue(int mode)
{
	Node *temp;

	//handle empty deque condition
	if (front == NULL && rear == NULL) {
		printf("Deque empty!!Nothing to dequeue...\n");
		getch();
		return;
	}

	//handle deque has only 1 element condition
	else if (front->next == NULL) {
		temp = front;
		front = NULL;
		rear = NULL;
	}

	//deque has multiple elements
	else {
		//dequeue from front
		if (mode == 0) {
			temp = front;
			front = front->next;
		}

		//dequeue from rear
		else {
			temp = rear;
			rear = rear->prev;
			rear->next = NULL;
		}
	}
	printf("%d dequeued...\n", temp->data);
	free(temp);
	display();
}

int main()
{
	int choice = -1, data = -1, mode = -1;

	clrscr();
	printf("Enter Deque mode:\n");
	printf("1. Input restricted deque\n");
	printf("2. Output restricted deque\n");
	printf("Input deque mode:");
	scanf("%d", &mode);
	mode-= 1;

	do {
		clrscr();

		//input restricted deque
		if (mode == 0) {
			printf("Input restricted deque using DLL:\n");
			printf("1. Enqueue\n");
			printf("2. Dequeue from front\n");
			printf("3. Dequeue from rear\n");
			printf("4. Display\n");
			printf("Enter your choice: ");
			scanf("%d", &choice);
			switch(choice) {
				case 1:
					printf("Data: ");
					scanf("%d", &data);
					enqueue(1, data);
					break;

				case 2:
					dequeue(0);
					break;

				case 3:
					dequeue(1);
					break;

				case 4:
					display();
					break;

				default:
					printf("Program aborted successfully!");
					getch();
					return 0;
			}
		}

		//output restricted deque
		else {
			printf("Output restricted deque using DLL:\n");
			printf("1. Enqueue at front\n");
			printf("2. Enqueue at rear\n");
			printf("3. Dequeue\n");
			printf("4. Display\n");
			printf("Enter your choice: ");
			scanf("%d", &choice);
			switch(choice) {
				case 1:
					printf("Data: ");
					scanf("%d", &data);
					enqueue(0, data);
					break;

				case 2:
					printf("Data: ");
					scanf("%d", &data);
					enqueue(1, data);
					break;

				case 3:
					dequeue(0);
					break;

				case 4:
					display();
					break;

				default:
					getch();
					return 0;
			}
		}
	}while(1);

	getch();
	clrscr();
	return 0;
}