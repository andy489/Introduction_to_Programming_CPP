// github.com/andy489

#include <iostream>
#include <string>

void printRoman(size_t number) {
    size_t num[] = {1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000};
    std::string sym[] = {"I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"};
    int i(12);
    while (number > 0) {
        size_t div = number / num[i];
        number = number % num[i];
        while (div) {
            std::cout << sym[i];
            --div;
        }
        --i;
    }
}

int main() {
    size_t num;
    std::cout << "Enter number: ";
    std::cin >> num;
    printRoman(num);
    return 0;
}
