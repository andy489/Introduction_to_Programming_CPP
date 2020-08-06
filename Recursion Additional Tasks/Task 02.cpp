#include <iostream>

int sum(size_t n, int a[]) {
    if (n == 1) return a[0];
    else return sum(n - 1, a) + a[n - 1];
}

int main() {
    int a[] = {1, 2, 3, 4, 5, -4, -3, -2, -1};
    size_t n = sizeof(a) / sizeof(a[0]);
    std::cout << sum(n, a);
    return 0;
}
