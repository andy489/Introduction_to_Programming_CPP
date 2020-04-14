// github.com/andy489

#include <iostream>

int main() {
    int i = 1;
    for (;;) {
        if (i > 100)
            break;
        else if (i % 15 == 0)
            std::cout << "Fizz Buzz\n";
        else if (i % 3 == 0)
            std::cout << "Fizz\n";
        else if (i % 5 == 0)
            std::cout << "Buzz\n";
        else
            std::cout << i << std::endl;
        ++i;
    }
    return 0;
}
