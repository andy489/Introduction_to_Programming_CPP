// github.com/andy489

#define N 3

#include <iostream>

const bool isMagicSquare(double A[][N], size_t n) {
    double sum(0);
    for (size_t i = 0; i < n; i++) sum += A[0][i]; // sum to compare

    double sumRow(0), sumCol(0);
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) {
            sumRow += A[i][j];
            sumCol += A[j][i];
        }
        if (sumRow != sumCol || sumRow != sum || sumCol != sum) return false;
        sumRow = 0;
        sumCol = 0;
    }
    return true;
}

int main() {
    double A[][N] = {3, 8, 1,
                     2, 4, 6,
                     7, 0, 5};
    isMagicSquare(A, N) ? std::cout << "Magic square!" : std::cout << "Not magic square";
    return 0;
}
