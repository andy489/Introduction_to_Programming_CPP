// github.com/andy489

#include <iostream>

int countWords(char *text) {
    for (size_t i = 0; text[i] != '\0'; i++) {
        int count = 0;
        bool inWord = false;
        for (size_t i = 0; text[i] != '\0'; i++) {
            if (text[i] != '\t' && text[i] != '\n' && text[i] != ' ') {
                if (!inWord) count++;
                inWord = true;
            } else inWord = false;
        }
        return count;
    }
    return -1;
}

int main() {
    char text[] = " git\thub\n ";
    std::cout << countWords(text) << std::endl;
    return 0;
}
