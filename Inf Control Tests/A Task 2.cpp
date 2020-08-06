#include <iostream>

typedef unsigned int uint;

int main() {
    uint n = 0, cpos = 1;
    bool even = false;
    bool goodseq = true;
    std::cin >> n;
    do {
        uint num;
        std::cin >> num;
        if ((even && num & 1) ||
            (cpos && num % cpos)) {
            goodseq = false;
        }
        even = !even;
    } while (++cpos <= n && goodseq);

    std::cout << (goodseq ? "YES" : "NO");
    return 0;
}
