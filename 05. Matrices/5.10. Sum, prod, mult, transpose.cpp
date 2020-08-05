// github.com/andy489

#include <iostream>

int *inputVector(size_t k) {
    int *newVec = new int[k];
    for (size_t i = 0; i < k; i++)
        std::cin >> newVec[i];

    return newVec;
}

int **inputMatrix(size_t n, size_t m) {
    int **matrix = new int *[n];
    for (size_t i = 0; i < n; i++)
        matrix[i] = new int[m];

    for (size_t rows = 0; rows < n; rows++)
        for (size_t cols = 0; cols < m; cols++)
            std::cin >> matrix[rows][cols];

    return matrix;
}

void releaseMatrix(int **matrix, size_t n) {
    for (size_t i = 0; i < n; i++)
        delete[] matrix[i];
    delete[] matrix;
}

int **sumMatrix(int **A, size_t n1, size_t m1, int **B) { // a)
    int **sum = new int *[n1];
    for (size_t i = 0; i < n1; i++)
        sum[i] = new int[m1];

    for (size_t i = 0; i < n1; i++)
        for (size_t j = 0; j < m1; j++)
            sum[i][j] = A[i][j] + B[i][j];

    return sum;
}

int *prodMatrixVector(int **A, size_t n, size_t m, int *arr, size_t k) { // b)
    int *resultVec = new int[k];
    for (size_t i = 0; i < k; i++)
        resultVec[i] = 0;

    for (size_t i = 0; i < n; i++)
        for (size_t j = 0; j < m; j++)
            resultVec[i] += A[i][j] * arr[j];

    return resultVec;
}

int **multMatrix(int **A, size_t n1, size_t m1, int **B, size_t n2, size_t m2) { // c)
    int **mult = new int *[n1];
    for (size_t i = 0; i < n1; i++)
        mult[i] = new int[m2];

    for (size_t i = 0; i < n1; i++)
        for (size_t j = 0; j < m2; j++)
            mult[i][j] = 0;

    for (size_t i = 0; i < n1; i++)
        for (size_t j = 0; j < m2; j++)
            for (size_t k = 0; k < m1; k++)
                mult[i][j] += A[i][k] * B[k][j];

    return mult;
}

int **transposeMatrix(int **A, size_t n1, size_t m1) { // d)
    int **tMatrix = new int *[m1];
    for (size_t i = 0; i < m1; i++) {
        tMatrix[i] = new int[n1];
    }
    for (size_t i = 0; i < m1; i++) {
        for (size_t j = 0; j < n1; j++) {
            tMatrix[i][j] = A[j][i];
        }
    }
    return tMatrix;
}

void printVec(int *arr, size_t n) {
    for (size_t i = 0; i < n; i++)
        std::cout << arr[i] << ' ';

    std::cout << std::endl;
}

void printMatrix(int **matrix, size_t n, size_t m) {
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < m; j++)
            std::cout << matrix[i][j] << ' ';
        std::cout << std::endl;
    }
}

int main() {
    size_t n1, m1, n2, m2, k;
    std::cout << "Rows A: ";
    std::cin >> n1;
    std::cout << "Cols A: ";
    std::cin >> m1;
    std::cout << "Rows B: ";
    std::cin >> n2;
    std::cout << "Cols B: ";
    std::cin >> m2;

    std::cout << "Vector length: ";
    std::cin >> k;

    std::cout << "Enter matrix A:\n";
    int **A = inputMatrix(n1, m1);
    std::cout << "Enter matrix B:\n";
    int **B = inputMatrix(n2, m2);
    std::cout << "Enter vector V:\n";
    int *vec = inputVector(k);

    std::cout << "Command menu:\nA - Add\nV - multiply matrix by vector\n";
    std::cout << "M - multiply matrices\nT - transpose matrix\n";

    while (true) {
        char command;
        std::cout << "Command: ";
        std::cin >> command;
        switch (command) {
            case 'Q': {
                releaseMatrix(A, n1);
                releaseMatrix(B, n2);
                delete[] vec;
                return 0;
            }
            case 'A': {
                if (n1 != n2 || m1 != m2) {
                    std::cout << "Cannot add matrices of different sizes.\n";
                } else {
                    std::cout << "Sum of matrices A and B:\n";
                    int **sum = sumMatrix(A, n1, m1, B, n2, m2);
                    printMatrix(sum, n1, m2);
                    releaseMatrix(sum, n1);
                }
                releaseMatrix(A, n1);
                releaseMatrix(B, n2);
                delete[] vec;
                break;
            }
            case 'V': {
                if (m1 != k) {
                    std::cout << "Error! Size of column not equal to size of vector\n";
                } else {
                    std::cout << "Product of matrix A and vector V:\n";
                    int *resultVec = prodMatrixVector(A, n1, m1, vec, k);
                    printVec(resultVec, k);
                    delete[] resultVec;
                }
                releaseMatrix(A, n1);
                releaseMatrix(B, n2);
                delete[] vec;
                break;
            }
            case 'M': {
                if (m1 != n2) {
                    std::cout << "Error! Column of first matrix not equal to row of second.\n";
                } else {
                    std::cout << "Multiplication of matrices A and B:\n";
                    int **result = multMatrix(A, n1, m1, B, n2, m2);
                    printMatrix(result, n1, m2);
                    releaseMatrix(result, n2);
                }
                break;
            }
            case 'T': {
                std::cout << "Transpose matrix A:\n";
                int **tMatrix = transposeMatrix(A, n1, m1);
                printMatrix(tMatrix, m1, n1);
                releaseMatrix(tMatrix, m1);
                releaseMatrix(A, n1);
                releaseMatrix(B, n2);
                delete[] vec;
                break;
            }
            case ' ':
            case '\n': {
                releaseMatrix(A, n1);
                releaseMatrix(B, n2);
                delete[] vec;
                break;
            }
            default: {
                releaseMatrix(A, n1);
                releaseMatrix(B, n2);
                delete[] vec;
                std::cout << "invalid command" << std::endl;
            }
        }
    }
}
