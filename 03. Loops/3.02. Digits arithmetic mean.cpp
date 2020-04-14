// github.com/andy489

#include <iostream>

typedef long long int ll;

ll absVal(long long n) {
    return n < 0 ? -n : n;
}

int main() {
    std::cout << "Enter integer number: ";
    ll n;
    std::cin >> n;
    if (n == 0) {
        std::cout << 0;
        return 0;
    }

    size_t digitCount(0), sum(0);
    n = (n > 0 ? n : -n);
    while (n != 0) {
        sum += n % 10;
        n /= 10;
        ++digitCount;
    }
    std::cout.setf(std::ios::fixed);
    std::cout.precision(2);
    std::cout << 1.0 * sum / digitCount;
    return 0;
}
