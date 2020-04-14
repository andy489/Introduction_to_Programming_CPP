// github.com/andy489

#include <iostream>

int main() {
    double a, d;
    size_t n;
    std::cout << "First element: ";
    std::cin >> a;
    std::cout << "Difference: ";
    std::cin >> d;
    std::cout << "Number of elements: ";
    std::cin >> n;
    double sum = a * n + (((n - 1) * n) / 2) * d;
    std::cout << "Sum of first " << n
              << " elements of the arithmetic progression with starting element "
              << a << " and difference " << d << " is: " << sum;
    return 0;
}
