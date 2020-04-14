// github.com/andy489

#include <iostream>
#include <cmath>

int getRow(int n) {
    /* Knowing the n-th row ends with n*(n+1)/2, we can make quadratic equation
    and solve it to get row number for given number k.
    So, n * (n+1)/2 = k, or n * n + n - 2 * k = 0 and D = 1 + 8 * k.         */
    int D = 1 + 8 * n;
    int row = (int) (ceil((-1 + sqrt(D)) / 2));
    return row;
}

int getCol(int n) {
    int r = getRow(n);
    int col = n - r * (r - 1) / 2; //n minus last number form the upper row
    return col;
}

int main() {
    int n;
    std::cin >> n;
    std::cout << "Number " << n << " lies in row " << getRow(n) << ", column " << getCol(n)
              << " of the Floyd's triangle.\n";
    return 0;
}
