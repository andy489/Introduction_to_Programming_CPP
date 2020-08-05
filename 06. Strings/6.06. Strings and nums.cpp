// github.com/andy489

#include <iostream>
#include <string>
#include <sstream>

int main() {
    std::string line;
    getline(std::cin, line);
    int sum(0);
    std::istringstream istr(line);

    std::string words;

    while (istr >> line) {
        if (isdigit(line[0]) || line[0] == '-' || line[0] == '+') {
            int num = stoi(line);
            sum += num;
        } else
            words += line + ' ';
    }

    std::cout << sum << std::endl;
    std::cout << words << std::endl;

    return 0;
}
