# Helper Header File
MLP.h
```cpp
#include <iostream>
#include <vector>
#include <cmath>
#include <cstdlib>
#include <ctime>

using namespace std;

double sigmoid(double x) {
		return 1.0 / (1.0 + exp(-x));
}

double sigmoid_derivative(double x) {
		return x * (1 - x);
}

class MLP {
private:
		int input_size, output_size;
		int hidden_layers;
		int hidden_neurons;
		double learning_rate;

		vector<vector<double>> inputs;
		vector<vector<double>> targets;

		vector<vector<double>> layers;
		vector<vector<vector<double>>> weights;
		vector<vector<double>> biases;

public:
		MLP(int input_size, int hidden_layers, int hidden_neurons, int output_size, double learning_rate, vector<vector<double>> inputs, vector<vector<double>> targets)
				: input_size(input_size), hidden_layers(hidden_layers), hidden_neurons(hidden_neurons),
					output_size(output_size), learning_rate(learning_rate), inputs(inputs), targets(targets) {

				layers.push_back(vector<double>(input_size));
				for (int i = 0; i < hidden_layers; ++i)
						layers.push_back(vector<double>(hidden_neurons));
				layers.push_back(vector<double>(output_size));


				srand(time(0));
				for (int l = 0; l < layers.size() - 1; ++l) {
						vector<vector<double>> layer_weights(layers[l + 1].size(), vector<double>(layers[l].size()));
						for (auto& neuron_weights : layer_weights)
								for (double& w : neuron_weights)
										w = ((double)rand() / RAND_MAX) * 2 - 1;
						weights.push_back(layer_weights);

						vector<double> layer_biases(layers[l + 1].size());
						for (double& b : layer_biases)
								b = ((double)rand() / RAND_MAX) * 2 - 1;
						biases.push_back(layer_biases);
				}
		}

		void forward(const vector<double>& input) {
				layers[0] = input;
				for (int l = 1; l < layers.size(); ++l) {
						for (int j = 0; j < layers[l].size(); ++j) {
								double sum = biases[l - 1][j];
								for (int i = 0; i < layers[l - 1].size(); ++i) {
										sum += weights[l - 1][j][i] * layers[l - 1][i];
								}
								layers[l][j] = sigmoid(sum);
						}
				}
		}

		void backward(const vector<double>& target) {
				vector<vector<double>> deltas(layers.size());

				int L = layers.size() - 1;
				deltas[L] = vector<double>(layers[L].size());
				for (int i = 0; i < layers[L].size(); ++i) {
						double error = target[i] - layers[L][i];
						deltas[L][i] = error * sigmoid_derivative(layers[L][i]);
				}
				for (int l = L - 1; l > 0; --l) {
						deltas[l] = vector<double>(layers[l].size());
						for (int i = 0; i < layers[l].size(); ++i) {
								double error = 0;
								for (int j = 0; j < layers[l + 1].size(); ++j) {
										error += deltas[l + 1][j] * weights[l][j][i];
								}
								deltas[l][i] = error * sigmoid_derivative(layers[l][i]);
						}
				}

				for (int l = 0; l < weights.size(); ++l) {
						for (int j = 0; j < weights[l].size(); ++j) {
								for (int i = 0; i < weights[l][j].size(); ++i) {
										weights[l][j][i] += learning_rate * deltas[l + 1][j] * layers[l][i];
								}
								biases[l][j] += learning_rate * deltas[l + 1][j];
						}
				}
		}

		void train(int epochs) {
				for (int e = 0; e < epochs; ++e) {
						double total_error = 0.0;
						for (int i = 0; i < inputs.size(); ++i) {
								forward(inputs[i]);
								backward(targets[i]);
								for (int j = 0; j < targets[i].size(); ++j) {
										double err = targets[i][j] - layers.back()[j];
										total_error += err * err;
								}
						}
						if (e % 1000 == 0)
								cout << "Epoch " << e << ", Error: " << total_error << endl;
				}
		}

		void test(vector<vector<double>> train_data) {
				cout << "\nTesting on given inputs:\n";
				for (int i = 0; i < train_data.size(); ++i) {
						forward(train_data[i]);
						cout<<"(";
						for(int j=0;j<train_data[i].size();j++){
								cout<<train_data[i][j];
								if(j!=train_data[i].size()-1){
										cout<<", ";
								}
						}
						cout<<")\t=\t(";
						for(int j=0;j<layers.back().size();j++){
								cout<<round(layers.back()[j]);
								if(j!=layers.back().size()-1){
										cout<<", ";
								}
						}
						cout<<")"<<endl;
				}
		}
};
```

