// github.com/andy489

#include <iostream>
#include <cmath>
#include <string>

int main() {
    std::string year;
    std::cin >> year;

    size_t p, h;
    std::cin >> p >> h;
    double inSofia = (48 - h) * 3 / 4.0,
            inHomeTown = h,
            other = p * 2 / 3.0,
            sum = inSofia + inHomeTown + other;
    if (year == "leap")
        sum += (15 * sum / 100.0);
    std::cout << floor(sum) << std::endl;
    return 0;
}
