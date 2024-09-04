# include<stdio.h>
# include<conio.h>

void main()
{
	int arr[10], duplicate_arr[10];
	int duplicates = 0, duplicate_arr_index = -1;
	int i = -1, j = -1;

	printf("\nEnter 10 elements in an array: ");
	for (i = 0; i < 10; ++i)
		scanf("%d", &arr[i]);

	duplicate_arr[0] = arr[0];
	duplicate_arr_index++;

	for (i = 1; i < 10; ++i) {
		int duplicate_found = 0;
		for (j = 0; j <= duplicate_arr_index; ++j) {
			if (arr[i] == duplicate_arr[j]) {
				duplicates++;
				duplicate_found = 1;
				break;
			}
		}

		if (!duplicate_found) {
			duplicate_arr_index++;
			duplicate_arr[duplicate_arr_index] = arr[i];
		}
	}

	printf("Duplicates: %d\n", duplicates);
	getch();
}