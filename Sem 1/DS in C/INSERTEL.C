#include <stdio.h>
#include <conio.h>
void main()
{
	int arr[6];
	int i = -1;
	int insert_element = -1;
	int insertion_index = -1;
	int choice = -1;
	printf("\nEnter 5 elements into an array: ");
	for (i = 0; i < 5; ++i)
		scanf("%d", &arr[i]);
	printf("\nEnter element to be inserted: ");
	scanf("%d", &insert_element);

	printf("\n1. Insertion in beginning");
	printf("\n2. Insertion in middle");
	printf("\n3. Insertion at end");
	printf("\nEnter your choice: (1/2/3)");
	scanf("%d", &choice);

	switch(choice) {
		case 1:
		      for(i = 5; i > 0; --i)
			arr[i] = arr[i - 1];
		      arr[0] = insert_element;
		      break;

		case 2:
			printf("\nEnter index of array for insertion: ");
			scanf("%d", &insertion_index);

			for(i = 5; i > insertion_index; --i)
				arr[i] = arr[i - 1];
			arr[insertion_index] = insert_element;
			break;

		case 3:
			arr[5] = insert_element;
			break;

		default:
			printf("\nInvalid Input!! Enter 1, 2 or 3");
	}
	printf("\nElements in the array are: ");
	for(i = 0; i < 6; ++i)
		printf("%d ", arr[i]);

	getch();
}