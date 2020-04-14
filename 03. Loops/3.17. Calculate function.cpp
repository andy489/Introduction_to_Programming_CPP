// github.com/andy489

#include <iostream>

double myAbs(double a) {
    return a > 0 ? a : -a;
}

double calc(double a, double b, double eps, long end) {
    double xk1 = a,
            xk2 = b,
            xk = 0;
    long k;
    for (k = 3; myAbs(xk1 - xk2) >= eps; ++k) {
        xk = (1.0 / 5) * (xk1 + xk1 / xk2);
        xk2 = xk1;
        xk1 = xk;
        if (k > end)
            return -1;
    }
    return xk;
}

int main() {
    std::cout << calc(2, 3, 0.001, 100);
    return 0;
}
