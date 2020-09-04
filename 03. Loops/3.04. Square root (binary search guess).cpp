// github.com/andy489

#include <iostream>
#include <cmath>

using namespace std;

#define eps 0.000001

double sq(int n) {
    if (n == 0)
        return 0.0;
    double low = 0, high = n / 2 + 1,
            mid = low + (high - low) / 2;

    while (abs((mid * mid) - n) > eps) {
        if ((mid * mid) > n) {
            high = mid;
            mid = low + (high - low) / 2;

        } else {
            low = mid;
            mid = low + ((high - low) / 2);
        }
    }
    return mid;
}

int main() {
    double x;
    cin >> x;

    return cout << sq(x), 0;
}
