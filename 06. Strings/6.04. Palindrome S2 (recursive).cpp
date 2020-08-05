// github.com/andy489

#include <iostream>
#include <string>

bool palindrome(const std::string &word, int start, int end) {
    if (start >= end) return true;
    else if (word[start] != word[end]) return false;
    return palindrome(word, start + 1, end - 1);
}

int main() {
    std::string word;
    std::cin >> word;
    size_t len = word.length();
    std::cout << (palindrome(word, 0, len - 1) ? "yes" : "no");
    return 0;
}
