// github.com/andy489

#include <iostream>

#define k 5

long long binom(int m, size_t l) { // function which calculates m choose l
    if (m < l) return 0;
    if (m < 0) return 0;
    if (l == 0 || l == m) return 1;
    else return binom(m - 1, l) + binom(m - 1, l - 1);
}

long solSys1(size_t n) { // first combinatorial way
    long B = binom(k + (n - 10 - 21) - 1, k - 1);

    long C1 = binom(k + (n - 10 - 21) - 10 - 1, k - 1);
    long C2 = binom(k + (n - 10 - 21) - 20 - 1, k - 1);
    long C3 = binom(k + (n - 10 - 21) - 30 - 1, k - 1);

    long C1C2 = binom(k + ((n - 10 - 21) - 10 - 20) - 1, k - 1);
    long C2C3 = binom(k + ((n - 10 - 21) - 20 - 30) - 1, k - 1);
    long C3C1 = binom(k + ((n - 10 - 21) - 30 - 10) - 1, k - 1);

    long C1C2C3 = binom(k + ((n - 10 - 21) - 10 - 20 - 30) - 1, k - 1);

    long numSol = B - (C1 + C2 + C3) + (C1C2 + C2C3 + C3C1) - C1C2C3;
    return numSol;
}

long solSys2(size_t n) { // second counting with cycles way
    size_t count(0);

    for (size_t x1 = 0; x1 < 10; x1++)
        for (size_t x2 = 10; x2 < 30; x2++)
            for (size_t x3 = 0; x3 <= n; x3++)
                for (size_t x4 = 21; x4 < n; x4++)
                    for (size_t x5 = 0; x5 < 30; x5++)
                        if (x1 + x2 + x3 + x4 + x5 == n)
                            count++;
    return count;
}

int main() {
    size_t n;
    std::cin >> n;
    std::cout << solSys1(n) << std::endl;
    std::cout << solSys2(n) << std::endl;
    return 0;
}
