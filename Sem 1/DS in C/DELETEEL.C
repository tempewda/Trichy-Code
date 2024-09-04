# include <stdio.h>
# include <conio.h>

void main()
{
	int arr[5];
	int delete_index = -1;
	int i = -1;
	int choice = -1;

	printf("\nEnter 5 elements in an array: ");
	for(i = 0; i < 5; ++i)
		scanf("%d", &arr[i]);

	printf("\n1. Deletion in beginning");
	printf("\n2. Deletion in middle");
	printf("\n3. Deletion at end");
	printf("\nEnter your choice: (1/2/3)");
	scanf("%d", &choice);

	switch(choice) {
		case 1:
		      for(i = 0; i < 4; ++i)
			arr[i] = arr[i + 1];
		      arr[4] = 0;
		      break;

		case 2:
			printf("\nEnter index of element to be deleted: ");
			scanf("%d", &delete_index);

			for(i = delete_index; i < 4; ++i)
				arr[i] = arr[i + 1];
			arr[4] = 0;
			break;

		case 3:
			arr[4] = 0;
			break;

		default:
			printf("\nInvalid Input!! Enter 1, 2 or 3");
	}

	printf("\nArray after deletion: ");
	for(i = 0; i < 5; ++i)
		printf("%d ", arr[i]);

	getch();
}
