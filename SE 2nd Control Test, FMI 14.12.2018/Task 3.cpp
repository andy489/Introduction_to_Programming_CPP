#include <iostream>
#include <string.h>

char finalText[1000];

void revert(char text[]) {
    size_t len = strlen(text);
    for (size_t i = 0; i < len; i++) {
        bool isCapital = text[i] >= 'A' && text[i] <= 'Z';
        bool isLowercase = text[i] >= 'a' && text[i] <= 'z';
        text[i] += isCapital * 32 + isLowercase * (-32);
    }
}

void rev(unsigned &n, unsigned &count) {
    count++;
    char text[50];
    std::cout << "Enter string number " << count << ": ";
    std::cin >> text;
    if (count != n)
        rev(n, count);
    revert(text);
    strcat(finalText, text);
}

int main() {
    unsigned n, count(0);
    std::cout << "Enter the number of symbol arrays: ";
    std::cin >> n;

    rev(n, count);

    std::cout << finalText;

    return 0;
}
