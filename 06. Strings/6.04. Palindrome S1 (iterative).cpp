// github.com/andy489

#include <iostream>
#include <cstring>

bool isPalindrome(const char *str) {
    size_t len = strlen(str);
    for (size_t i = 0; i < len / 2; i++)
        if (str[i] != str[len - i - 1]) return false;
    return true;
}

int main() {
    const char *str = "civic";
    //isPalindrome1(str) ? std::cout << "palindrome" : std::cout << "not palindrome";
    std::cout << isPalindrome(str);
    return 0;
}
