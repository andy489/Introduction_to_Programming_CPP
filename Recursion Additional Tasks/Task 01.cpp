#include <iostream>

int min(size_t n, int a[]) {
    if (n == 1) return a[0];
    else {
        int b = min(n - 1, a);
        if (b < a[n - 1]) return b;
        else return a[n - 1];
    }
}

int main() {
    int a[] = {2, 4, 0, -19, 5, 8, -22, 1};
    size_t n = sizeof(a) / sizeof(a[0]);
    std::cout << min(n, a);
    return 0;
}
