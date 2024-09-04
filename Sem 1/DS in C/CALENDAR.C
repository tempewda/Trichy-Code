#include <stdio.h>
#include <conio.h>

char months[][10] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
char month_days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
char days[][10] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};


int is_leap_year(int year)
{
	int is_leap = 0;

	if(year % 100 == 0 && year % 400 == 0)
		is_leap = 1;
	else if (year % 4 == 0)
		is_leap = 1;

	return is_leap;
}


int day_of_week(int month, int year)
{
	int temp[] = {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};
	int day = 1;
	int dow = 0;
	year -= month < 3;
	dow = (year + year/4 - year/100 + year/400 + temp[month - 1] + day) % 7;

	return dow;
}


void print_calendar(int month, int year)
{
	int index = 0;
	int day = -1;
	int dow = day_of_week(month, year);
	int current_dow = 0;

	// print day names
	for(index = 0; index < 7; ++index) {
		printf("%c%c%c\t", days[index][0], days[index][1], days[index][2]);
	}

	printf("\n");

	// print the spaces before dates
	for(index = 0; index < dow; ++index) {
		++current_dow;
		printf("\t");
	}

	for(day = 1; day <= month_days[month - 1]; ++day) {
		if(current_dow >= 7) {
			current_dow = 0;
			printf("\n");
		}
		printf("%d\t", day);
		++current_dow;
	}
}


int main()
{
	int exit = 0;
	int index = 0;
	int year = 0;
	int month = 0;

	for(index = 0; index < 12; ++index)
		printf("%s\n", months[index]);

	printf("Check for day of month: \n");
	while(!exit) {
		printf("Year: ");
		scanf("%d", &year);
		if(is_leap_year(year))
			month_days[1] = 29;
		else
			month_days[1] = 28;
		printf("Month: ");
		scanf("%d", &month);
		printf("Day of week: %s\n", days[day_of_week(month, year)]);

		print_calendar(month, year);
		printf("\nExit??(0 or 1)");
		scanf("%d", &exit);
	}

	getch();
	clrscr();

	return 0;
}