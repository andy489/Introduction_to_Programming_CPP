// github.com/andy489

#include <iostream>
#include <cmath>

const double PRECISION = 0.000001;

double sqrt_x(double x, double eps) { // Binary search
    double left = 0.0, right = x, root;

    while (left <= right) {
        root = (left + right) / 2.0;
        if (abs(root * root - x) < PRECISION) {
            return root;
        } else if (root * root - x > PRECISION) {
            right = root;
        } else {
            left = root ;
        }
    }
}

int main() {
    const int n = 3;
    std::cout << sqrt_x(n, PRECISION) << std::endl;
    return 0;
}
