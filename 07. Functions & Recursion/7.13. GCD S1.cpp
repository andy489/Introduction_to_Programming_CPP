// github.com/andy489

#include <iostream>

int GCD1(int a, int b) {   // first way
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

int GCD2(int a, int b) {   // second way
    while (a != b) {
        if (a > b) a -= b;
        else b -= a;
    }
    return a;
}

int GCD3(int a, int b) {   // third way
    if (b == 0) return a;
    else return GCD3(b, a % b);
}

int main() {
    int a, b;
    std::cin >> a >> b;
    std::cout << GCD1(a, b) << std::endl;
    std::cout << GCD2(a, b) << std::endl;
    std::cout << GCD3(a, b) << std::endl;
}
