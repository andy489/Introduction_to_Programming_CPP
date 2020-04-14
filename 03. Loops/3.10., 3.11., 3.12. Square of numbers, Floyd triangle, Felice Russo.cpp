// github.com/andy489
#include <iostream>

int numLen(int n) {
    int len = 0;
    while (n) {
        n /= 10;
        ++len;
    }
    return len;
}

void printSpaces(int n) {
    int i;
    for (i = 0; i < n; ++i) {
        std::cout << ' ';
    }
}

void printSquare(int n) { // 3.10.
    int k(1), i, j;
    for (i = 0; i < n; ++i) {
        for (j = 0; j < n; ++j) {
            std::cout << k;
            printSpaces(numLen(n * n) - numLen(k) + 1);
            ++k;
        }
        std::cout << std::endl;
    }
}

void printFloydTriangle(int n) { // 3.11.
    int k(1), i, j;
    for (i = 1; i <= n; ++i) {
        for (j = 1; j <= i; ++j) {
            std::cout << k;
            printSpaces(numLen(n * (n + 1) / 2) - numLen(k) + 1);
            ++k;
        }
        std::cout << std::endl;
    }
}

int sumOfNthRowOfFloydTriangle(int n) {
/* On the N-th row we have n numbers and the last one is n(n+1)/2 (sum of nums from 1 to n).
Now taking back the other n-1, the only thing left is to sum them. */
    int sum(0), i;
    for (i = 0; i < n; ++i) {
        sum += n * (n + 1) / 2 - i;
    }
    // or we can simply derive the following formula:
    // sum = n * (n * n + 1) / 2;
    return sum;
}

void printSequence(size_t n) { // 3.12.
    int i;
    for (i = 1; i <= n; ++i) {
        if (i != n) {
            std::cout << sumOfNthRowOfFloydTriangle(i) << ", ";
            continue;
        }
        std::cout << sumOfNthRowOfFloydTriangle(i);
    }
    std::cout << std::endl;
}

int main() {
    int n;
    std::cin >> n;
    std::cout << "Square of numbers:\n";
    printSquare(n);

    std::cout << "\nFloyd triangle:\n";
    printFloydTriangle(n);

    std::cout << "\nSum of numbers on the n-th row of the Floyd's triangle is:\n";
    std::cout << sumOfNthRowOfFloydTriangle(n) << '\n';

    std::cout << "\nFirst " << n << " terms of the sequence are:\n";
    printSequence(n);

    return 0;
}
