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

## Output
```bash
BFS: 0 1 2 3 4 
DFS: 0 1 3 4 2 
```

# Problem 2
Use A* algorithm to solve 8-puzzle problem

## Code
```cpp
#include <iostream>
#include <vector>
#include <queue>
#include <set>
#include <cmath>
#include <algorithm>
#include <memory>

// Represents a state (a configuration of the puzzle board) in the search space.
struct Node {
	std::vector<int> board;      // The 3x3 board stored as a 1D vector. 0 represents the empty tile.
	std::shared_ptr<Node> parent; // Pointer to the parent node to reconstruct the path.
	int g;                       // Cost from the start node to this node (number of moves).
	int h;                       // Heuristic: estimated cost from this node to the goal.

	// f = g + h, the total estimated cost.
	int f() const {
			return g + h;
	}

	// Equality operator to check if two boards are the same.
	bool operator==(const Node& other) const {
			return board == other.board;
	}
};

// Custom comparator for the priority queue.
// It will order nodes based on their f-score, making the priority queue a min-heap.
struct CompareNodes {
	bool operator()(const std::shared_ptr<Node>& a, const std::shared_ptr<Node>& b) const {
		return a->f() > b->f();
	}
};


// --- Function Prototypes ---
void print_board(const std::vector<int>& board);
int calculate_misplaced_tiles(const std::vector<int>& board, const std::vector<int>& goal);
std::vector<std::shared_ptr<Node>> get_successors(const std::shared_ptr<Node>& current);
void solve_puzzle(const std::vector<int>& initial_board, const std::vector<int>& goal_board);
void print_solution_path(const std::shared_ptr<Node>& goal_node);


/**
 * @brief Main function to run the 8-puzzle solver.
 */
int main() {
	// The initial configuration of the puzzle. 0 is the empty tile.
	std::vector<int> initial_board = {1, 2, 3,
					  0, 4, 6,
					  7, 5, 8};

	// The goal configuration.
	std::vector<int> goal_board = {1, 2, 3,
                                       4, 5, 6,
                                       7, 8, 0};

	std::cout << "Initial Board:" << std::endl;
	print_board(initial_board);

	std::cout << "\nGoal Board:" << std::endl;
	print_board(goal_board);

	std::cout << "\nSolving..." << std::endl;
	solve_puzzle(initial_board, goal_board);

	return 0;
}


/**
 * @brief Prints the 3x3 puzzle board in a readable format.
 * @param board The board state to print.
 */
void print_board(const std::vector<int>& board) {
	for (int i = 0; i < 9; ++i) {
		if (i % 3 == 0) std::cout << std::endl;
		if (board[i] == 0) {
			std::cout << "  ";
		} else {
			std::cout << board[i] << " ";
		}
	}
	std::cout << std::endl << std::endl;
}


/**
 * @brief Calculates the number of misplaced tiles heuristic.
 * This counts how many tiles are not in their correct goal position.
 * @param board The current board state.
 * @param goal The goal board state.
 * @return The number of misplaced tiles.
 */
int calculate_misplaced_tiles(const std::vector<int>& board, const std::vector<int>& goal) {
	int misplaced_count = 0;
	for (int i = 0; i < 9; ++i) {
		// We don't count the empty tile (0) as misplaced
		if (board[i] != 0 && board[i] != goal[i]) {
			misplaced_count++;
		}
	}
	return misplaced_count;
}


/**
 * @brief Generates all valid successor states from a given state.
 * @param current The current node.
 * @return A vector of shared pointers to the successor nodes.
 */
std::vector<std::shared_ptr<Node>> get_successors(const std::shared_ptr<Node>& current) {
	std::vector<std::shared_ptr<Node>> successors;
	int empty_tile_pos = -1;

	// Find the position of the empty tile (0)
	for (int i = 0; i < 9; ++i) {
		if (current->board[i] == 0) {
			empty_tile_pos = i;
			break;
		}
	}

	int row = empty_tile_pos / 3;
	int col = empty_tile_pos % 3;

	// Possible moves: up, down, left, right
	int moves[4][2] = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};

	for (auto& move : moves) {
		int new_row = row + move[0];
		int new_col = col + move[1];

		// Check if the move is within the board boundaries
		if (new_row >= 0 && new_row < 3 && new_col >= 0 && new_col < 3) {
			std::vector<int> new_board_state = current->board;
			int new_empty_pos = new_row * 3 + new_col;

			// Swap the empty tile with the adjacent tile
			std::swap(new_board_state[empty_tile_pos], new_board_state[new_empty_pos]);

			auto successor = std::make_shared<Node>();
			successor->board = new_board_state;
			successor->parent = current;
			successor->g = current->g + 1;
			// h score will be calculated in the main loop

			successors.push_back(successor);
		}
	}
	return successors;
}


/**
 * @brief Prints the solution path from the goal node back to the start.
 * @param goal_node The goal node found by the A* algorithm.
 */
void print_solution_path(const std::shared_ptr<Node>& goal_node) {
	std::vector<std::shared_ptr<Node>> path;
	std::shared_ptr<Node> current = goal_node;
	while (current != nullptr) {
		path.push_back(current);
		current = current->parent;
	}
	std::reverse(path.begin(), path.end());

	std::cout << "Solution found in " << path.size() - 1 << " moves:" << std::endl;
	for (const auto& node : path) {
		print_board(node->board);
	}
}


/**
 * @brief Solves the 8-puzzle problem using the A* algorithm.
 * @param initial_board The starting configuration of the puzzle.
 * @param goal_board The target configuration of the puzzle.
 */
void solve_puzzle(const std::vector<int>& initial_board, const std::vector<int>& goal_board) {
	// The open list (priority queue) stores nodes to be evaluated.
	std::priority_queue<std::shared_ptr<Node>, std::vector<std::shared_ptr<Node>>, CompareNodes> open_list;
	
	// The closed list stores board states that have already been evaluated.
	// Using a set for fast lookups.
	std::set<std::vector<int>> closed_list;
	
	// Create the start node
	auto start_node = std::make_shared<Node>();
	start_node->board = initial_board;
	start_node->parent = nullptr;
	start_node->g = 0;
	start_node->h = calculate_misplaced_tiles(initial_board, goal_board);
	
	open_list.push(start_node);
	
	while (!open_list.empty()) {
		// Get the node with the lowest f-score from the open list
		std::shared_ptr<Node> current_node = open_list.top();
		open_list.pop();

		// If this is the goal, we are done
		if (current_node->board == goal_board) {
			print_solution_path(current_node);
			return;
		}

		// Add the current board state to the closed list to avoid re-evaluating it
		if (closed_list.count(current_node->board)) {
			continue;
		}
		closed_list.insert(current_node->board);

		// Generate successors
		for (auto& successor : get_successors(current_node)) {
			// Check if the successor is already in the closed list
			if (closed_list.count(successor->board)) {
				continue;
			}

			// Calculate heuristic for the successor
			successor->h = calculate_misplaced_tiles(successor->board, goal_board);

			// Add the valid successor to the open list
			open_list.push(successor);
		}
	}
	
	std::cout << "No solution found." << std::endl;
}
```

## Output
```bash
Initial Board:

1 2 3 
  4 6 
7 5 8 


Goal Board:

1 2 3 
4 5 6 
7 8   


Solving...
Solution found in 3 moves:

1 2 3 
  4 6 
7 5 8 


1 2 3 
4   6 
7 5 8 


1 2 3 
4 5 6 
7   8 


1 2 3 
4 5 6 
7 8   
```
