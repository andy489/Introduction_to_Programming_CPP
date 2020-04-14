// github.com/andy489

#include <iostream>
#include <cmath>

typedef long long int ll;

int numLen(ll n) {
    return size_t(floor(log10(abs(n)))) + 1;
}

int digitPos(ll n, int k) {
    int len = numLen(n);
    n = (n > 0 ? n : -n);
    int endCycle = len - k;
    int digit = -1, i;
    for (i = len - 1; i >= endCycle; --i) {
        digit = (int) (n / pow(10, i));
        ll denom = (ll) (pow(10, len - 1));
        n %= denom;
        --len;
    }
    return digit;
}

int main() {
    std::cout << "Enter integer number and position: ";
    ll n;
    unsigned short k;
    std::cin >> n;
    std::cin >> k;
    int len = numLen(n);
    if (k > len || k < 1) {
        std::cout << "Position out of range";
    } else {
        std::cout << digitPos(n, k);
    }
    return 0;
}
