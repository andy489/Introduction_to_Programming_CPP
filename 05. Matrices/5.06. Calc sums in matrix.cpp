// github.com/ndy489

#define n 4

#include <iostream>

int **inputMatrix(size_t m) {
    int **matrix = new int *[m];
    for (size_t i = 0; i < m; i++)
        matrix[i] = new int[m];
    for (size_t i = 0; i < m; i++)
        for (size_t j = 0; j < m; j++)
            matrix[i][j] = j + 1;
    return matrix;
}

void printMatrix(int **matrix, size_t m) {
    for (size_t i = 0; i < m; i++)
        for (size_t j = 0; j < m; j++)
            std::cout << matrix[i][j] << ' ';
    std::cout << std::endl;
}

void releaseMatrix(int **A, size_t m) {
    for (size_t i = 0; i < m; i++)
        delete[] A[i];
    delete[] A;
}

int sumOverMainDiagonal(int **A, size_t m) { // a)
    int sum = 0;
    for (size_t i = 0; i < m; i++)
        for (size_t j = 0; j < m; j++)
            if (i < j)
                sum += A[i][j];
    return sum;
}

int prodUnderMainDiagonal(int **A, size_t m) { // b)
    int prod = 1;
    for (size_t i = 0; i < m; i++)
        for (size_t j = 0; j < m; j++)
            if (i > j)
                prod *= A[i][j];
    return prod;
}

int positiveElementsFromMainDiag(int **A, size_t m) { // c)
    int sum = 0;
    for (size_t i = 0; i < m; i++)
        if (A[i][i] > 0)
            sum += A[i][i];
    return sum;
}

int productElementsFromSecDiag(int **A, size_t m) { // d)
    int prod = 1;
    for (size_t i = 0; i < m; i++)
        prod *= A[i][m - i - 1];
    return prod;
}

int sumElementsOutOfSecDiag(int **A, size_t m) { // e)
    int sum = 0;
    for (size_t i = 0; i < m; i++)
        for (size_t j = 0; j < m; j++)
            if (i != j)
                sum += A[i][j];
    return sum;
}

int main() {
    int **A = inputMatrix(n);
    printMatrix(A, n);

    int sum = sumOverMainDiagonal(A, n);
    std::cout << "Sum of elements under the main diagonal is: " << sum << "\n";

    int prod = prodUnderMainDiagonal(A, n);
    std::cout << "Prod of elements under the main diagonal is: " << prod << "\n";

    int sumPosDiag = positiveElementsFromMainDiag(A, n);
    std::cout << "Sum of positive elements from the main diagonal is: " << sumPosDiag << "\n";

    int prodSecDiag = productElementsFromSecDiag(A, n);
    std::cout << "Product of elements from the second diagonal is: " << prodSecDiag << "\n";

    int sumOutSecDiag = sumElementsOutOfSecDiag(A, n);
    std::cout << "Sum of elements out of the second diagonal is: " << sumOutSecDiag << "\n";

    releaseMatrix(A, n);

    return 0;
}
