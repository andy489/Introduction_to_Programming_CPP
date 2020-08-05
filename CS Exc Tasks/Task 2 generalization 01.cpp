#include <iostream>
#include <cmath>

void printArr(size_t *a, size_t n) {
    std::cout << '(';
    for (size_t i = 1; i <= n; i++) {
        std::cout << a[i];
        if (i != n) std::cout << ',';
    }
    std::cout << ")\n";
}

int main() {
    size_t n, m, k;
    std::cout << "n = ";
    std::cin >> n;
    std::cout << "k = ";
    std::cin >> k;
    size_t a[30];
    for (size_t i = 1; i <= n; i++) a[i] = 0;
    printArr(a, n);
    for (size_t i = 1; i <= pow(k, n) - 1; i++) {
        if (a[n] < k - 1) {
            a[n] = a[n] + 1;
            printArr(a, n);
        } else {
            m = n;
            while (a[m] == k - 1) m--;
            a[m] = a[m] + 1;
            for (size_t i = m + 1; i <= n; i++) a[i] = 0;
            printArr(a, n);
        }
    }
    return 0;
}
