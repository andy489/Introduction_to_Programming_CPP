// github.com/andy489

#include <iostream>

bool validateTriangle(double a, double b, double c) {
    return a > 0 && b > 0 && c > 0 &&
           a + b > c && b + c > a && c + a > b;
}

short firstCriteria(double a, double b, double c) {
    if (!validateTriangle(a, b, c))
        return 0;
    else if (a == b && b == c)
        return 3; // equilateral
    else if (a == b || b == c || c == a)
        return 2; // isosceles
    else
        return 1; // scalene
}

short secondCriteria(double a, double b, double c) {
    if (a > c)
        std::swap(a, c);
    if (a > b)
        std::swap(a, b); // now the smallest element is a
    if (b > c)
        std::swap(b, c);

    double exp = a * a + b * b - c * c;

    bool x = a > 0 && b > 0 && c > 0 || a + b > c;
    if (!x) return 0;
    else if (exp > 0)
        return 1; // acute
    else if (exp == 0)
        return 2; // right-angled
    else
        return 3; // obtuse
}

int main() {
    std::cout << "Enter sides of triangle: ";
    double a, b, c;
    bool errorFlag = false;
    std::cin >> a >> b >> c;
    switch (firstCriteria(a, b, c)) {
        case 0:
            std::cout << "Sides " << a << ' ' << b << ' ' << c << " cannot form a";
            errorFlag = true;
            break;
        case 1:
            std::cout << "Scalene";
            break;
        case 2:
            std::cout << "Isosceles";
            break;
        case 3:
            std::cout << "Equilateral";
            break;
        default:
            break;
    }
    if (!errorFlag) {
        std::cout << ' ';
        switch (secondCriteria(a, b, c)) {
            case 0:
                break;
            case 1:
                std::cout << "acute";
                break;
            case 2:
                std::cout << "right-angled";
                break;
            case 3:
                std::cout << "obtuse";
                break;
            default:
                break;
        }
    }
    std::cout << " triangle.";
    return 0;
}
