// github.com/andy489

#include <iostream>

double **inputMatrix(size_t n) { // a)
    double **matrix = new double *[n];
    for (size_t i = 0; i < n; i++)
        matrix[i] = new double[n];
    for (size_t i = 0; i < n; i++)
        for (size_t j = 0; j < n; j++)
            std::cin >> matrix[i][j];
    return matrix;
}

double *constructVec(double **matrix, size_t n) { // b)
    double *vec = new double[n * n];
    size_t k = 0;
    for (size_t j = 0; j < n; j++) {
        for (size_t i = 0; i < n; i++) {
            vec[k] = matrix[i][j];
            k++;
        }
    }
    return vec;
}

void sortVec(double *arr, size_t len) { // c)
    for (size_t i = 0; i < len - 1; i++) {
        size_t p;
        double min;
        p = i;
        min = arr[i];
        size_t j = i + 1;
        do {
            if (arr[j] < min) {
                min = arr[j];
                p = j;
            }
            j++;
        } while (j < len);
        std::swap(arr[p], arr[i]);
    }
}

double **constructMatrix(double *vec, size_t n) { // d)
    double **matrix = new double *[n];
    for (size_t i = 0; i < n; i++)
        matrix[i] = new double[n];
    size_t k = 0;
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) {
            matrix[i][j] = vec[k];
            k++;
        }
    }
    return matrix;
}

void printVec(double *arr, size_t len) {
    for (size_t i = 0; i < len; i++)
        std::cout << arr[i] << ' ';
    std::cout << std::endl;
}

void printMatrix(double **matrix, size_t n) { // e)
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++)
            std::cout << matrix[i][j] << ' ';
        std::cout << std::endl;
    }
}

void releaseMatrix(double **matrix, size_t rows) {
    for (size_t i = 0; i < rows; i++)
        delete[] matrix[i];
    delete[] matrix;
}

int main() {
    size_t n;
    std::cin >> n;
    double **A = inputMatrix(n);
    double *vec = constructVec(A, n);
    sortVec(vec, n * n);
    // printVec(vec, n*n);
    double **B = constructMatrix(vec, n);

    printMatrix(B, n);

    releaseMatrix(B, n);
    delete[] vec;
    releaseMatrix(A, n);

    return 0;
}
