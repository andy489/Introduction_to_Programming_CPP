// github.com/andy489

#include <iostream>
#include <cmath>

int main() {
    std::cout << "Enter valid sides of a triangle: ";
    double a, b, c;
    std::cin >> a >> b >> c;
    double s = (a + b + c) / 2, // semiperimeter
    area = sqrt(s * (s - a) * (s - b) * (s - c)); // Heron's formula

    std::cout << "Area of triangle is: " << area;
    return 0;
}
