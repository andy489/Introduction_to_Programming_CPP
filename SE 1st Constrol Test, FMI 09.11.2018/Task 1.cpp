#include <iostream>

int main() {
    char c1, c2;
    std::cout << "c1 = ";
    std::cin >> c1;
    std::cout << "c2 = ";
    std::cin >> c2;

    bool logicStatement = ('a' <= c1 && c1 <= 'z' && 'A' <= c2 && c2 <= 'Z' && 'z' - c1 < 'Z' - c2);
    std::cout << (logicStatement ? "true" : "false");

    return 0;
}
