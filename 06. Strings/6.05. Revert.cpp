// github.com/andy489

#include <iostream>

size_t strLen(char *text) {
    size_t len;
    for (len = 0; text[len] != '\0'; len++) {}
    return len;
}

void revert(char *text) {
    size_t len = strLen(text);
    for (size_t i = 0; i < len; i++) {
        bool isCapital = text[i] >= 'A' && text[i] <= 'Z';
        bool isLowercase = text[i] >= 'a' && text[i] <= 'z';
        text[i] += isCapital * 32 + isLowercase * (-32);
    }
}

int main() {
    char text[10] = "asd&ASD";
    std::cout << text << std::endl;
    revert(text);
    std::cout << text << std::endl;
    return 0;
}
