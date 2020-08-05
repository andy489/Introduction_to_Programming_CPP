// github.com/andy489

#include <iostream>
#include <cmath>

double getDistance(double x1, double y1, double x2, double y2) {
    return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
}

int main() {
    double x1, y1, x2, y2;
    std::cin >> x1 >> y1 >> x2 >> y2;
    std::cout.setf(std::ios::fixed);
    std::cout.precision(2);
    std::cout << getDistance(x1, y1, x2, y2);
    return 0;
}
