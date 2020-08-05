// github.com/andy489

#include <iostream>

size_t strLen(const char *text) {
    size_t len;
    for (len = 0; text[len] != '\0'; len++) {}
    return len;
}

int subString(const char *subStr, const char *str) {
    size_t lenSubStr = strLen(subStr);
    size_t lenStr = strLen(str);
    if (lenSubStr > lenStr) return -1;

    for (size_t i = 0; i <= lenStr - lenSubStr; i++) {
        size_t j;
        /* For current index i, check for pattern match */
        for (j = 0; j < lenSubStr; j++)
            if (str[i + j] != subStr[j])
                break;
        if (j == lenSubStr)
            return i;
    }
    return -1;
}

int main() {
    const char *s1 = "hub";
    const char *s2 = "www.github.com";
    int res = subString(s1, s2);
    if (res == -1) std::cout << "Not present";
    else std::cout << "Present at index " << res;
    return 0;
}
