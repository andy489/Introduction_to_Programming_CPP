// github.com/andy489

#include <iostream>

int main() {
    std::cout << "Enter valid year: ";
    size_t year;
    std::cin >> year;
    std::cout << year << ((((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) ?
                          " is a leap year." : " is not a leap year.");
    return 0;
}
