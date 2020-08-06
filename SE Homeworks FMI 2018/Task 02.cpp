#include <iostream>

int SafelyInputDigit(int lowerBound, int upperBound) {
    int number;
    bool check;
    do {
        check = false;
        std::cout << "Enter a digit: " << std::endl;
        std::cin >> number;

        if (std::cin.fail()) {
            std::cin.clear();
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
            check = true;
            continue;
        }
    } while (((number < lowerBound) || (number > upperBound)) || check);
    return number;
}

int main() {
    int number;
    short digit;
    std::cout << "Enter an integer number: " << std::endl;
    while (!(std::cin >> number)) {
        std::cin.clear(); // reset input
        while (std::cin.get() != '\n') continue; // get rid of bad input
        std::cout << "Please enter an integer number, that works: " << std::endl;
    }
    int num = number;
    digit = SafelyInputDigit(0, 9);
    int counter = 0;
    while (number != 0) {
        if (number % 10 == digit) counter++;
        number /= 10;
    }
    if (counter == 0) std::cout << "Number " << num << " has no digit " << digit << " in it.";
    else if (counter == 1) std::cout << "Number " << num << " has only one digit " << digit << " in it.";
    else std::cout << "Number " << num << " has " << counter << " times the digit " << digit << " in it.";
    return 0;
}
