// github.com/andy489

#include <iostream>

int main() {
    std::cout << "Enter your age: \n";
    size_t age;
    std::cin >> age;
    size_t months = age * 12,
            weeks = (size_t) (age * 52.177457),
            days = (size_t) (age * 365.242199),
            hours = days * 24,
            minutes = hours * 60,
            seconds = minutes * 60;
    std::cout << seconds << " seconds\n" << days << " days\n"
              << weeks << " weeks\n" << months << " months";
    return 0;
}
