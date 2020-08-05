// github.com/andy489

#include <iostream>

int **inputMatrix(size_t rows, size_t cols) {
    int **matrix = new int *[rows];
    for (size_t i = 0; i < rows; i++) {
        matrix[i] = new int[cols];
    }
    for (size_t i = 0; i < rows; i++) {
        for (size_t j = 0; j < cols; j++) {
            matrix[i][j] = j + 1;
        }
    }
    return matrix;
}

void releaseMatrix(int **A, size_t m) {
    for (size_t i = 0; i < m; i++) {
        delete[] A[i];
    }
    delete[] A;
}

void printMatrix(int **matrix, size_t rows, size_t cols) {
    for (size_t i = 0; i < rows; i++) {
        for (size_t j = 0; j < cols; j++) {
            std::cout << matrix[i][j] << ' ';
        }
        std::cout << std::endl;
    }
}

int **eraseCol(int **A, size_t rows, size_t cols, size_t k) {
    if (k >= 1 && k < cols + 1) {
        int **B = new int *[rows];
        for (size_t i = 0; i < rows; i++) {
            B[i] = new int[cols - 1];
        }
        for (size_t i = 0; i < rows; i++) {
            for (size_t j = 0; j < cols - 1; j++) {
                if (j >= k - 1) {
                    B[i][j] = A[i][j + 1];
                } else {
                    B[i][j] = A[i][j];
                }
            }
        }
        return B;
    }
    return A;
}

int main() {
    size_t rows, cols, k;
    std::cout << "Matrix rows: ";
    std::cin >> rows;
    std::cout << "Matrix cols: ";
    std::cin >> cols;
    std::cout << "Erase col: ";
    std::cin >> k;

    int **A = inputMatrix(rows, cols);
    std::cout << "Matrix:\n";
    printMatrix(A, rows, cols);

    int **B = eraseCol(A, rows, cols, k);
    std::cout << "Matrix after erasing the " << k << "-th column:\n";
    if ((k >= 1 && k <= cols)) {
        printMatrix(B, rows, cols - 1);
        releaseMatrix(B, rows);
    } else {
        printMatrix(B, rows, cols);
        releaseMatrix(A, rows);
    }
    return 0;
}
