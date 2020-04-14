// github.com/andy489

#include <iostream>
#include <cmath>

typedef long long int ll;

int numLen(ll n) {
    int len(0);
    while (n) {
        n /= 10;
        ++len;
    }
    return len;
}

ll revNum(long long n) {
    ll r = 0;
    int len = numLen(n);
    while (len) {
        r += (ll) ((n % 10) * pow(10, len - 1));
        n /= 10;
        --len;
    }
    return r;
}

int digitPos(ll n, int k) {
    int len = numLen(n);
    n = (n > 0 ? n : -n);
    ll rev = revNum(n);
    int digit(-1);
    if (k > len || k < 1)
        return digit;
    int i(0);
    while (i != k) {
        digit = rev % 10;
        rev /= 10;
        ++i;
    }
    return digit;
}

int main() {
    std::cout << "Enter integer number and position: ";
    ll n;
    int k;
    std::cin >> n;
    std::cin >> k;
    int len = numLen(n);
    if (digitPos(n, k) == -1) {
        std::cout << "Position out of range!";
    } else {
        std::cout << digitPos(n, k);
    }
    return 0;
}
