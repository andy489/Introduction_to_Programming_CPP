#include <iostream>

size_t P(size_t n) {
    if (n == 1) return 1;
    else {
        if (n % 3 == 1) return P(n - 1) * n;
        else return P(n - 1);
    }
}

int main() {
    size_t n;
    std::cout << "n = ";
    std::cin >> n;
    std::cout << P(n);
    return 0;
}
