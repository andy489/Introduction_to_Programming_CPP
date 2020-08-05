// github.com/andy489

#include <iostream>

int **inputMatrix(size_t &rows, size_t &cols) {
    std::cin >> rows >> cols;
    int **matrix = new int *[rows];
    for (size_t i = 0; i < rows; i++)
        matrix[i] = new int[cols];
    for (size_t i = 0; i < rows; i++)
        for (size_t j = 0; j < cols; j++)
            std::cin >> matrix[i][j];
    return matrix;
}

void printRowsWithAtLeastOneNegativeElement(int **matrix, size_t rows, size_t cols) {
    std::cout << "Numbers of rows with at least one negative element:\n";
    for (size_t i = 0; i < rows; i++) {
        for (size_t j = 0; j < cols; j++) {
            if (matrix[i][j] < 0) {
                std::cout << i + 1 << std::endl;
                break;
            }
        }
    }
}

void releaseMatrix(int **matrix, size_t rows) {
    for (size_t i = 0; i < rows; i++)
        delete[] matrix[i];
    delete[] matrix;
}

int main() {
    size_t rows, cols;
    int **matrix = inputMatrix(rows, cols);
    printRowsWithAtLeastOneNegativeElement(matrix, rows, cols);
    releaseMatrix(matrix, rows);
    return 0;
}
