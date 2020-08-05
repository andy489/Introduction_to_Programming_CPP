// github.com/andy489

#define N 5

#include <iostream>

void countAppearances(int A[N][N], size_t n, bool(&appearances)[N][N]) {
    for (size_t i = 0; i < n; i++) {
        size_t j = 0;
        S:
        for (j; j < n; j++) {
            if (!appearances[i][j]) // optimization
            {
                int curr = A[i][j];
                for (size_t k = 0; k < n; k++) {
                    for (size_t l = 0; l < n; l++) {
                        if (curr == A[k][l] && (i != k && j != l)) {
                            appearances[i][j] = true;
                            if (appearances[i][j] == true) {
                                appearances[k][l] = true; // optimization
                                j++;
                                goto S;
                            }
                        }
                    }
                }
            }
        }
    }
}

template<typename T>
void printM(T M[N][N], size_t n) {
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++)
            std::cout << M[i][j] << ' ';
        std::cout << std::endl;
    }
}

int main() {
    int A[N][N] = {2, 4, 10, -9, -2,
                   22, -2, 10, 10, 3,
                   14, 0, 8, 5, 2,
                   17, 18, 0, 14, 9,
                   0, 0, 7, 9, 17};
    bool appearances[N][N]; // Make a size_t array to check is an element apears more than once 
    memset(appearances, 0, sizeof(appearances));
    countAppearances(A, N, appearances);
    printM(appearances, N);
    int maxNum = A[0][0];
    for (size_t i = 0; i < N; i++)
        for (size_t j = 0; j < N; j++)
            if (appearances[i][j] == 1)
                if (maxNum < A[i][j])
                    maxNum = A[i][j];
    std::cout << maxNum;
    return 0;
}