# Problem 1
Implement Multi-Layer Perceptron (MLP) model with back propagation gradient descent to solve the XOR function. Get user input number of layers, neurons and learning rate.

## Code
```cpp
#include"MLP.h"

int main() {
		int hidden_layers = 1, hidden_neurons = 2;
		double learning_rate = 0.9;

		MLP mlp(2, hidden_layers, hidden_neurons, 1, learning_rate, {{0, 0}, {0, 1}, {1, 0}, {1, 1}}, {{0}, {1}, {1}, {0}});
		mlp.train(100000);
		mlp.test({{0, 0}, {0, 1}, {1, 0}, {1, 1}});

		return 0;
}
```

## Output
```bash
Epoch 0, Error: 1.1625
Epoch 1000, Error: 0.0891748
Epoch 2000, Error: 0.00627267
Epoch 3000, Error: 0.00307435
Epoch 4000, Error: 0.00201485
Epoch 5000, Error: 0.00149194
Epoch 6000, Error: 0.0011818
Epoch 7000, Error: 0.000977034
Epoch 8000, Error: 0.000831974
Epoch 9000, Error: 0.000723945
Epoch 10000, Error: 0.000640437
Epoch 11000, Error: 0.00057399
Epoch 12000, Error: 0.000519884
Epoch 13000, Error: 0.00047499
Epoch 14000, Error: 0.000437149
Epoch 15000, Error: 0.000404829
Epoch 16000, Error: 0.000376909
Epoch 17000, Error: 0.000352552
Epoch 18000, Error: 0.000331119
Epoch 19000, Error: 0.000312117
Epoch 20000, Error: 0.000295155
Epoch 21000, Error: 0.000279924
Epoch 22000, Error: 0.000266172
Epoch 23000, Error: 0.000253695
Epoch 24000, Error: 0.000242324
Epoch 25000, Error: 0.000231918
Epoch 26000, Error: 0.000222362
Epoch 27000, Error: 0.000213554
Epoch 28000, Error: 0.000205411
Epoch 29000, Error: 0.00019786
Epoch 30000, Error: 0.00019084
Epoch 31000, Error: 0.000184297
Epoch 32000, Error: 0.000178183
Epoch 33000, Error: 0.000172458
Epoch 34000, Error: 0.000167087
Epoch 35000, Error: 0.000162037
Epoch 36000, Error: 0.000157281
Epoch 37000, Error: 0.000152793
Epoch 38000, Error: 0.000148553
Epoch 39000, Error: 0.000144539
Epoch 40000, Error: 0.000140735
Epoch 41000, Error: 0.000137124
Epoch 42000, Error: 0.000133692
Epoch 43000, Error: 0.000130427
Epoch 44000, Error: 0.000127316
Epoch 45000, Error: 0.000124348
Epoch 46000, Error: 0.000121515
Epoch 47000, Error: 0.000118807
Epoch 48000, Error: 0.000116216
Epoch 49000, Error: 0.000113735
Epoch 50000, Error: 0.000111356
Epoch 51000, Error: 0.000109075
Epoch 52000, Error: 0.000106884
Epoch 53000, Error: 0.000104779
Epoch 54000, Error: 0.000102754
Epoch 55000, Error: 0.000100806
Epoch 56000, Error: 9.89293e-05
Epoch 57000, Error: 9.71209e-05
Epoch 58000, Error: 9.5377e-05
Epoch 59000, Error: 9.36941e-05
Epoch 60000, Error: 9.20691e-05
Epoch 61000, Error: 9.04991e-05
Epoch 62000, Error: 8.89814e-05
Epoch 63000, Error: 8.75133e-05
Epoch 64000, Error: 8.60926e-05
Epoch 65000, Error: 8.47169e-05
Epoch 66000, Error: 8.33842e-05
Epoch 67000, Error: 8.20924e-05
Epoch 68000, Error: 8.08398e-05
Epoch 69000, Error: 7.96245e-05
Epoch 70000, Error: 7.8445e-05
Epoch 71000, Error: 7.72997e-05
Epoch 72000, Error: 7.61871e-05
Epoch 73000, Error: 7.51059e-05
Epoch 74000, Error: 7.40547e-05
Epoch 75000, Error: 7.30323e-05
Epoch 76000, Error: 7.20375e-05
Epoch 77000, Error: 7.10693e-05
Epoch 78000, Error: 7.01266e-05
Epoch 79000, Error: 6.92085e-05
Epoch 80000, Error: 6.83138e-05
Epoch 81000, Error: 6.74419e-05
Epoch 82000, Error: 6.65918e-05
Epoch 83000, Error: 6.57627e-05
Epoch 84000, Error: 6.49539e-05
Epoch 85000, Error: 6.41645e-05
Epoch 86000, Error: 6.3394e-05
Epoch 87000, Error: 6.26417e-05
Epoch 88000, Error: 6.19069e-05
Epoch 89000, Error: 6.1189e-05
Epoch 90000, Error: 6.04875e-05
Epoch 91000, Error: 5.98018e-05
Epoch 92000, Error: 5.91313e-05
Epoch 93000, Error: 5.84756e-05
Epoch 94000, Error: 5.78342e-05
Epoch 95000, Error: 5.72066e-05
Epoch 96000, Error: 5.65924e-05
Epoch 97000, Error: 5.59912e-05
Epoch 98000, Error: 5.54025e-05
Epoch 99000, Error: 5.4826e-05

Testing on given inputs:
(0, 0)  =   (0)
(0, 1)  =   (1)
(1, 0)  =   (1)
(1, 1)  =   (0)
```

