// github.com/andy489

#include <iostream>

void scrollArr(double arr[], size_t n) {
    double temp = arr[0];
    for (size_t i = 0; i < n - 1; i++) arr[i] = arr[i + 1];
    arr[n - 1] = temp;
}

void printMatrix(double A[][8], const size_t n) {
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) std::cout << A[i][j] << ' ';
        std::cout << std::endl;
    }
}

int main() {
    double arr[] = {1.13, 2.16, 3.22, 4.11, 5.09, 6.78, 7.32, 8.13};
    const size_t len = sizeof(arr) / sizeof(arr[0]);

    double A[len][len];

    for (size_t i = 0; i < len; i++) {
        for (size_t j = 0; j < len; j++) A[i][j] = arr[j];
        scrollArr(arr, len);
    }
    printMatrix(A, len);

    return 0;
}
