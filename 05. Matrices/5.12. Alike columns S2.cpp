// github.com/andy489

#include <iostream>

void findSimilarRows(int **matrix, size_t rows);

bool isSubset(int **matrix, size_t firstColumn, size_t secondColumn, size_t rows);

bool isContained(int **matrix, size_t column, size_t searchedElement, size_t rows);

int main() {
    std::cout << "Enter number of rows and columns: ";
    size_t rows;
    std::cin >> rows;

    std::cout << "Enter the elements of the matrix: " << std::endl;
    int **matrix = new int *[rows];

    // matrix allocation and initialization
    for (size_t i = 0; i < rows; i++) {
        matrix[i] = new int[rows];
        for (size_t j = 0; j < rows; j++) std::cin >> matrix[i][j];
    }
    std::cout << std::endl;

    //print matrix
    std::cout << "The matrix is: " << std::endl;
    for (size_t i = 0; i < rows; i++) {
        for (size_t j = 0; j < rows; j++) std::cout << matrix[i][j] << " ";
        std::cout << std::endl;
    }
    std::cout << std::endl;

    findSimilarRows(matrix, rows);

    // deleting matrix
    for (size_t i = 0; i < rows; i++) delete[] matrix[i];
    delete[] matrix;

    return 0;
}

// checks if two columns are similar
void findSimilarRows(int **matrix, size_t rows) {
    bool areSimilarColumns = false;

    for (size_t i = 0; i < rows; i++) {
        for (size_t j = i + 1; j < rows; j++) {
            if (isSubset(matrix, i, j, rows) && isSubset(matrix, i, j, rows)) {
                std::cout << "Columns " << i << " and " << j << " are similar" << std::endl;
                areSimilarColumns = true;
            }
        }
    }
    if (!areSimilarColumns) std::cout << "There are no similar columns" << std::endl;
}

// checks if the elements of secondColumn are contained in firstColumn
bool isSubset(int **matrix, size_t firstColumn, size_t secondColumn, size_t rows) {
    for (size_t i = 0; i < rows; i++) {
        if (!isContained(matrix, firstColumn, matrix[i][secondColumn], rows)) return false;
    }
    return true;
}

// checks if searchedElement is contained in the column
bool isContained(int **matrix, size_t column, size_t searchedElement, size_t rows) {
    for (size_t i = 0; i < rows; i++) {
        if (matrix[i][column] == searchedElement) return true;
    }
    return false;
}
