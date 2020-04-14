// github.com/andy489

#include <iostream>

int findTrailingZeros(int n) { // Keep dividing n by powers of 5 and update count
    int count(0), i;
    for (i = 5; n / i >= 1; i *= 5)
        count += n / i;
    return count;
}

int main() {
    int n;
    std::cin >> n;
    std::cout << findTrailingZeros(n);
    return 0;
}
