#include <iostream>
#include <cmath>

void printArr(size_t n, size_t *a) {
    for (size_t i = 0; i < n; i++) std::cout << a[i];
    std::cout << std::endl;
}

bool nine(size_t n, size_t *a) {
    for (size_t i = 0; i < n; i++) if (a[i] != 9) return true;
    return false;
}

int main() {
    size_t a[30];
    size_t n, m;
    std::cout << "n = ";
    std::cin >> n;
    a[0] = 1;
    for (size_t i = 1; i < n; i++) a[i] = 0;
    printArr(n, a);
    do {
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
    } while (nine(n, a));
    return 0;
}
