// github.com/andy489

#define n 5

#include <iostream>

double sumSquaresSpecEl(double A[][n], size_t m) {
    double sum = 0;
    for (size_t i = 1; i < m - 1; i++)
        for (size_t j = 1; j < m - 1; j++)
            if (A[i][j] >= (A[i - 1][j] + A[i][j - 1] + A[i][j + 1] + A[i + 1][j]) / 4.0) sum += A[i][j] * A[i][j];
    return sum;
}

int main() {
    double A[n][n] = {2.5, 4.1, 10.1, -9, -21,
                      7, -2.2, -1, 0, 3,
                      14, 0.6, 8, 5.9, 1.2,
                      17, 18, 0.3, 14, 1.9,
                      0, 0.7, 7, 9, 17};
    double sum = sumSquaresSpecEl(A, n);
    std::cout << "The sum of squares of all special elements is: " << sum << "\n";
    return 0;
}
