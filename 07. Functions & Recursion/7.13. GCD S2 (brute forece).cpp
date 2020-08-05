// github.com/andy489

#include <iostream>

using namespace std;

int brute_force_gcd(int a, int b) {
    if (a < b) swap(a, b);
    // We'll assume that a > b
    int g = 0;
    for (int d = 1; (long long) d * d <= b; d++) {
        if (b % d == 0) {
            // If d divides b, there are two divisors to check
            // d and b/d
            if (a % d == 0) {
                g = max(g, d);
            }
            if (a % (b / d) == 0) {
                g = max(g, b / d);
            }
        }
    }
    return g;
}

int main() {
    int a, b;
    std::cin >> a >> b;
    std::cout << brute_force_gcd(a, b) << std::endl;
}
