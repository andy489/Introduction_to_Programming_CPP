// github.com/andy489

#include <iostream>
#include <cmath>

int main() {
    double x, y, k(0);
    std::cout << "Enter coordinates of a point P in 2D: ";
    std::cin >> x >> y;
    if (x * y == 0) {
        if (x == y)
            std::cout << "Point P(" << x << ',' << y << ") matches point O(0,0).";
        else {
            if (x != 0)
                std::cout << "Point P(" << x << ',' << y << ") lies on the abscissa.";
            else
                std::cout << "Point P(" << x << ',' << y << ") lies on the ordinate.";
        }
    } else {
        if (x * y > 0) {
            if (x > 0)
                k = 1;
            else
                k = 3;
        } else {
            if (x > 0)
                k = 4;
            else
                k = 2;
        }
    }
    if (k != 0)
        std::cout << "Point P(" << x << ',' << y << ") is located in quadrant " << k;
    if (abs(x) < 0.5 && abs(y) < 0.5)
        std::cout << "\n~inside the given unit square.";
    else if ((abs(x) == 0.5 && abs(y) <= 0.5) || (abs(y) == 0.5 && abs(x) <= 0.5))
        std::cout << "\n~on the perimeter of the given unit square.";
    else
        std::cout << "\n~outside the given unit square.";

    if ((x - 0.5) * (x - 0.5) + (y - 0.5) * (y - 0.5) < 1 * 1)
        std::cout << "\n~inside the given unit circle.";
    else if ((x - 0.5) * (x - 0.5) + (y - 0.5) * (y - 0.5) == 1 * 1)
        std::cout << "\n~on the perimeter of the given unit circle.";
    else
        std::cout << "\n~outside the given unit circle.";

    return 0;
}
