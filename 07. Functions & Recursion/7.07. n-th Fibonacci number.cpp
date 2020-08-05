// github.com/andy489

#include <iostream>
#include <cmath>

size_t fib1(size_t n) { // first way - using recursion
    if (n == 0) return 0;
    if (n == 1) return 1;
    else return fib1(n - 1) + fib1(n - 2);
}

size_t fib2(size_t n) { // second way - solving the characteristics polynomial of the sequence
    double root1 = (1 + sqrt(5)) / 2;
    return (size_t) ((pow(root1, n) - 1 / pow(-root1, n)) / sqrt(5));
}

size_t fib3(size_t n) { // third way - cycling
    size_t f1(0), f2(1), f3;
    if (n == 0) return f1;
    for (size_t i = 2; i <= n; i++) {
        f3 = f2 + f1;
        f1 = f2;
        f2 = f3;
    }
    return f2;
}

int main() {
    size_t n;
    std::cin >> n;
    std::cout << fib1(n) << std::endl;
    std::cout << fib2(n) << std::endl;
    std::cout << fib3(n) << std::endl;
    return 0;
}
