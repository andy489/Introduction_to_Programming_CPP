// github.com/andy489

#define N 8

#include <iostream>

const bool existK(int A[][N], size_t n) {
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) {
            if (A[i][j] != A[j][i]) break;
            if (j == n - 1) return true;
        }
    }
    return false;
}

int main() {
    int A[][N] = {1, 3, 5, 7, 1, 11, 14, 15,
                  2, 15, 8, 0, 13, 22, 34, -9,
                  11, -33, 13, 26, 7, 1, 15, 44,
                  12, -8, -19, 99, 0, 14, 75, 45,
                  4, 31, 20, 19, -5, -3, 98, 10,
                  13, 44, 7, 17, 16, 23, 43, 0,
                  14, 34, 15, 75, 98, 43, 19, 13,
                  18, -57, -41, 67, 2, 11, 13, 36};
    existK(A, N) ? std::cout << "yes, there exist such k" : std::cout << "no, there does not exist such k";
    return 0;
}
