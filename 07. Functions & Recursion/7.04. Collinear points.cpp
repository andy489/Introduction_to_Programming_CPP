// github.com/andy489

#include <iostream>

bool collinear(double x1, double y1, double x2, double y2, double x3,
               double y3) {   //if the area of the triangle is 0 then the three point are collinear
    double a = x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2);
    // we skip multiplication with 0.5 
    if (a == 0) return true;
    else return false;
}

int main() {
    double x1 = 2.0, x2 = 2.0, x3 = 2.0, y1 = 5.0, y2 = 8.0, y3 = 10.5;
    std::cout << (collinear(x1, y1, x2, y2, x3, y3) ? "collinear" : "not collinear");
    return 0;
}
