// github.com/andy489

#include <iostream>
#include <string>

int main() {
    int guess = 512;
    int nextIncr = 512;
    int countQuestions(1);
    std::string answer;
    while (nextIncr != 1 || answer != "that's the number!") {
        std::cout << countQuestions << ". Is your number bigger than " << guess << " ?\n";
        std::getline(std::cin, answer);
        nextIncr /= 2;
        ++countQuestions;
        if (answer == "yes") {
            guess += nextIncr;
        } else if (answer == "no") {
            guess -= nextIncr;
        } else if (answer == "that's the number") {
            std::cout << "the number written on the sheet is: " << guess << "\n";
            return 0;
        }
    }
    return 0;
} //extra question answer: 10; The program will always guess the number in no more than 10 guesses, because 2^10=1024>1000.
