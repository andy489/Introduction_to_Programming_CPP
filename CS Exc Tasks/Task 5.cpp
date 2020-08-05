#include <iostream>
#include <cmath>

void printArr(size_t n, size_t *a) {
    for (size_t i = 0; i < n; i++) std::cout << a[i];
    std::cout << std::endl;
}

int main() {
    size_t a[30];
    size_t n, m;
    std::cout << "n = ";
    std::cin >> n;
    a[0] = 1;
    for (size_t i = 1; i < n; i++) a[i] = 0;
    printArr(n, a);
    for (size_t i = 1; i < 9 * pow(10, n - 1); i++) {
        if (a[n - 1] < 9) {
            a[n - 1]++;
            printArr(n, a);
        } else {
            m = n;
            while (a[m - 1] == 9)m--;
            a[m - 1]++;
            for (size_t j = m; j < n; j++)a[j] = 0;
            printArr(n, a);
        }
    }
    return 0;
}
