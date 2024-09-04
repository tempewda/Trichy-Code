# include<stdio.h>
# include<conio.h>

void main()
{
	int arr1[5], arr2[5], arr3[10];
	int i = -1;
	printf("\nEnter 5 elements into first array: ");
	for (i = 0; i < 5; ++i)
		scanf("%d", &arr1[i]);

	printf("\nEnter 5 elements into second array: ");
	for (i = 0; i < 5; ++i)
		scanf("%d", &arr2[i]);

	for (i = 0; i < 10; ++i) {
		if (i < 5)
			arr3[i] = arr1[i];
		else
			arr3[i] = arr2[i - 5];
	}

	printf("\nMerged Array: ");
	for (i = 0; i < 10; ++i)
		printf("%d ", arr3[i]);
	getch();
}