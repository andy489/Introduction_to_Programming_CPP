#include <iostream>
#include <cmath>

void printArr(int *a, size_t n) {
    std::cout << '(';
    for (size_t i = 0; i < n; i++) {
        std::cout << a[i];
        if (i != n - 1) std::cout << ',';
    }
    std::cout << ")\n";
}

int main() {
    size_t n, m;
    std::cout << "n = ";
    std::cin >> n;
    int a[30];
    for (size_t i = 0; i < n; i++) a[i] = 0;
    for (size_t i = 0; i < pow(2, n); i++) {
        if (a[n] == 0) {
            a[n] = 1;
            printArr(a, n);
        } else {
            m = n;
            while (a[m] == 1) m--;
            a[m] = 1;
            for (size_t i = m + 1; i < n; i++) a[i] = 0;
            printArr(a, n);
        }
    }
    return 0;
}
