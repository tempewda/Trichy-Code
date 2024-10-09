# include <stdio.h>
# include <conio.h>

# define SIZE 10
# define ADD 1
# define RMV 2

int actions[SIZE][2]; // store the last 10 actions, in order
// each action has the action and the item
int top = -1; // top of the actions stack
int cart[100]; // items in the cart, in order of their addition
int cart_index = -1; // last index of the cart queue
char items[6][10] = {"pencil", "pen", "eraser", "sharpner", "pencilbox", "notebook"};
int item = -1; // current item we're dealing with

// handle overflow in the actions stack
void actions_overflow()
{
	int i = -1;
	// handle overflow by shifting each element 1 step down
	if (top >= (SIZE - 1)) {
		// shift each element to 1 down
		for (i = 0; i < top; ++i) {
			actions[i][0] = actions[i + 1][0];
			actions[i][1] = actions[i + 1][1];
		}
		--top; // top points to the 2nd last element
	}
}

// add item to cart in order
// also add action to action stack
void add_cart(int item)
{
	actions_overflow(); // handle overflow condition if present
	actions[++top][0] = ADD;
	actions[top][1] = item;
	cart[++cart_index] = item;
	printf("\n%s added to cart!!\n", items[item]);
	getch();
}

// searches for the item starting from the end
// if item found, return 1 and remove it from cart
// else return 0
int rmv_cart(int item)
{
	int i = -1, j = -1;
	int found = 0; // whether item found in cart or not

	actions_overflow(); // handle overflow condition if present
	actions[++top][0] = RMV;
	actions[top][1] = item;

	// search for the item in cart frm end and remove it if found
	for(i = cart_index; i > -1; --i)
		if(cart[i] == item) {
			found = 1;

			// left-shift all the right elements by 1
			for (j = i; j < cart_index; ++j)
				cart[j] = cart[j + 1];

			// 1 item removed
			--cart_index;
			printf("\n%s removed from cart!\n", items[item]);
			getch();
			break;
		}
	return found;
}

// for pop, simply pop the last element
void undo()
{
	int action = -1, item = -1;

	// handle stack overflow if present
	actions_overflow();

	// handle empty actions stack
	if (top == -1) {
		printf("\nStack Empty!! Nothing to undo...");
		getch();
	}

	else
	{
		action = actions[top][0];
		item = actions[top][1];

		// if last action was ADD,
		// undo it by removing item from cart
		if (action == ADD) {
			if(!rmv_cart(item)) {
			// remove the added element from cart
			// print error message otherwise
				printf("\nUndo unsuccessful...");
				getch();
				return;
			}
		}

		// if item has been removed,
		// undo will add the item back to cart
		else if (action == RMV)
			add_cart(item);
		printf("\nUndo successful");
		getch();
	}
}

// push operation
void redo()
{
	int i = 0, action = -1, item = -1;
	// handle overflow if present
	actions_overflow();

	// handle empty actions stack
	if (top == -1) {
		printf("\nStack Empty!! Nothing to redo...");
		getch();
		return;
	}

	else
	{
		action = actions[top][0];
		item = actions[top][1];
		// if last action was ADD,
		// redo it by adding item to cart
		if (action == ADD)
			add_cart(item);

		// if item has been removed,
		// redo will try cart
		else if (action == RMV) {
			if(!rmv_cart(item)) {
			// remove the added element from cart
			// print error message otherwise
				printf("\nRedo unsuccessful...");
				getch();
				return;
			}
		}
	}
	printf("\nRedo successful");
	getch();
}

void display_cart()
{
	int i = -1;
	printf("\nItems in cart:\n");
	for (i = 0; i <= cart_index; ++i)
		printf("%s ", items[i]);
}

void display_actions()
{
	int i = -1;
	printf("\nLast 10 actions:\n");
	for (i = 0; i <= top; ++i) {
		if(actions[i][0] == ADD)
			printf("ADD ");
		else
			printf("RMV ");
		printf("%s\n", items[actions[i][1]]); // print the item name
	}
}


int main()
{
	int i = 0, j = 0;
	int choice = -1;

	// display all available items and possible actions
	do {
		clrscr();
		display_cart();
		display_actions();
		printf("Items: \n");
		for (i = 0; i < 6; ++i)
			printf("%d. %s\n", i, items[i]);

		printf("\nActions: \n");
		printf("1. Add\t4. Redo\n");
		printf("2. Remove\t5. Display Cart\n");
		printf("3. Undo\t6. Display Actions Stack\n");
		printf("7. Exit\n");
		printf("Enter your choice(1 - 7): ");
		scanf("%d", &choice);

		switch(choice) {
			case 1:
				printf("\nItem number: ");
				scanf("%d", &item);
				add_cart(item);
				break;

			case 2:
				printf("\nItem number: ");
				scanf("%d", &item);
				if(!rmv_cart(item))
					printf("Item not found in cart");
				break;

			case 3:
				undo();
				break;

			case 4:
				redo();
				break;

			case 5:
				display_cart();
				break;

			case 6:
				display_actions();
				break;

			case 7:
				printf("\nProgram terminated...");
				break;

			default:
				printf("Try again...");
		}
	}while(choice != 7);


	getch();
	clrscr();
	return 0;
}