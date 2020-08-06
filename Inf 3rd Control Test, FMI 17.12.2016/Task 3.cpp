#include <iostream>

bool isUppercaseLetter(char ch) {
    if (ch >= 'A' && ch <= 'Z') return true;
    return false;
}

bool isLowercaseLetter(char ch) {
    if (ch >= 'a' && ch <= 'z') return true;
    return false;
}

unsigned maxCount(unsigned *arr, unsigned n) {
    unsigned max = 0;
    for (size_t i = 0; i < n; i++) if (arr[i] > max) max = arr[i];
    return max;
}

unsigned maxOccurs(char *txt, unsigned int len) {
    unsigned alphabet[26];
    memset(alphabet, 0, sizeof(alphabet));
    for (size_t i = 0; i < len; i++) {
        char curr = txt[i];
        if (isUppercaseLetter(curr)) alphabet[(int) txt[i] - 65]++;
        else if (isLowercaseLetter(curr)) alphabet[(int) txt[i] - 97]++;
    }
    return maxCount(alphabet, 26);
}

int main() {
    char txt[] = {"OnomatOpoeia"};
    unsigned int len = sizeof(txt) / sizeof(txt[0]);
    std::cout << maxOccurs(txt, len);
    return 0;
}