# Problem 2
Consider the following small spam email detection dataset. It has three features (3 columns) and an output is_spam. Use 5 neurons for hidden layer and one neuron for output. Traing data: 8 rows; Test data: 2 rows. Train MLP with backpropagation on train data. Test predictions on test data.

| has_offer | has_money | has_click | is_spam |
| :-------- | :-------- | :-------- | :------ |
| 1         | 1         | 1         | 1       |
| 1         | 1         | 0         | 1       |
| 0         | 1         | 1         | 1       |
| 1         | 0         | 1         | 1       |
| 0         | 0         | 1         | 0       |
| 0         | 0         | 0         | 0       |
| 0         | 1         | 0         | 0       |
| 1         | 0         | 0         | 0       |
| 0         | 1         | 1         | 1       |
| 1         | 0         | 1         | 1       |

## Code
```cpp
#include"MLP.h"

int main() {
		int hidden_layers = 2, hidden_neurons = 5;
		double learning_rate = 0.9;

		vector<vector<double>> inputs = {
				{1,1,1},
				{1,1,0},
				{0,1,1},
				{1,0,1},
				{0,0,1},
				{0,0,0},
				{0,1,0},
				{1,0,0}
		};
		vector<vector<double>> targets = {{1}, {1}, {1}, {1}, {0}, {0}, {0}, {0}};

		MLP mlp(3, hidden_layers, hidden_neurons, 1, learning_rate, inputs, targets);
		mlp.train(100000);
		mlp.test({{0,1,1},{1,0,1}});

		return 0;
}
```

