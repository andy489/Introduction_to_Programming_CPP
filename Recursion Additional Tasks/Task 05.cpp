#include <iostream>

void rev() {
    char ch;
    std::cin >> ch;
    if (ch != '!') rev();
    std::cout << ch;
}

int main() {
    rev();
    return 0;
}
