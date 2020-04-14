// github.com/andy489

#include <iostream>

double fx(double a, double b, double c, double x) { // f(x)=ax^2+bx+c
    return a * x * x + b * x + c;
}

int main() {
    double a, b, c, p, q;
    std::cout << "Enter a, b, c, p, q: ";
    std::cin >> a >> b >> c >> p >> q;
    double max, min;

    double d = -b / (2 * a),
            val1 = fx(a, b, c, d),
            val2 = fx(a, b, c, p),
            val3 = fx(a, b, c, q);

    if (val1 > val2) {
        max = val1;
        min = val2;
    } else {
        max = val2;
        min = val1;
    }
    if (val3 > max)
        max = val3;
    if (val3 < min)
        min = val3;

    std::cout.setf(std::ios::fixed);
    std::cout.precision(2);
    std::cout << "Max = " << max << "\nMin = " << min << '\n';
    return 0;
}