## Output
```cpp
Epoch 0, Error: 2.29665
Epoch 1000, Error: 0.0010338
Epoch 2000, Error: 0.000456169
Epoch 3000, Error: 0.00028737
Epoch 4000, Error: 0.000208144
Epoch 5000, Error: 0.000162479
Epoch 6000, Error: 0.0001329
Epoch 7000, Error: 0.000112234
Epoch 8000, Error: 9.70074e-05
Epoch 9000, Error: 8.53382e-05
Epoch 10000, Error: 7.61193e-05
Epoch 11000, Error: 6.8658e-05
Epoch 12000, Error: 6.24993e-05
Epoch 13000, Error: 5.73321e-05
Epoch 14000, Error: 5.29367e-05
Epoch 15000, Error: 4.91536e-05
Epoch 16000, Error: 4.58641e-05
Epoch 17000, Error: 4.29784e-05
Epoch 18000, Error: 4.04269e-05
Epoch 19000, Error: 3.81553e-05
Epoch 20000, Error: 3.61202e-05
Epoch 21000, Error: 3.42869e-05
Epoch 22000, Error: 3.2627e-05
Epoch 23000, Error: 3.11171e-05
Epoch 24000, Error: 2.97381e-05
Epoch 25000, Error: 2.84736e-05
Epoch 26000, Error: 2.73102e-05
Epoch 27000, Error: 2.62362e-05
Epoch 28000, Error: 2.52419e-05
Epoch 29000, Error: 2.43187e-05
Epoch 30000, Error: 2.34593e-05
Epoch 31000, Error: 2.26575e-05
Epoch 32000, Error: 2.19075e-05
Epoch 33000, Error: 2.12047e-05
Epoch 34000, Error: 2.05447e-05
Epoch 35000, Error: 1.99238e-05
Epoch 36000, Error: 1.93385e-05
Epoch 37000, Error: 1.87861e-05
Epoch 38000, Error: 1.82637e-05
Epoch 39000, Error: 1.7769e-05
Epoch 40000, Error: 1.72999e-05
Epoch 41000, Error: 1.68545e-05
Epoch 42000, Error: 1.6431e-05
Epoch 43000, Error: 1.60279e-05
Epoch 44000, Error: 1.56437e-05
Epoch 45000, Error: 1.52772e-05
Epoch 46000, Error: 1.49271e-05
Epoch 47000, Error: 1.45925e-05
Epoch 48000, Error: 1.42722e-05
Epoch 49000, Error: 1.39654e-05
Epoch 50000, Error: 1.36713e-05
Epoch 51000, Error: 1.33891e-05
Epoch 52000, Error: 1.31181e-05
Epoch 53000, Error: 1.28577e-05
Epoch 54000, Error: 1.26072e-05
Epoch 55000, Error: 1.23661e-05
Epoch 56000, Error: 1.21339e-05
Epoch 57000, Error: 1.19101e-05
Epoch 58000, Error: 1.16943e-05
Epoch 59000, Error: 1.1486e-05
Epoch 60000, Error: 1.12848e-05
Epoch 61000, Error: 1.10905e-05
Epoch 62000, Error: 1.09026e-05
Epoch 63000, Error: 1.07209e-05
Epoch 64000, Error: 1.0545e-05
Epoch 65000, Error: 1.03747e-05
Epoch 66000, Error: 1.02097e-05
Epoch 67000, Error: 1.00498e-05
Epoch 68000, Error: 9.89477e-06
Epoch 69000, Error: 9.74434e-06
Epoch 70000, Error: 9.59833e-06
Epoch 71000, Error: 9.45656e-06
Epoch 72000, Error: 9.31885e-06
Epoch 73000, Error: 9.18502e-06
Epoch 74000, Error: 9.05491e-06
Epoch 75000, Error: 8.92837e-06
Epoch 76000, Error: 8.80527e-06
Epoch 77000, Error: 8.68545e-06
Epoch 78000, Error: 8.5688e-06
Epoch 79000, Error: 8.45518e-06
Epoch 80000, Error: 8.34449e-06
Epoch 81000, Error: 8.23661e-06
Epoch 82000, Error: 8.13143e-06
Epoch 83000, Error: 8.02887e-06
Epoch 84000, Error: 7.92881e-06
Epoch 85000, Error: 7.83118e-06
Epoch 86000, Error: 7.73588e-06
Epoch 87000, Error: 7.64284e-06
Epoch 88000, Error: 7.55196e-06
Epoch 89000, Error: 7.46319e-06
Epoch 90000, Error: 7.37645e-06
Epoch 91000, Error: 7.29167e-06
Epoch 92000, Error: 7.20878e-06
Epoch 93000, Error: 7.12772e-06
Epoch 94000, Error: 7.04844e-06
Epoch 95000, Error: 6.97087e-06
Epoch 96000, Error: 6.89497e-06
Epoch 97000, Error: 6.82067e-06
Epoch 98000, Error: 6.74793e-06
Epoch 99000, Error: 6.6767e-06

Testing on given inputs:
(0, 1, 1)   =   (1)
(1, 0, 1)   =   (1)
```

