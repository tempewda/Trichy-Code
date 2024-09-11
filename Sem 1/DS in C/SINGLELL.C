#include<stdio.h>
#include<string.h>
#include<conio.h>

typedef struct Inventory_Node {
	int product_id;
	char product_name[100];
	float price;
	struct Inventory_Node *next;
}Inventory_Node;

Inventory_Node *inv_head, *inv_tail;

typedef struct Trans_Node {
	int product_id;
	int items_bought;
	struct Trans_Node *next;
}Trans_Node;

Trans_Node *trans_head, *trans_tail;

Inventory_Node* create_inv_node(int product_id, char product_name[100], float price)
{
	Inventory_Node *new_inv_node = (Inventory_Node *)malloc(sizeof(Inventory_Node));
	new_inv_node->product_id = product_id;
	strcpy(new_inv_node->product_name, product_name);
	new_inv_node->price = price;

	return new_inv_node;
}

void insert_inv_node(int product_id, char product_name[100], float price)
{
	Inventory_Node *new_node = create_inv_node(product_id, product_name, price);

	// if LL is empty
	if(inv_head == NULL) {
		inv_head = new_node;
		inv_tail = new_node;
	}

	// insert new node at the end
	else {
		inv_tail->next = new_node;
		inv_tail = new_node;
	}
}

Trans_Node *create_trans_node(int product_id, int items_bought)
{
	Trans_Node *new_node = (Trans_Node*)malloc(sizeof(Trans_Node));
	new_node->product_id = product_id;
	new_node->items_bought = items_bought;
	new_node->next = NULL;

	return new_node;
}


Trans_Node *search_trans_node(int product_id)
{
	//traverse the LL searching for product_id
	Trans_Node *temp = trans_head;
	while(temp != NULL) {
		if (temp->product_id == product_id)
			break;
		temp = temp->next;
	}

	return temp;
}


//if product id already exists, increment number of items
//else create new node at the end
void insert_trans_node(int product_id, int items_bought)
{
	Trans_Node *target_node;
	Trans_Node *new_node = create_trans_node(product_id, items_bought);;


	// if transaction LL is empty
	if (trans_head == NULL) {
		trans_head = new_node;
		trans_tail = new_node;
	}

	else {
		//search for product_id
		target_node = search_trans_node(product_id);

		//if product id not found in LL then add node to last
		if(target_node == NULL) {
			trans_tail->next = new_node;
			trans_tail = new_node;
		}
		//else increase number of items bought
		else
			target_node->items_bought += items_bought;
	}
}

void delete_trans_node(int product_id)
{
	Trans_Node *
	// if LL is empty
	if (trans_head == NULL)
		printf("UnderFlow");


}

void display_trans()
{
	Trans_Node *temp = trans_head;
	printf("Transactions...\n");
	printf("ID\tNo of items\n");
	while (temp != NULL) {
		printf("%d\t%d\n", temp->product_id, temp->items_bought);
		temp = temp->next;
	}
}


int main()
{
       int i = 0;
       int product_id;
       char product_name[100];
       float price;
       Inventory_Node *temp;
       Trans_Node *trans;
       trans_head = NULL;
       trans_tail = NULL;
       inv_head = NULL;
       inv_tail = NULL;

       //filling the inventory
       /*
       printf("Filling the Inventory...\n");
       for(i = 0; i < 10; ++i) {
		printf("\nItem No %d\n", (i+1));
		printf("Product Id: ");
		scanf("%d", &product_id);
		printf("Name: ");
		scanf("%s", product_name);
		printf("Price: ");
		scanf("%f", &price);
		insert_inv_node(product_id, product_name, price);
       }*/

       insert_inv_node(45, "Mobile", 40000);
       insert_inv_node(46, "Pen", 20);
       insert_inv_node(47, "Bottle", 300);

       // Display the inventory
       temp = inv_head;
       printf("ID\tName\tPrice\n");
       while(temp != NULL) {
		printf("%d\t%s\t%f\n", temp->product_id, temp->product_name, temp->price);
		temp = temp->next;
       }

       /*
       insert_trans_node(45, 2);
       printf("%d %d\n", trans_head->product_id, trans_tail->product_id);
       insert_trans_node(46, 10);
       printf("%d %d\n", trans_head->product_id, trans_tail->product_id);
       insert_trans_node(47, 3);
       printf("%d %d\n", trans_head->product_id, trans_tail->product_id);
       trans = search_trans_node(46);
       printf("%d %d\n", trans->product_id, trans->items_bought); */

       printf("\nTransactions...\n");
       insert_trans_node(45, 2);
       insert_trans_node(46, 1);
       insert_trans_node(47, 3);
       display_trans();
       insert_trans_node(46, 10);
       display_trans();

       getch();
       clrscr();
       return 0;
}