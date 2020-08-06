#include <iostream>

int A[20][20];

void inputMatrix(unsigned n) {
    for (unsigned rows = 0; rows < n; rows++) {
        for (unsigned cols = 0; cols < n; cols++) {
            std::cout << "A[" << rows << "][" << cols << "] = ";
            std::cin >> A[rows][cols];
        }
    }
}

void printMatrix(unsigned n) {
    std::cout << "The matrix is:\n";
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) std::cout << A[i][j] << ' ';
        std::cout << std::endl;
    }
}

unsigned count(unsigned n) {
    unsigned cnt = 0;
    for (unsigned r = 0; r < n; r++) {
        for (unsigned c = 0; c < n - 2; c++) {
            int first = A[r][c];
            int second = A[r][c + 1];
            int third = A[r][c + 2];
            if ((first == second - 1 && second == third - 1 && first > 0) ||
                (third == second - 1 && second == first - 1 && third > 0)) {
                cnt++;
                break;
            }
        }
    }
    return cnt;
}

int main() {
    unsigned n;
    std::cout << "Enter size of the matrix n (0<n<21): ";
    std::cin >> n;
    inputMatrix(n);
    printMatrix(n);
    std::cout << "Number of rows with at least 3 consecutive natural numbers is " << count(n);
    return 0;
}
