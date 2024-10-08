#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    char name[50];
    struct Node *next;
};

struct Node *create_new_node(int data, char name[]) 
{
    struct Node *new_node = (struct Node *)malloc(sizeof(struct Node));
}