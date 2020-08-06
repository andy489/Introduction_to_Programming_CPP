#include <iostream>

double Hermit(size_t n, double x) {
    if (n == 0) return 1;
    else {
        if (n == 1) return 2 * x;
        else return 2 * x * Hermit(n - 1, x) - 2 * (n - 1) * Hermit(n - 2, x);
    }
}

int main() {
    size_t n;
    std::cout << "n = ";
    std::cin >> n;
    double x;
    std::cout << "x = ";
    std::cin >> x;
    std::cout << Hermit(n, x);
    return 0;
}
