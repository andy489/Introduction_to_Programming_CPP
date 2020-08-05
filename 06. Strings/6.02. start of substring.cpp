// github.com/andy489

#include <iostream>
#include <string>

int main() {
    std::string sentence, word;
    std::getline(std::cin, sentence);
    std::cin >> word;
    size_t wordLen = word.length();
    size_t foundIndex = sentence.find(word);

    while (foundIndex != std::string::npos) { // std::string::npos == -1;
        std::cout << word << " found at " << foundIndex << std::endl;
        foundIndex = sentence.find(word, foundIndex + wordLen);
    }

    return 0;
}
