// github.com/andy489

#include <iostream>

size_t myStrLen(const char *str) {
    size_t len;
    for (len = 0; str[len] != '\0'; len++) {}
    return len;
}

bool isDigit(const char symbol) {
    return (symbol >= '0' && symbol <= '9');
}

bool checkDate(const char *text) {
    size_t len = myStrLen(text);
    if (len != 5) return false;
    if (!isDigit(text[0]) || !isDigit(text[1])) return false;
    if (text[2] != '.') return false;
    if (!isDigit(text[3]) || !isDigit(text[4])) return false;

    size_t days = (text[0] - '0') * 10 + text[1] - '0';
    size_t months = ((text[3] - '0') * 10 + text[4] - '0');
    if (months < 1 || months > 12) return false;
    size_t maxDaysPerMonth[] =
            {
                    0,
                    31, 29, 31, 30, 31, 30,
                    31, 31, 30, 31, 30, 31
            };
    return days <= maxDaysPerMonth[months];
}

int main() {
    const char *str1 = "22.12";
    const char *str2 = "31.02";

    std::cout << checkDate(str1) << '\n';
    std::cout << checkDate(str2) << '\n';
    return 0;
}