# Problem 3
Test the following data with three outputs spam, promotional or phishing.
| has_offer | has_money | has_click | has_link | is_spam | is_promotional | is_phishing |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| 1 | 1 | 0 | 1 | 1 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 | 0 | 1 |
| 1 | 0 | 1 | 1 | 1 | 1 | 0 |
| 0 | 0 | 1 | 0 | 0 | 1 | 0 |
| 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 | 0 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 1 | 1 | 0 | 1 |
| 1 | 0 | 1 | 1 | 1 | 1 | 0 |

## Code
```cpp
#include"MLP.h"

int main(){
		vector<vector<double>> inputs = {
				{1,1,1,1},
				{1,1,0,1},
				{0,1,1,0},
				{1,0,1,1},
				{0,0,1,0},
				{0,0,0,0},
				{0,1,0,0},
				{1,0,0,1},
				{0,1,1,1},
				{1,0,1,1},
				{1,1,1,0},
				{0,1,0,1},
				{1,0,1,0},
				{1,1,0,0},
				{0,0,1,1},
				{1,0,0,0},
				{0,1,1,0},
				{1,1,1,1},
				{0,0,0,1},
				{1,0,1,1},
				{0,1,0,0},
				{1,1,1,0},
				{0,0,1,1},
				{1,0,0,1},
				{0,1,1,0},
				{1,1,0,1},
				{0,0,0,0},
				{1,0,1,0},
				{0,1,0,1},
				{1,1,1,1}
		};

		vector<vector<double>> targets = {
				{1,1,1},
				{1,1,0},
				{1,0,1},
				{1,1,0},
				{0,1,0},
				{0,0,0},
				{0,0,1},
				{0,1,0},
				{1,0,1},
				{1,1,0},
				{1,1,1},
				{0,1,1},
				{1,1,0},
				{1,0,0},
				{0,1,1},
				{0,0,0},
				{1,0,1},
				{1,1,1},
				{0,0,0},
				{1,1,0},
				{0,0,1},
				{1,1,1},
				{0,1,1},
				{0,1,0},
				{1,0,1},
				{1,1,0},
				{0,0,0},
				{1,1,0},
				{0,1,1},
				{1,1,1}
		};

		vector<vector<double>> test = {
				{1,1,1,1},
				{1,1,0,1},
				{0,1,1,0},
				{1,0,1,1},
				{0,0,1,0},
				{0,0,0,0},
				{0,1,0,0},
				{1,0,0,1},
				{0,1,1,1},
				{1,0,1,1}
		};
		vector<vector<double>> expected_output = {
				{1, 1, 1},
				{1, 1, 0},
				{1, 1, 0},
				{1, 1, 1},
				{0, 0, 0},
				{0, 0, 0},
				{0, 1, 0},
				{1, 1, 0},
				{1, 1, 1},
				{1, 1, 1}
		};

		MLP mlp(4, 3, 8, 3, 0.9, inputs, targets);
		mlp.train(100000);
		mlp.test(test);
		return 0;
}
```

