//Task 3.18
#include <iostream>

double myAbs(double a) { return a > 0 ? a : -a; }

double calcNapierConst(double x, double eps) {
    double x1(1), s(1);
    int i(0);
    while (myAbs(x1) >= eps) {
        ++i;
        x1 *= x / i; // building collectible
        s += x1; // adding collectible to the sum "s"
    }
    return s;
}

int main() {
    double x, eps;
    std::cout << "Enter x: ";
    std::cin >> x;
    std::cout << "Enter epsilon: ";
    std::cin >> eps;

    std::cout << calcNapierConst(x, eps) << std::endl;
    //for finding approximation of e, just put x=1, eps=0.00001
    return 0;
}
