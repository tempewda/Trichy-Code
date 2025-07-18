# Problem-1:
Implement perceptron training algorithm (PTA) for the following:

- AND
- OR
- NOT
- NAND
- XOR
- 5-input palindrome
- 5-input majority
- 5-input parity problems

Strat with random weights and observe convergence. Repeat iterations when convergence not
happen. Display the number of iterations it takes for convergence.


```cpp
#include <iostream>
#include <vector>

struct DataPoint {
    std::vector<double> inputs;
    int label;
};

std::vector<DataPoint> datasets;
std::vector<double> weights;

double calculate_dot_product(const std::vector<double>& w, const std::vector<double>& x) {
    if (w.size() != x.size())
        return 0.0;
    
    double sum = 0.0;

    for (size_t index = 0; index < w.size(); ++index) 
        sum += (w[index] * x[index]);
    
    return sum;
}

int activationFunction(double sum) {
    return (sum < 0) ? 0 : 1;
}

void update_weights(std::vector<double>& w, const std::vector<double>& x, int error, double learning_rate) {
    for (size_t index = 0; index < w.size(); ++index) 
        w[index] += (learning_rate * error * x[index]);
}

int main() {
    datasets = {
        {{1.0, 0.0, 0.0}, 0},
        {{1.0, 0.0, 1.0}, 1},
        {{1.0, 1.0, 0.0}, 1},
        {{1.0, 1.0, 1.0}, 1}
    };
    weights = {0.2, 0.3, 0.4};

    int epoch_count = 0;
    const int MAX_EPOCHS = 20;
    bool updates_made_in_epoch = true;
    double learning_rate = 0.4;

    while (epoch_count < MAX_EPOCHS && updates_made_in_epoch) {
        updates_made_in_epoch = false;
        for (size_t index = 0; index < datasets.size(); ++index) {
            const std::vector<double>& x = datasets[index].inputs;
            int y = datasets[index].label;
            double sum = calculate_dot_product(weights, x);
            int y_cap = activationFunction(sum);
            int error = y - y_cap;

            if (error != 0) {
                update_weights(weights, x, error, learning_rate);
                updates_made_in_epoch = true;
            }
        }
        ++epoch_count;
    }

    std::cout << "-------------------------------------" << std::endl;
    if (!updates_made_in_epoch) 
        std::cout << "Convergence reached within " << epoch_count << " epochs!" << std::endl;
    else
        std::cout << "Failed to converge within " << epoch_count << " epochs" << std::endl;


    std::cout << "Final Weights: ";
    for (const auto& w : weights)
        std::cout << w << " ";
    std::cout << std::endl;

    return 0;
}
```

#Q2
```cpp
#include <iostream>
#include <vector>

struct DataPoint {
    std::vector<double> inputs;
    int label;
};

std::vector<DataPoint> datasets;
std::vector<double> weights;

double calculate_dot_product(const std::vector<double>& w, const std::vector<double>& x) {
    if (w.size() != x.size())
        return 0.0;
    
    double sum = 0.0;

    for (size_t index = 0; index < w.size(); ++index) 
        sum += (w[index] * x[index]);
    
    return sum;
}

int activationFunction(double sum) {
    return (sum < 0) ? 0 : 1;
}

void update_weights(std::vector<double>& w, const std::vector<double>& x, int error, double learning_rate) {
    for (size_t index = 0; index < w.size(); ++index) 
        w[index] += (learning_rate * error * x[index]);
}

int main() {
    datasets = {
        {{1.0, 0.0, 0.0}, 0},
        {{1.0, 0.0, 1.0}, 1},
        {{1.0, 1.0, 0.0}, 1},
        {{1.0, 1.0, 1.0}, 1}
    };
    weights = {0.2, 0.3, 0.4};

    int epoch_count = 0;
    const int MAX_EPOCHS = 20;
    bool updates_made_in_epoch = true;
    double learning_rate = 0.4;

    while (epoch_count < MAX_EPOCHS && updates_made_in_epoch) {
        updates_made_in_epoch = false;
        for (size_t index = 0; index < datasets.size(); ++index) {
            const std::vector<double>& x = datasets[index].inputs;
            int y = datasets[index].label;
            double sum = calculate_dot_product(weights, x);
            int y_cap = activationFunction(sum);
            int error = y - y_cap;

            if (error != 0) {
                update_weights(weights, x, error, learning_rate);
                updates_made_in_epoch = true;
            }
        }
        ++epoch_count;
    }

    std::cout << "-------------------------------------" << std::endl;
    if (!updates_made_in_epoch) 
        std::cout << "Convergence reached within " << epoch_count << " epochs!" << std::endl;
    else
        std::cout << "Failed to converge within " << epoch_count << " epochs" << std::endl;


    std::cout << "Final Weights: ";
    for (const auto& w : weights)
        std::cout << w << " ";
    std::cout << std::endl;

    return 0;
}
```
