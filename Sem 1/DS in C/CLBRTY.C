# include <stdio.h>
# include <stdlib.h>
# include <conio.h>

int find_celebrity(const int size)
{
    int i = 0, j = 0, candidate = -1;
    int top = -1;
    int **matrix = (int**)malloc(size * sizeof(int*));
    int *stack = (int*)malloc(size * sizeof(int));
    for (i = 0; i < size; ++i)
	matrix[i] = (int*)malloc(size * sizeof(int));
    //int matrix[size][size];



    // input values in the matrix
    printf("Enter values into the matrix:\n");
    for (i = 0; i < size; ++i)
	for (j = 0; j < size; ++j)
	    scanf("%d", &matrix[i][j]);

    // intialize the stack
    for (top = 0; top < size; ++top)
	stack[top] = top;
    --top;

    while (top > 0) {
	// pop 2 items
	i = stack[top--];
	j = stack[top--];

	if (matrix[i][j] == 1 && matrix[j][i] == 0)
	    stack[++top] = j;

	else if (matrix[j][i] == 1 && matrix[i][j] == 0)
	    stack[++top] = i;
    }
    if (top == -1)
	return -1;

    // verify that candidate is celebrity indeed
    candidate = stack[top];

    for (i = 0; i < size; ++i)
	if (i != candidate)
	    if (matrix[candidate][i] == 1 || matrix[i][candidate] == 0)
		return -1;

    // all tests passed
    return candidate;
}

int main()
{
    int people = 0;
    int celebrity = -1;

    printf("Number of people: ");
    scanf("%d", &people);

    celebrity = find_celebrity(people);
    if (celebrity == -1)
	printf("\nNo Celebrity found!!\n");
    else
	printf("\nCelebrity: %d\n", celebrity);

    getch();
    clrscr();
    return 0;
}