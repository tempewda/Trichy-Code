#include<stdio.h>
#include<conio.h>

# define SIZE 4


void display(int queue[], int *front, int *rear)
{
	int i;

	//handle empty queue
	if (*front == -1) {
		printf("Queue empty!! Nothing to display...\n");
		getch();
		return;
	}

	printf("Items in queue: ");
	for (i = *front; i <= *rear; ++i)
		printf("%d ", queue[i]);
	printf("\n");
	getch();
}



// return 0 on failure, 1 on success
int enqueue(int queue[], int *front, int *rear, int item)
{
	//handle overflow condition
	if (*rear >= (SIZE - 1)) {
		printf("Queue full!! Can't enqueue...\n");
		getch();
		return 0;
	}

	//handle empty queue
	else if (*front == -1 && *rear == -1) {
		queue[++*front] = item;
		++*rear;
	}

	else {
		queue[++*rear] = item;
	}

	printf("%d added to queue!!\n", item);
	display(queue, front, rear);
	return 1;

}


int dequeue(int queue[], int *front, int *rear)
{
	int i = -1, item = -1;

	//handle underflow
	if (*front == -1) {
		printf("Queue empty!! Nothing to dequeue...\n");
		getch();
		return -1;
	}

	else {
		item = queue[*front];

		// shift items right by 1 place
		for (i = *front + 1; i <= *rear; ++i)
			queue[i - 1] = queue[i];

		//update rear position
		--*rear;

		if (*rear == -1)
			*front = -1;

		printf("%d removed from queue\n", item);
		display(queue, front, rear);
		return item;
	}
}


int main()
{
	int queue[SIZE];
	int front = -1, rear = -1;
	int choice = 0, item = -1;

	do {
		clrscr();
		printf("Queue using arrays:\n");
		printf("1. Enqueue\n");
		printf("2. Dequeue\n");
		printf("3. Display\n");
		printf("Enter your choice(others to exit): ");
		scanf("%d", &choice);

		switch(choice) {
			case 1:
				printf("Item: ");
				scanf("%d", &item);
				enqueue(queue, &front, &rear, item);
				break;

			case 2:
				dequeue(queue, &front, &rear);
				break;

			case 3:
				display(queue, &front, &rear);
				break;

			default:
				getch();
				return;
		}
	}while(1);
	getch();
	clrscr();
	return 0;
}
