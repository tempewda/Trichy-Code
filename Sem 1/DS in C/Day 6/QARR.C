#include<stdio.h>
#include<conio.h>

# define SIZE 10


void display(int queue[], int *front, int *rear)
{
	int i;
	printf("\nItems in queue:\n");
	for (i = *front; i <= *rear; ++i)
		printf("%d ", queue[i]);
	printf("\n");
}



// return 0 on failure, 1 on success
int enqueue(int queue[], int *front, int *rear, int item)
{
	//handle overflow condition
	if (*rear >= (SIZE - 1)) {
		printf("\nStack Overflow!!!\n");
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
		printf("\nUnderflow!! Nothing to dequeue...\n");
		return -1;
	}

	else {
		item = queue[*front];

		// shift items right by 1 place
		for (i = *front + 1; i <= *rear; ++i)
			queue[i - 1] = queue[i];

		//update rear position
		--*rear;
		printf("%d removed from queue", item);
		display(queue, front, rear);
		return item;
	}
}


int main()
{
	int queue[SIZE];
	int front = -1, rear = -1;

	enqueue(queue, &front, &rear, 10);
	enqueue(queue, &front, &rear, 9);
	enqueue(queue, &front, &rear, 8);
	enqueue(queue, &front, &rear, 7);
	dequeue(queue, &front, &rear);
	dequeue(queue, &front, &rear);
	dequeue(queue, &front, &rear);
	dequeue(queue, &front, &rear);
	dequeue(queue, &front, &rear);

	getch();
	clrscr();
	return 0;
}
