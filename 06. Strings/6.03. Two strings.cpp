// github.com/andy489

#include <iostream>
#include <cstring>

char *myStrcat(char *source, char *destination) {
    size_t resLen = strlen(source) + strlen(destination) + 1;
    char *result = (char *) malloc(resLen);
    size_t ptr(0), temp(0);

    while (source[temp] != '\0') result[ptr++] = source[temp++];
    temp = 0;
    while (destination[temp] != '\0') result[ptr++] = destination[temp++];

    result[resLen - 1] = '\0';
    return result;
}

int main() {
    char str1[100];
    std::cout << "Enter a string: ";
    std::cin.get(str1, 100);
    //std::cout << "You entered: " << str1 << std::endl;
    std::cin.ignore(); // cut the input stream

    char str2[100];
    std::cout << "Enter another string: ";
    std::cin.get(str2, 100);
    //std::cout << "You entered: " << str2 << std::endl;
    size_t len1 = strlen(str1);
    size_t len2 = strlen(str2);
    std::cout << len1 << ' ' << len2 << std::endl;
    char *str3 = new char[len1 + len2 + 1];
    str3 = myStrcat(str1, str2);
    std::cout << str3 << std::endl;
    delete[] str3;

    std::swap(str1[0], str2[0]);
    std::cout << str1 << ' ' << str2 << std::endl;

    return 0;
}
