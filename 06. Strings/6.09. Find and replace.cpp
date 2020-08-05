// github.com/andy489

#include <iostream>
#include <string>

void replaceAll(std::string &text, const std::string &search, const std::string &replace) {
    size_t searchLen(search.size()), repLen(replace.size());
    if (!search.empty()) {
        size_t start(0);
        for (start; (start = text.find(search, start)) != std::string::npos; start += repLen)
            text.replace(start, searchLen, replace);
    }
}

int main() {
    std::string text;
    getline(std::cin, text);
    std::string search;
    getline(std::cin, search);
    std::string replace;
    getline(std::cin, replace);

    replaceAll(text, search, replace);
    std::cout << text << '\n';

    return 0;
}
