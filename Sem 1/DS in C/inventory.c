#include<stdio.h>

struct Product_Node
{
    long product_id;
    char product_name[100];
    double price;
    struct Product_Node *next;
};

struct Transaction_Node
{
    
}