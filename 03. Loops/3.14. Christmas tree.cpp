// github.com/andy489

#include <iostream>

void printChar(char a, int n) {
    int i;
    for (i = 0; i < n; ++i) {
        std::cout << a;
    }
}

void printChristmasTree(int n) {
    if (!(n & 1))
        std::cout << "error";
    else {
        int i;
        for (i = 1; i <= n / 2 + 1; ++i) {
            printChar(' ', n / 2 - i + 1);
            printChar('*', 2 * i - 1);
            std::cout << std::endl;
        }
        printChar(' ', n / 2);
        std::cout << '*';
    }
}

int main() {
    int n;
    std::cin >> n;
    printChristmasTree(n);
    return 0;
}
