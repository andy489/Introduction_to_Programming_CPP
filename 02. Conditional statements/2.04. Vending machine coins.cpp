// github.com/andy489

#include <iostream>

int main() {
    std::cout << "Insert change: ";
    double change;
    std::cin >> change;

    size_t coins = change * 100,
            cnt(0); // counter
    while (coins > 0) { // 2.00; 1.00; 0.50; 0.20; 0.10; 0.05; 0.02; 0.01
        if (coins >= 200) {
            coins -= 200;
            ++cnt;
        } else if (coins >= 100) {
            coins -= 100;
            ++cnt;
        } else if (coins >= 50) {
            coins -= 50;
            ++cnt;
        } else if (coins >= 20) {
            coins -= 20;
            ++cnt;
        } else if (coins >= 10) {
            coins -= 10;
            ++cnt;
        } else if (coins >= 5) {
            coins -= 5;
            ++cnt;
        } else if (coins >= 2) {
            coins -= 2;
            ++cnt;
        } else if (coins >= 1) {
            coins -= 1;
            ++cnt;
        }
    }
    std::cout << cnt;
    return 0;
}
