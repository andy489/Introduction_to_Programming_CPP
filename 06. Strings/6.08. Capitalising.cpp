// github.com/andy489

#include <iostream>
#include <string>

bool isLower(char a) {
    return a >= 'a' && a <= 'z';
}

bool isUpper(char a) {
    return a >= 'A' && a <= 'Z';
}

void titleCase(std::string &text) {
    size_t length = text.length();

    bool prevSymbol = true;

    for (size_t i = 0; i < length; i++) {
        char c = text[i];
        if (!(isLower(c) || isUpper(c)))
            prevSymbol = true;
        else if (prevSymbol) {
            prevSymbol = false;
            if (isLower(c))
                text[i] -= ' ';
        }
    }
}

int main() {
    std::string text;
    getline(std::cin, text);

    titleCase(text);
    std::cout << text << '\n';

    return 0;
}
