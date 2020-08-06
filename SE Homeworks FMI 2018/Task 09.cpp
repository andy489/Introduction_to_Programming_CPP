#include "iostream"
#include <windows.h>

const char hello[5][41] =
        {
                {'H', ' ', ' ', ' ', 'H', ' ', ' ', ' ', 'E', 'E', 'E', 'E', 'E', ' ', ' ', ' ', 'L', ' ', ' ', ' ',
                                                                                                                     ' ', ' ', ' ', ' ', 'L', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'O', ' ', ' ', ' ', ' ', '\n'},

                {'H', ' ', ' ', ' ', 'H', ' ', ' ', ' ', 'E', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'L', ' ', ' ', ' ', ' ',
                                                                                                                          ' ', ' ', ' ', 'L', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'O', ' ', ' ', ' ', 'O', ' ', ' ', '\n'},

                {'H', 'H', 'H', 'H', 'H', ' ', ' ', ' ', 'E', 'E', 'E', 'E', 'E', ' ', ' ', ' ', 'L', ' ', ' ', ' ', ' ',
                                                                                                                          ' ', ' ', ' ', 'L', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'O', ' ', ' ', ' ', ' ', ' ', 'O', ' ', '\n'},

                {'H', ' ', ' ', ' ', 'H', ' ', ' ', ' ', 'E', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'L', ' ', ' ', ' ', ' ',
                                                                                                                          ' ', ' ', ' ', 'L', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'O', ' ', ' ', ' ', 'O', ' ', ' ', '\n'},

                {'H', ' ', ' ', ' ', 'H', ' ', ' ', ' ', 'E', 'E', 'E', 'E', 'E', ' ', ' ', ' ', 'L', 'L', 'L', 'L', 'L',
                                                                                                                          ' ', ' ', ' ', 'L', 'L', 'L', 'L', 'L', ' ', ' ', ' ', ' ', ' ', ' ', 'O', ' ', ' ', ' ', ' ', '\n'}
        };

void printMe(int count) {
    //we create 10 empty lines to center the text
    std::cout << "\n\n\n\n\n\n\n\n\n\n";
    //before the first printing
    if (count <= 40) {
        for (int i = 0; i < 5; i++) {
            for (int j = 40 - count; j < 40; j++) {
                std::cout << hello[i][j];
            }
            std::cout << std::endl;
        }
    } else if (count > 40 && count <= 80) { //printing the text
        for (int k = 0; k < 5; k++) { //putting the spaces
            for (int i = 0; i < count - 40; i++) std::cout << ' ';
            for (int j = 0; j < 39; j++) std::cout << hello[k][j];
            std::cout << std::endl;
        }
    } else {
        for (int i = 0; i < 5; i++) { //printing blank symbols
            for (int k = 0; k < count - 40; k++) std::cout << ' ';
            for (int j = 0; j < 80 - (count - 39); j++) std::cout << hello[i][j];
            std::cout << std::endl;
        }
    }
}

int main() {
    int count = 0;
    while (true) {
        printMe(count++);
        if (count > 120) count = 0;
        Sleep(30);
        system("CLS");
    }
}
