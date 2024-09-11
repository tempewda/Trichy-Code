#include<stdio.h>
#include<stdlib.h>
#include<string.h>

struct Product_Node
{
    long product_id;
    char product_name[100];
    double price;
    struct Product_Node *next;
};


struct Transaction_Node
{
    long product_id;
    int no_of_items;
    double price;
};


// function to create a new inventory node
struct Product_Node *create_inventory_node(long product_id, char product_name[], double price)
{
    //create and initialize the new node
    struct Product_Node *new_node = (struct Product_Node *)malloc(sizeof(struct Product_Node));
    new_node->product_id = product_id;
    strcpy(new_node->product_name, product_name);
    new_node->price = price;
    new_node->next = NULL;

    return new_node;
}


// function to insert a new inventory node at the end of the inventory linked list
void insert_inventory_node(struct Product_Node *head, struct Product_Node *tail, struct Product_Node *new_node)
{
    // If the list is empty, make the new node as head and tail
    if(head == NULL) {
        head = new_node;
        tail = new_node;
    }

    else {
        tail->next = new_node;
        tail = new_node;
    }
}


// function to create an inventory linkedlist of 10 items
void create_inventory(struct Product_Node *head, struct Product_Node *tail)
{
    int index = 0;
    long product_id = 0l;
    char product_name[100];
    double price = 0.0;

    printf("Creating Inventory of 10 items...\n");

    for (index = 0; index < 10; index++) {
        // Input details of product
        printf("Item No. %d\n", index + 1);
        printf("Product id: ");
        scanf("%ld",&product_id);
        printf("Product name: ");
        scanf("%s",product_name);
        printf("Price: ");
        scanf(" %lf",&price);

        // Create new product node and insert it at the end
        struct Product_Node *new_node = create_inventory_node(product_id, product_name, price);
        insert_inventory_node(head, tail, new_node);
    }
}


void display_inventory(struct Product_Node *head)
{
    struct Product_Node *temp = head;

    printf("Inventory:\n");
    printf("Product ID\tProduct Name\tPrice\n");

    while (temp != NULL) {
        printf("%ld\t\t%s\t\t%.2lf\n", temp->product_id, temp->product_name, temp->price);
        temp = temp->next;
    }
}


int main()
{
    // Initialize the head and tail of the inventory linked list
    struct Product_Node *head = NULL;
    struct Product_Node *tail = NULL;

    // Create the inventory
    create_inventory(head, tail);

    // Display the inventory
    display_inventory(head);

    return 0;
}

