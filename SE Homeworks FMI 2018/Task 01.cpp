#include <iostream>

int myAbs(int num) {
    return (num >= 0) ? num : -num;
}

int main() {
    short input;
    int minNumber, maxNumber, diff, count, flag;
    minNumber = INT_MAX;
    maxNumber = 0; // no need to take INT_MIN, because if input < 0 it will stop the program;
    count = 0;
    flag = 0;
    std::cout << "Enter an integer number: " << std::endl;;
    while (!(std::cin >> input)) {
        std::cin.clear(); // reset input
        while (std::cin.get() != '\n') continue; // get rid of bad input
        std::cout << "This input does not work. Enter an integer number in range: " << std::endl;
    }
    while (true) {
        if (input >= 0) {
            if (input > maxNumber) maxNumber = input;
            if (input < minNumber) minNumber = input;
            count++;
        }
        if (input < 0 && count < 2) {
            std::cout << "ERROR! You must enter at least two natural numbers.";
            flag = 2018;
            break;
        } else if (input < 0 && count >= 2) break;
        std::cout << "Enter another one: " << std::endl;
        while (!(std::cin >> input)) {
            std::cin.clear();
            while (std::cin.get() != '\n') continue;
            std::cout << "This input does not work. Enter an integer number in range: " << std::endl;
        }
    }
    if (flag != 2018) {
        diff = minNumber - maxNumber;
        std::cout << "The absolute difference between the smallest and the largest entered numbers is: " << myAbs(diff)
                  << '.';
    }
    return 0;
}
