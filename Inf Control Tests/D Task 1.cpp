#include <iostream>

using namespace std;
typedef unsigned int uint;

uint getm(uint n) {
    int res = 1;

    do {
        res *= n % 10;
        n /= 10;
    } while (n);
    return res;
};

// find first n numbers such that the product of their digits 
// can be divided by k

int main() {
    uint n = 5;
    uint k = 1;
    uint cnum = 1;
    do {
        if (getm(cnum) % k == 0) {
            cout << cnum << ' ';
            n--;
        }
        cnum++;
    } while (n > 0);
}
