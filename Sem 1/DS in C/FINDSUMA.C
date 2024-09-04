# include<stdio.h>
# include<conio.h>

void main()
{
	int arr[5];
	int sum = 0, i = -1;

	printf("\nEnter 5 elements in an array: ");
	for(i = 0; i < 5; ++i) {
		scanf("%d", &arr[i]);
		sum += arr[i];
	}

	printf("\nSum of elements in array: %d", sum);
	getch();
}