// github.com/andy489

#include <iostream>

double karPow(double x, int n) { // Karatsuba algorithm
    if (n == 0) return 1;
    if (n == 1) return x;
    if (n > 0) {
        if (n % 2 == 0) return karPow(x, n / 2) * karPow(x, n / 2);
        else return x * karPow(x, n - 1);
    } else return 1 / karPow(x, abs(n));
}

int main() {
    std::cout << karPow(3, -2) << std::endl;
    return 0;
}
