// github.com/andy489

#include <iostream>

size_t myStrlen(const char *str) {
    size_t len;
    for (len = 0; str[len] != '\0'; len++) {}
    return len;
}

int myStrcmp(const char *str1, const char *str2) {
    while (*str1 && (*str1 == *str2)) {
        str1++;
        str2++;
    }
    return *(const unsigned char *) str1 - *(const unsigned char *) str2;
}

const char *myStrcat(const char *source, const char *destination) {
    size_t resLen = myStrlen(source) + myStrlen(destination) + 1;
    char *result = (char *) malloc(resLen);
    size_t ptr(0), temp(0);

    while (source[temp] != '\0') result[ptr++] = source[temp++];
    temp = 0;
    while (destination[temp] != '\0') result[ptr++] = destination[temp++];

    result[resLen - 1] = '\0';
    return result;
}

char *myStrcpy(char *dest, const char *src) {
    if (dest == nullptr) return nullptr;
    char *ptr = dest;
    while ((*dest++ = *src++) != '\0')
        *dest = '\0';
    return ptr;
}

int main() {
    const char *str1 = "test string";
    const char *str2 = "second string";
    std::cout << myStrlen(str1) << std::endl;

    std::cout << myStrcmp(str1, str2) << std::endl;

    const char *str3 = "these strings ";
    const char *str4 = "are concatenated";
    const char *res = myStrcat(str3, str4);
    std::cout << res << std::endl;

    std::cout << myStrlen(res) << std::endl;

    delete[] myStrcat(str3, str4);

    char destination[] = "some longer text";
    char *copyStr = myStrcpy(destination, str1);

    std::cout << copyStr << std::endl;
}
