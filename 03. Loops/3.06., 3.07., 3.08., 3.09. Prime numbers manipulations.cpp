// github.com/andy489

#include <iostream>
#include <cmath>

bool isPrime(int n) { // 3.06.
    int i, s = sqrt(n);
    for (i = 2; i <= s; ++i)
        if (n % i == 0)
            return false;
    return true;
}

void printAllPrimesToNum(int n) { // 3.07.
    std::cout << 1;
    int i;
    for (i = 2; i <= n; ++i)
        if (isPrime(i))
            std::cout << ", " << i;
    std::cout << '.' << std::endl;
}

void factoringNum(int n) { // 3.08.
    int i;
    for (i = 2; i <= n; ++i) {
        if (isPrime(i) && n % i == 0) {
            if (i == n)
                std::cout << i;
            else
                std::cout << i << '.';
            n /= i;
            i = 1;
        }
    }
    std::cout << std::endl;
}

bool sumOfTwoPrimes(int n, int &j) { // 3.09.
    int i, s = sqrt(n);
    for (i = 2; i <= s; ++i) {
        if (isPrime(i) && isPrime(n - i)) {
            j = i;
            return true;
        }
    }
    return false;
}

int main() {
    size_t n;
    std::cin >> n;
    if (isPrime(n))
        std::cout << n << " is prime number";
    else
        std::cout << n << " is compose number.";
    std::cout << "\nPrime numbers up to " << n << " are: ";
    printAllPrimesToNum(n);

    std::cout << "Factoring of " << n << " is: ";
    factoringNum(n);

    int j;
    if (sumOfTwoPrimes(n, j))
        std::cout << j << '+' << n - j << '=' << n;
    else
        std::cout << n << " cannot be represented as sum of two primes";
    return 0;
}
