#include <iostream>
#include <float.h>

double myAbs(double a) { return a > 0 ? a : -a; }

int main() {
    unsigned n;
    std::cout << "n = ";
    std::cin >> n;

    double *arr = new double[2 * n];
    unsigned c = 0;

    for (size_t i = 0; i < n; i++) {
        double x, y;
        std::cout << "x" << i << " = ";
        std::cin >> x;
        std::cout << "y" << i << " = ";
        std::cin >> y;

        arr[c] = x;
        arr[c + 1] = y;
        c += 2;
    }

    double min_x = DBL_MAX;
    double max_x = DBL_MIN;
    double min_y = DBL_MAX;
    double max_y = DBL_MIN;

    for (size_t i = 0; i < 2 * n; i += 2) {
        if (arr[i] < min_x) min_x = arr[i];
        if (arr[i] > max_x) max_x = arr[i];
    }
    for (size_t i = 1; i < 2 * n; i += 2) {
        if (arr[i] < min_y) min_y = arr[i];
        if (arr[i] > max_y) max_y = arr[i];
    }

    double diff_x = max_x - min_x;
    double diff_y = max_y - min_y;

    double sideCoverSquare = (diff_x + diff_y + myAbs(diff_x - diff_y)) / 2;

    double areaSquare = sideCoverSquare * sideCoverSquare;

    std::cout.setf(std::ios::fixed);
    std::cout.precision(4);
    std::cout << "Min area of covering square is: " << areaSquare;

    delete[] arr;
    return 0;
}
