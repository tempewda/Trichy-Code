#include <iostream>

struct TreeNode {
    int data;
    struct Node *left;
    struct Node *right;

    
    TreeNode(int value) {
        data = value;
        left = right = NULL;
    }
};


void level_order(Node *root)
{
    // initialize queue
    int queue[100];
    int front = -1
}


int main()
{
    // Create a binary tree
    Node *root = new Node(10);
    root->left = new Node(20);
    root->right = new Node(30);
    root->left->left = new Node(40);
    root->left->right = new Node(50);

    return 0;
}