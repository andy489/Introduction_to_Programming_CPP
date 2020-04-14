// github.com/andy489

#include <iostream>

int myPower(double a, int n) {
    if (n == 0)
        return 1;
    if (n == 1)
        return a;
    if (!(n & 1)) {
        double result = myPower(a, n / 2);
        return result * result;
    } else
        return a * myPower(a, n - 1);
}

int main() {
    int n;
    std::cin >> n;
    int countZeros(0), i(1);
    while (n / i >= 1) {
        int pow5 = myPower(5, i);
        countZeros += (int) (n / pow5);
        /* Since there are many more numbers that are even
        than are multiplies of 5, we need to count all the 5's
        in the prime factorization (10 also includes 5 in it
        so we will not worry about it) */
        if (pow5 > n)
            break;
        ++i;
    }
    std::cout << countZeros;
}
