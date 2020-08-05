// github.com/andy489

#include <iostream>
#include <cmath>

double vectorLen(double x, double y, double z) {
    return sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));
}

int main() {
    double x, y, z;
    std::cin >> x >> y >> z;
    std::cout << vectorLen(x, y, z);
    return 0;
}
