# Problem 1
Solve 8-puzzle problem using Hill Climbing [Steepest Ascent] approach

## Code
```cpp
#include <iostream>
#include <vector>
#include <algorithm>	// for std::find()

struct State {
	std::vector<int> board;
	int h_score;
};

// function declarations
void print_board(const std::vector<int>& board);
int calculate_heuristic(const std::vector<int>& current_board, const std::vector<int>& goal_board);
std::vector<State> get_neighbours(const State& current_state, const std::vector<int>& goal_board);
void solve_with_hill_climbing(const std::vector<int>& initial_board, const std::vector<int>& goal_board);

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
	solve_with_hill_climbing(initial_board, goal_board);
}


void print_board (const std::vector<int>& board) {
	int index = 0;
	for (int i = 0; i < 3; ++i) {
		for (int j = 0; j < 3; ++j) {
			if (board[index] == 0)
				std::cout << "  ";
			else
				std::cout << board[index] << ' ';
			++index;
		}
		std::cout << std::endl;
	}
}


int calculate_heuristic(const std::vector<int>& current_board, const std::vector<int>& goal_board) {
	int total_distance = 0;

	for (int current_tile = 1; current_tile < 9; ++current_tile) {
		int current_pos = -1, goal_pos = -1;

		// search num tile on the current board
		for (int index = 0; index < 9; ++index) {
			if (current_board[index] == current_tile) {
				current_pos = index;
				break;
			}
		}

		// search num tile on the goal board
		for (int index = 0; index < 9; ++index) {
			if (goal_board[index] == current_tile) {
				goal_pos = index;
				break;
			}
		}

		int current_row = current_pos / 3;
		int current_col = current_pos % 3;
		int goal_row = goal_pos / 3;
		int goal_col = goal_pos % 3;
		int distance_for_tile = abs(current_row - goal_row) + abs(current_col - goal_col);
		total_distance += distance_for_tile;
	}

	return total_distance;
}


std::vector<State> get_neighbours(const State& current_state, const std::vector<int>& goal_board) {
	int empty_tile_index = -1;
	std::vector<State> neighbours;
	std::vector<int> current_board = current_state.board;
	
	for (int index = 0; index < 9; ++index) {
		if (current_board[index] == 0) {
			empty_tile_index = index;
			break;
		}
	}

	int empty_tile_row = empty_tile_index / 3;
	int empty_tile_col = empty_tile_index % 3;

	// generate the 4 states
	// 0 tile moves up
	if (empty_tile_row != 0) {
		std::vector<int> new_board = current_board;
		new_board[empty_tile_index] = new_board[empty_tile_index - 3];
		new_board[empty_tile_index - 3] = 0;
		int h_score = calculate_heuristic(new_board, goal_board);
		neighbours.push_back({new_board, h_score});
	}

	// 0 tile moves down
	if (empty_tile_row != 2) {
		std::vector<int> new_board = current_board;
		new_board[empty_tile_index] = new_board[empty_tile_index + 3];
		new_board[empty_tile_index + 3] = 0;
		int h_score = calculate_heuristic(new_board, goal_board);
		neighbours.push_back({new_board, h_score});
	}

	// 0 tile moves left
	if (empty_tile_col != 0) {
		std::vector<int> new_board = current_board;
		new_board[empty_tile_index] = new_board[empty_tile_index - 1];
		new_board[empty_tile_index - 1] = 0;
		int h_score = calculate_heuristic(new_board, goal_board);
		neighbours.push_back({new_board, h_score});
	}

	// 0 tile moves right
	if (empty_tile_col != 2) {
		std::vector<int> new_board = current_board;
		new_board[empty_tile_index] = new_board[empty_tile_index + 1];
		new_board[empty_tile_index + 1] = 0;
		int h_score = calculate_heuristic(new_board, goal_board);
		neighbours.push_back({new_board, h_score});
	}

	return neighbours;
}


void solve_with_hill_climbing(const std::vector<int>& initial_board, const std::vector<int>& goal_board) {
	State current_state {initial_board, calculate_heuristic(initial_board, goal_board)};

	while (true) {
		std::cout << "\nCurrent State:\n";
		print_board(current_state.board);
		std::cout << "Manhattan distance: " << current_state.h_score << std::endl;

		if (current_state.h_score == 0) {
			std::cout << "Goal State Reached!" << std::endl;
			break;
		}

		std::vector<State> neighbours = get_neighbours(current_state, goal_board);
		State next_state = current_state;

		for (State& neighbour : neighbours) {
			if (neighbour.h_score < next_state.h_score)
				next_state = neighbour;
		
		}

		if (next_state.h_score == current_state.h_score) {
			std::cout << "Goal State can't be reached..." << std::endl;
			break;
		}
		else
			current_state = next_state;
	}
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

Current State:
1 2 3 
  4 6 
7 5 8 
Manhattan distance: 3

Current State:
1 2 3 
4   6 
7 5 8 
Manhattan distance: 2

Current State:
1 2 3 
4 5 6 
7   8 
Manhattan distance: 1

Current State:
1 2 3 
4 5 6 
7 8   
Manhattan distance: 0
Goal State Reached!
```
