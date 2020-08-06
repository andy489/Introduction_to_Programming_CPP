#include <iostream>

int main() {//base 16
    int short firstOperand, secondOperand, operation;
    int base = 16;
    std::cout << "Enter two numbers from 0 to 15 and one from 0 to 3 separated by space:\n";
    while (!(std::cin >> firstOperand >> secondOperand >> operation)) {
        std::cin.clear(); //reset input
        while (std::cin.get() != '\n') continue; //get rid of bad input
        std::cout << "Please, enter two numbers from 0 to 15 and one from 0 to 3 separated by space:\n";
    }
    bool definitionSet = firstOperand >= 0 && firstOperand <= 15 && operation <= 3 && operation >= 0;
    if (!definitionSet) {
        std::cout << "Wrong input";
    } else {
        /*Since the calculator will be 4 bit - on condition, it is unnecessary for the result variable to be double,
        because the only case in which a floating-point number can be obtained is in the integer division operation,
        but this operation (without casting to double or float) returns integer number. So the result can be at most
        15: 1 = 15 or at least a:b = 0, where a<b and will always be in the allowed values. In this case of division
        we will only check if we divide by 0, which is not allowed.*/
        int result;
        switch (operation) {
            case 0:
                std::cout << "The operation is addition and the result is: ";
                result = (firstOperand + secondOperand) % base;
                break;
            case 1:
                std::cout << "The operation is subtraction and the result is: ";
                result = firstOperand - secondOperand;
                if (result < 0) result += 16;
                break;
            case 2:
                std::cout << "The operation is multiplication and the result is: ";
                result = (firstOperand * secondOperand) % base;
                break;
            case 3:
                if (secondOperand != 0) {
                    std::cout << "The operation is division and the result is: ";
                    result = firstOperand / secondOperand;
                    break;
                } else {
                    std::cout << "Wrong input";
                    return 0;
                }
        }
        std::cout << result << ".\n";
    }
    return 0;
}
