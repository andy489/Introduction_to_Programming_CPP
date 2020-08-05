// github.com/andy489

#include <iostream>
#include <ctime>
#include <string>

int main() {
    struct std::tm a = {0, 0, 0, 22, 11, 88}; /* December 22, 1988 */
    struct std::tm b = {0, 0, 0, 7, 6, 119}; /* July 7, 2019 */
    std::time_t x = std::mktime(&a);
    std::time_t y = std::mktime(&b);
    if (x != (std::time_t) (-1) && y != (std::time_t) (-1)) {
        double difference = std::difftime(y, x) / (60 * 60 * 24);
        char str1[26];
        asctime_s(str1, 26, &a); //ctime_s(str1, 26, &x);
        char str2[26];
        asctime_s(str2, 26, &b); //ctime_s(str1, 26, &y);
        std::cout << str1 << std::endl;
        std::cout << str2 << std::endl;
        std::cout << "difference = " << difference << " days" << std::endl;
    }
    return 0;
}
