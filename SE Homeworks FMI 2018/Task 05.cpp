#include <iostream>

int main() {
    double x, y;
    std::cout << "Enter the coordinates of the point: ";
    while (!(std::cin >> x >> y)) {
        std::cin.clear(); //reset input
        while (std::cin.get() != '\n') continue; //get rid of bad input
        std::cout << "Please enter correct abscissa and ordinate of a point:\n";
    }
    const int bigCircRad = 6;
    const int medCircRad = 3;
    const int smallCircRad = 1;

    bool inBigCirc = (x * x + y * y) < bigCircRad * bigCircRad;

    bool inMedCircUp = (x * x + (y - medCircRad) * (y - medCircRad)) < medCircRad * medCircRad;
    bool inMedCircDown = (x * x + (y + medCircRad) * (y + medCircRad)) < medCircRad * medCircRad;

    bool inSmallCircUp = (x * x + (y - medCircRad) * (y - medCircRad)) < smallCircRad * smallCircRad;
    bool inSmallCircDown = (x * x + (y + medCircRad) * (y + medCircRad)) < smallCircRad * smallCircRad;

    bool isUndefined =
            x * x + (y - medCircRad) * (y - medCircRad) == smallCircRad * smallCircRad ||
            x * x + (y + medCircRad) * (y + medCircRad) == smallCircRad * smallCircRad ||
            x * x + (y - medCircRad) * (y - medCircRad) == medCircRad * medCircRad ||
            x * x + (y + medCircRad) * (y + medCircRad) == medCircRad * medCircRad ||
            x * x + y * y == bigCircRad * bigCircRad;

    bool inLeftQuadrant = (x < 0);

    if (isUndefined) std::cout << "Undefined";
    else if (inBigCirc) {
        if (inLeftQuadrant) {
            if ((!inMedCircDown || inSmallCircDown) && !inSmallCircUp) std::cout << "White";
            else std::cout << "Black";
        } else {
            if ((!inMedCircUp || inSmallCircUp) && !inSmallCircDown) std::cout << "Black";
            else std::cout << "White";
        }
    } else std::cout << "Outside";
    return 0;
}
