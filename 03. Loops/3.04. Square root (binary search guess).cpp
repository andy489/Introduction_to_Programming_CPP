// github.com/andy489

#include <iostream>

const double PRECISION = 0.000001;

double sqrt_x(double x, double eps) { // Babylonian method
    double s = x;
    while ((s - x / s) > eps)
        s = (s + x / s) / 2;
    return s;
}

int main() {
    const int n = 2;
    std::cout << sqrt_x(n, PRECISION) << std::endl;
    return 0;
}
