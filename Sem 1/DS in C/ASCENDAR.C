# include<stdio.h>
# include<conio.h>

void main()
{
	int arr[100];
	int N = -1;
	int i = -1;
	int j = -1;
	int temp = -1;
	int max = -1, min = -1;

	printf("\nEnter number of elements in array: ");
	scanf("%d", &N);
	printf("\nEnter elements separated by space: ");
	for (i = 0; i < N; ++i)
		scanf("%d", &arr[i]);


	// Ascending order using Bubble Sort
	for( i = 0; i < N-1; ++i) {
		for (j = 0; j < N-1; ++j) {
			if (arr[j] > arr[j + 1]) {
				temp = arr[j + 1];
				arr[j + 1] = arr[j];
				arr[j] = temp;
			}
		}
	}
	printf("\nElements in Ascending Order: ");
	for (i = 0; i < N; ++i)
		printf("%d ", arr[i]);

	printf("\nElements in Descending Order: ");
	for (i = (N - 1); i > -1; --i)
		printf("%d ", arr[i]);

	printf("\nMaximum Element: %d", arr[N - 1]);
	printf("\nMinimum Element: %d", arr[0]);

	getch();
	clrscr();
}

