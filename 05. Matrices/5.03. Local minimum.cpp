// github.com/andy489

#define ROWS 6
#define COLUMNS 6

#include <iostream>

int main() {
    int A[ROWS][COLUMNS] = {
            2, 3, -4, 12, 5, 45,
            3, 9, 2, 8, -1, 16,
            44, -12, -4, 44, 23, 1,
            3, 23, 45, 0, 19, 8,
            0, -3, -14, -44, 12, 6,
            2, 4, 90, 4, 5, -10
    };
    for (size_t i = 1; i < ROWS - 1; i++) {
        for (size_t j = 1; j < COLUMNS - 1; j++) {
            if (A[i][j] < A[i - 1][j] && A[i][j] < A[i + 1][j] && A[i][j] < A[i][j + 1] && A[i][j] < A[i][j - 1])
                std::cout << A[i][j] << ' ';
        }
    }
    return 0;
}
