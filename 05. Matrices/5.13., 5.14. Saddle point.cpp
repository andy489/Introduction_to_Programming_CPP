// github.com/andy489
// Task 5.13 & 5.14

#define M 5

#include <iostream>

int main() {
    int A[][M] = {10, 11, 12, 44, 19,
                  17, 12, 33, 11, 20,
                  66, 33, 94, 83, 35,
                  13, 23, 19, 15, 33,
                  22, 10, 23, 11, 17};
    size_t N = sizeof(A) / sizeof(A[0][0]) / M;

    for (size_t i = 0; i < N; i++) {
        int max = A[0][i];
        size_t col(0);
        for (size_t j = 0; j < M; j++) {
            if (A[j][i] > max) {
                max = A[j][i];
                col = j;
            }
        }
        bool saddle = true;
        int min = A[col][i];
        for (size_t k = 0; k < N; k++) {
            if (A[col][k] < min) {
                saddle = false;
                break;
            }
        }
        if (saddle) {
            std::cout << "Saddle point A[i][j]= A[" << i << "][" << col << ']';
            std::cout << std::endl;
            return 0;
        }
    }
    std::cout << "Matrix A does not have a saddle point";
    return 0;
}
