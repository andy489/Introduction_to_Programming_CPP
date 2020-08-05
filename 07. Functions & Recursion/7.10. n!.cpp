// github.com/andy489

#include <iostream>

int factorial(int n) {
    if (n > 0) return n * factorial(n - 1);
    else return 1;
}

int main() {
    int n;
    std::cin >> n;
    std::cout << factorial(n);
}
