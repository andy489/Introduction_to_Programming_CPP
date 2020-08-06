#include <iostream>

int inputNum(int lowerBound, int upperBound) {
    int n;
    while (true) {
        std::cout << "n = ";
        std::cin >> n;
        if (std::cin.fail()) {
            std::cin.clear();
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
        } else if ((n >= lowerBound) && (n <= upperBound)) break;
    }
    return n;
}

void printSymbol(unsigned n, char symbol) {
    for (size_t i = 0; i < n; i++)std::cout << symbol;
}

void printSymbolSpecial(unsigned n, char symbol) {
    for (size_t i = 0; i < n; i++) {
        if (i == 0 || i == n - 2) std::cout << 'O';
        else {
            if (i % 2 == 1) std::cout << ' ';
            else std::cout << symbol;
        }
    }
}

int main() {
    unsigned n = inputNum(0, 52);
    if (n % 2 == 1) {
        printSymbol(n - 1, ' ');
        std::cout << "+\n";
        for (unsigned i = 3; i < n + 1; i++) {
            printSymbol(n - i, ' ');
            printSymbolSpecial(2 * i, '*');
            std::cout << std::endl;
        }
        printSymbol(n - 1, ' ');
        std::cout << "|\n";
    } else std::cout << "Happy New Year\n";
    return 0;
}
