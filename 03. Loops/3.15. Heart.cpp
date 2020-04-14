// github.com/andy489

#include <iostream>

void printChar(char a, int n) {
    int i;
    for (i = 0; i < n; ++i) {
        std::cout << a;
    }
}

void printHeart(int n) {
    if (!(n & 1))
        std::cout << "error";
    else {
        int i;
        for (i = 1; i <= n; i += 2) {
            printChar(' ', (n - i) / 2);
            printChar('*', i);
            printChar(' ', n - i + 1);
            printChar('*', i);
            std::cout << std::endl;
        }
        for (i = 1; i <= n; ++i) {
            printChar(' ', i);
            printChar('*', 2 * (n - i) + 1);
            std::cout << std::endl;
        }
    }
}

int main() {
    int n;
    std::cin >> n;
    printHeart(n);
    return 0;
}
