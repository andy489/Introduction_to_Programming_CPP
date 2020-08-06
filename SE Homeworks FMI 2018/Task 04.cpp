#include <iostream>

int main() {
    short side;
    char symbol;
    std::cout << "Enters side length and symbol separated by space: ";
    while (!(std::cin >> side >> symbol)) {
        std::cin.clear(); // reset input
        while (std::cin.get() != '\n') continue; // get rid of bad input
        std::cout << "Please enter an integer number between 0 and 13" << std::endl;
    }
    if (side <= 13) {
        for (int i = 0; i < 12 - side; i++) std::cout << std::endl;
        for (int i = 0; i < side; i++) //loop for rows
        {
            for (int x = 0; x <= 20 - side - 1; x++) //loop for "rectangle" empty spaces by a row
                std::cout << "  ";
            for (int j = (side - 1) - (i + 1); j >= 0; j--) //loop for "triangle" empty spaces
                std::cout << "  ";
            for (int k = 0; k < 4 * i + 1; k++) //loop for upper triangle made of symbols 
                std::cout << symbol;
            std::cout << std::endl;
        }
        for (int i = side - 1; i > 0; i--) //control loop for rows
        {
            for (int x = 0; x <= 20 - side - 2; x++) //etc.
                std::cout << "  ";
            for (int j = 0; j < side - i + 1; j++)
                std::cout << "  ";
            for (int k = 4 * i - 3; k > 0; k--) //loop for lower triangle made of symbols
                std::cout << symbol;
            std::cout << std::endl;
        }
    } else std::cout << "Wrong input. Number must be between 0 and 13.";
}
