#include <iostream>

bool oneBit(unsigned int num1, unsigned int num2) {
    unsigned countDiff = 0;
    while (!(num1 == 0 && num2 == 0)) {
        int a = num1 % 2;
        int b = num2 % 2;
        if (a ^ b)
            ++countDiff; // XOR: 0^0=0; 1^0=1; 0^1=1; 1^1=0 i.e. =1 only when diff
        num1 /= 2;
        num2 /= 2;
    }
    if (countDiff == 1)
        return true;
    return false;
}

int main() {
    unsigned num1, num2;
    std::cout << "first num: ";
    std::cin >> num1;
    std::cout << "second num: ";
    std::cin >> num2;

    oneBit(num1, num2) ? std::cout << "true\n" : std::cout << "false\n";
    return 0;
}
