// github.com/andy489
#include <iostream>

long long factorial(size_t m) { // recursive function for calculating m!
    if (m == 0)return 1;
    else return m * factorial(m - 1);
}

long long binom1(size_t n, size_t k) { // first way: recursive function for direct calculation of n choose k (0<=k<=n)
    if (k == 0 || k == n) return 1;
    else return binom1(n - 1, k) + binom1(n - 1, k - 1);
}

long long binom2(size_t n, size_t k) { // second way using factorial function and formula for n choose k (0<=k<=n)
    long long prod(1);
    for (size_t i = k + 1; i <= n; i++) prod *= i;
    long long binom = prod / factorial(n - k);
    return binom;
}

int main() {
    size_t n, k;
    std::cin >> n >> k;
    std::cout << binom1(n, k) << std::endl;
    std::cout << binom2(n, k) << std::endl;
    return 0;
}
