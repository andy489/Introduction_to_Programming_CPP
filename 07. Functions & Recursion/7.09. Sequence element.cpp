// github.com/andy489

#include <iostream>
#include <cmath>

size_t seq1(size_t n) { // first way - using recursion
    if (n == 0) return 0;
    if (n == 1) return 1;
    else return (size_t) (5 * seq1(n - 1) - 6 * seq1(n - 2) + pow(6, n - 2));
}

size_t seq2(size_t n) { // second way - solving the characteristics polynomial of the sequence
    size_t result = (size_t) (-3.0 / 4 * pow(2, n) + 2.0 / 3 * pow(3, n) + 1.0 / 12 * pow(6, n));
    return result;
}

size_t seq3(size_t n) { // third way - cycling
    size_t a0(0), a1(1), a2;
    if (n == 0) return a0;
    for (size_t i = 2; i <= n; i++) {
        a2 = (size_t) (5 * a1 - 6 * a0 + pow(6, i - 2));
        a0 = a1;
        a1 = a2;
    }
    return a1;
}

int main() {
    size_t n;
    std::cin >> n;
    std::cout << seq1(n) << std::endl;
    std::cout << seq2(n) << std::endl;
    std::cout << seq3(n) << std::endl;
    return 0;
}
