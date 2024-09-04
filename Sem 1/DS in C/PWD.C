#include <stdio.h>
#include <string.h>

int main()
{
    char password[100];
    int uppercase = 0, lowercase = 0, numbers = 0, special = 0;
    int index = 0;
    char character;

    printf("Enter password (min 8 characters): ");
    scanf("%s", password);

    while (strlen(password) < 8) {
	printf("Invalid Password...Try Again(min 8 characters): ");
	scanf("%s", password);
    }

    for(index = 0; index < strlen(password); ++index) {
	character = password[index];

	if (character >= 'A' && character <= 'Z')
	    ++uppercase;

	else if (character >= 'a' && character <= 'z')
	    ++lowercase;

	else if (character >= '0' && character <= '9')
	    ++numbers;
	else
	    ++special;
    }

    if(uppercase != 0 && lowercase != 0 && numbers != 0 && special != 0)
	printf("Password: Strong");
    else if(numbers != 0 && special != 0)
	printf("Password: Medium");
    else
	printf("Password: Weak");

    getch();
    clrscr();
    return 0;
}