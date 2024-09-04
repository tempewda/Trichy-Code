#include <stdio.h>
int main()
{
	char answers[] = {'a', 'a', 'd', 'b', 'a', 'a'};
	char input;
	int index = 0;
	int score = 0;

	printf("What is the capital of India? (a) Delhi (b) Mumbai (c) Kolkata (d) Chennai\n");
	printf("1 + 1 = ? (a)2 (b)3 (c)4 (d)5\n");
	printf("2 x 5 = ? (a)2 (b)3 (c)4 (d)10\n");
	printf("2 + 2 / 2 + ? (a)2 (b)3 (c)4 (d)5\n");
	printf("2 / 3 of 9 = ? (a)6 (b)3 (c)4 (d)5\n");
	printf("(2 + 2) x 2 = ? (a)2 (b)3 (c)4 (d)9\n");

	for(index = 0; index < 6; index++) {
		scanf("%c", &input);
		if(input == answers[index])
			++score;
	}

	printf("Your score is: %d\n", score);

	getch();
	clrscr();
	return 0;
}