# Problem 1
BFS and DFS algorithm on Graphs


## Code
```cpp
#include <iostream>
#include <vector>
#include <queue>
#include <stack>

void bfs(const std::vector<std::vector<int>>& adj_list, const int nodes_count, const int source) {
	std::vector<bool> visited(nodes_count, false);
	std::queue<int> bfs_queue;

	std::cout << "BFS: ";
	bfs_queue.push(source);
	visited[source] = true;
	
	while(bfs_queue.size() > 0) {
		int curr = bfs_queue.front();
		bfs_queue.pop();
		std::cout << curr << " ";

		for (int neighbour : adj_list[curr]) {
			if(!visited[neighbour]) {
				bfs_queue.push(neighbour);
				visited[neighbour] = true;
			}
		}
	}
	std::cout << std::endl;
}


void dfs(const std::vector<std::vector<int>>& adj_list, const int nodes_count, const int source) {
	std::vector<bool> visited(nodes_count, false);
	std::stack<int> dfs_stack;

	std::cout << "DFS: ";
	dfs_stack.push(source);
	visited[source] = true;

	while (dfs_stack.size() > 0) {
		int curr = dfs_stack.top();
		dfs_stack.pop();
		std::cout << curr << " ";

		for (int index = (adj_list[curr].size() - 1); index >= 0; --index) {
			int neighbour = adj_list[curr][index];
			if (!visited[neighbour]) {
				dfs_stack.push(neighbour);
				visited[neighbour] = true;
			}
		}
	}
	std::cout << std::endl;
}


int main() {
std::vector<std::vector<int>> adj_list = {{1, 2}, {0, 2, 3}, {0, 1, 4}, {1, 4}, {2, 3}};
	int nodes_count = adj_list.size();

	bfs(adj_list, nodes_count, 0);
	dfs(adj_list, nodes_count, 0);

	return 0;
}
```

# Problem 2
Use A* algorithm to solve 8-puzzle problem

## Code
```cpp

```
