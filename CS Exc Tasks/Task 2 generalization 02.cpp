#include <iostream>
#include <cmath>
#include <string>

template<typename T>
void printArr(size_t *a, size_t n, T *v) {
    std::cout << '(';
    for (size_t i = 1; i <= n; i++) {
        std::cout << v[a[i] + 1];
        if (i != n) std::cout << ',';
    }
    std::cout << ")\n";
}

int main() {
    size_t n, m, k;
    std::cout << "n = ";
    std::cin >> n;
    /*std::cout << "k = ";
    std::cin >> k;*/
    k = 3;
    size_t a[30];
    /*char* v = new char[k+1];
    for (int i = 1; i <= k; i++)
    {
        v[i] = (char)(96 + i);
    }*/
    std::string *v = new std::string[k + 1];
    v[1] = "tik";
    v[2] = "tak";
    v[3] = "toe";
    for (size_t i = 1; i <= n; i++) a[i] = 0;
    printArr(a, n, v);
    for (size_t i = 1; i <= pow(k, n) - 1; i++) {
        if (a[n] < k - 1) {
            a[n] = a[n] + 1;
            printArr(a, n, v);
        } else {
            m = n;
            while (a[m] == k - 1)m--;
            a[m] = a[m] + 1;
            for (size_t i = m + 1; i <= n; i++) a[i] = 0;
            printArr(a, n, v);
        }
    }
    delete[] v;
    return 0;
}
