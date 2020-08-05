// github.com/andy489

#include <iostream>

bool digitCheck(char a) {
    if (a >= '0' && a <= '9') return true;
    return false;
}

bool letterCheck(char a) {
    if ((a >= 'a' && a <= 'z') || (a >= 'A' && a <= 'Z'))return true;
    return false;
}

bool digitOrLetterCheck(char a) {
    if (letterCheck(a) || digitCheck(a))return true;
    return false;
}

int main() {
    char a;
    std::cin >> a;
    digitOrLetterCheck(a) ? std::cout << "Character is a digit or a letter" :
    std::cout << "Character is neiter digit nor letter";
    return 0;
}
