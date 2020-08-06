#include <iostream>

double Hermit(size_t n, double x) {
    double h0, h1, h;
    if (n == 0)return 1;
    else {
        if (n == 1)return 2 * x;
        else {
            h0 = 1;
            h1 = 2 * x;
            for (size_t i = 1; i <= n - 1; i++) {
                h = 2 * x * h1 - 2 * i * h0;
                h0 = h1;
                h1 = h;
            }
            return h1;
        }
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
