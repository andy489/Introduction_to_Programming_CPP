#include <iostream>
#include <cmath>

void bin(size_t n, size_t k) {
    unsigned i;
    std::cout << '(';
    for (i = 1 << k - 1; i > 0; i = i / 2) {
        std::cout << ((n & i) ? "1" : "0");
        if (i != 1) std::cout << ',';
    }
    std::cout << ')';
}

int main() {
    size_t n;
    std::cin >> n;
    for (size_t i = 0; i < pow(2, n); i++) {
        bin(i, n);
        std::cout << std::endl;
    }
    return 0;
}
