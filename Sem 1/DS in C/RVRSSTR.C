# include <stdio.h>
# include <conio.h>

int main()
{
    char str[100]; // store the input string
    char ch; // help input the string
    int top = -1; // denotes empty stack

    printf("Input string: ");

    // Enter the characters individually until \n is hit
    scanf("%c", &ch);
    while (ch != '\n') {
	str[++top] = ch;
	scanf("%c", &ch);
    }
    str[top + 1] = '\0';

    // Reverse the string using pop opertion
    printf("Reversed String: ");
    while (top >= 0)
	printf("%c", str[top--]);
    printf("\n");
    getch();
    clrscr();
    return 0;
}