## Output
```bash
Epoch 0, Error: 27.5052
Epoch 1000, Error: 1.00818
Epoch 2000, Error: 1.00374
Epoch 3000, Error: 1.0024
Epoch 4000, Error: 1.00176
Epoch 5000, Error: 1.00138
Epoch 6000, Error: 1.00114
Epoch 7000, Error: 1.00097
Epoch 8000, Error: 1.00084
Epoch 9000, Error: 1.00074
Epoch 10000, Error: 1.00066
Epoch 11000, Error: 1.0006
Epoch 12000, Error: 1.00055
Epoch 13000, Error: 1.0005
Epoch 14000, Error: 1.00047
Epoch 15000, Error: 1.00043
Epoch 16000, Error: 1.0004
Epoch 17000, Error: 1.00038
Epoch 18000, Error: 1.00036
Epoch 19000, Error: 1.00034
Epoch 20000, Error: 1.00032
Epoch 21000, Error: 1.0003
Epoch 22000, Error: 1.00029
Epoch 23000, Error: 1.00028
Epoch 24000, Error: 1.00027
Epoch 25000, Error: 1.00025
Epoch 26000, Error: 1.00024
Epoch 27000, Error: 1.00023
Epoch 28000, Error: 1.00023
Epoch 29000, Error: 1.00022
Epoch 30000, Error: 1.00021
Epoch 31000, Error: 1.0002
Epoch 32000, Error: 1.0002
Epoch 33000, Error: 1.00019
Epoch 34000, Error: 1.00018
Epoch 35000, Error: 1.00018
Epoch 36000, Error: 1.00017
Epoch 37000, Error: 1.00017
Epoch 38000, Error: 1.00016
Epoch 39000, Error: 1.00016
Epoch 40000, Error: 1.00016
Epoch 41000, Error: 1.00015
Epoch 42000, Error: 1.00015
Epoch 43000, Error: 1.00014
Epoch 44000, Error: 1.00014
Epoch 45000, Error: 1.00014
Epoch 46000, Error: 1.00013
Epoch 47000, Error: 1.00013
Epoch 48000, Error: 1.00013
Epoch 49000, Error: 1.00013
Epoch 50000, Error: 1.00012
Epoch 51000, Error: 1.00012
Epoch 52000, Error: 1.00012
Epoch 53000, Error: 1.00012
Epoch 54000, Error: 1.00011
Epoch 55000, Error: 1.00011
Epoch 56000, Error: 1.00011
Epoch 57000, Error: 1.00011
Epoch 58000, Error: 1.00011
Epoch 59000, Error: 1.0001
Epoch 60000, Error: 1.0001
Epoch 61000, Error: 1.0001
Epoch 62000, Error: 1.0001
Epoch 63000, Error: 1.0001
Epoch 64000, Error: 1.0001
Epoch 65000, Error: 1.00009
Epoch 66000, Error: 1.00009
Epoch 67000, Error: 1.00009
Epoch 68000, Error: 1.00009
Epoch 69000, Error: 1.00009
Epoch 70000, Error: 1.00009
Epoch 71000, Error: 1.00009
Epoch 72000, Error: 1.00008
Epoch 73000, Error: 1.00008
Epoch 74000, Error: 1.00008
Epoch 75000, Error: 1.00008
Epoch 76000, Error: 1.00008
Epoch 77000, Error: 1.00008
Epoch 78000, Error: 1.00008
Epoch 79000, Error: 1.00008
Epoch 80000, Error: 1.00008
Epoch 81000, Error: 1.00008
Epoch 82000, Error: 1.00007
Epoch 83000, Error: 1.00007
Epoch 84000, Error: 1.00007
Epoch 85000, Error: 1.00007
Epoch 86000, Error: 1.00007
Epoch 87000, Error: 1.00007
Epoch 88000, Error: 1.00007
Epoch 89000, Error: 1.00007
Epoch 90000, Error: 1.00007
Epoch 91000, Error: 1.00007
Epoch 92000, Error: 1.00007
Epoch 93000, Error: 1.00007
Epoch 94000, Error: 1.00006
Epoch 95000, Error: 1.00006
Epoch 96000, Error: 1.00006
Epoch 97000, Error: 1.00006
Epoch 98000, Error: 1.00006
Epoch 99000, Error: 1.00006

Testing on given inputs:
(1, 1, 1, 1)    =   (1, 1, 1)
(1, 1, 0, 1)    =   (1, 1, 0)
(0, 1, 1, 0)    =   (1, 0, 1)
(1, 0, 1, 1)    =   (1, 1, 0)
(0, 0, 1, 0)    =   (0, 1, 0)
(0, 0, 0, 0)    =   (0, 0, 0)
(0, 1, 0, 0)    =   (0, 0, 1)
(1, 0, 0, 1)    =   (0, 1, 0)
(0, 1, 1, 1)    =   (1, 0, 1)
(1, 0, 1, 1)    =   (1, 1, 0)
```

# Problem 4
Analyze the role of activations functions Sigmoid, ReLu and Softmax.

# Problem-5
Frame a problem statement related to your project title and Train an MLP a small dataset (Synthetic dataset or standard dataset)
