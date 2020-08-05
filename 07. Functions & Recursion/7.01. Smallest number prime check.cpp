// github.com/andy489

#include <iostream>
#include <cmath>

int abs(int a) {
    return a > 0 ? a : -a;
}

int min(int a, int b) {
    return (a + b - abs(a - b)) / 2;
}

int min(int a, int b, int c) {
    return min(min(a, b), min(b, c));
}

bool isPrime(int a) {
    int num = abs(a);
    for (int i = 2; i <= sqrt(num); i++)
        if (a % i == 0)
            return false;
    return true;
}

bool func(int a, int b, int c) {
    return isPrime(min(a, b, c));
}

int main() {
    int a, b, c;
    std::cin >> a >> b >> c;

    std::cout << (func(a, b, c) ? "smallest number is prime" : "smallest number is not prime");

    return 0;
}
