#include <iostream>

int **createMatrix(int n);

void fillMatrix(int **&A, int n);

void releaseMatrix(int **A, int n);

void printMatrix(int **A, int n);

void printSequence(int *B, int n);

int *createSequence(int n);

void releaseSequence(int *B);

void spiral(int **A, int k, int n, int *&B, unsigned &c) {
    int i, j;
    // развиване на k-ти ред
    i = k;
    for (j = k; j <= n - 1 - k; j++)
        B[c++] = A[i][j];
    // развиване на n-k-ви стълб
    j = n - 1 - k;
    for (i = k + 1; i < n - k; i++)
        B[c++] = A[i][j];
    // развиване на n-k-ви ред
    i = n - 1 - k;
    for (j = n - 1 - k - 1; j >= k; j--)
        B[c++] = A[i][j];
    // развиване на k-ти стълб
    j = k;
    for (i = n - 1 - k - 1; i > k; i--)
        B[c++] = A[i][j];
    // преминаваме на развиване на вътрешността на А'
    k++;// променяме k (много важен момент)
    if (k == n - 1 - k) // остава само един елемент за развиване
        B[c++] = A[k][k];
    else if (k < n - 1 - k) // има още спирали за развиване
        spiral(A, k, n, B, c);
}

int main() {
    int n;
    std::cout << "size of matrix n = ";
    std::cin >> n;

    int **A = createMatrix(n);
    fillMatrix(A, n);
    std::cout << "The matrix is:\n";
    printMatrix(A, n);

    int *B = createSequence(n);

    unsigned c(0); // брояч помнещ точната позиция за поставяне в редицата
    spiral(A, 0, n, B, c); // рекурсивната функция за спираловидно извеждане

    printSequence(B, n * n);

    releaseMatrix(A, n);
    releaseSequence(B);

    return 0;
}

int **createMatrix(int n) {
    int **A = new int *[n];
    for (int i = 0; i < n; i++)
        A[i] = new int[n];
    return A;
}

void fillMatrix(int **&A, int n) {
    std::cout << "Fill the matrix with size " << n << 'x' << n << ":\n";
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            std::cout << "a[" << i << "][" << j << "] = ";
            std::cin >> A[i][j];
        }
        std::cout << std::endl;
    }
}

void releaseMatrix(int **A, int n) {
    for (int i = 0; i < n; i++) {
        delete[] A[i];
    }
    delete[] A;
}

void printMatrix(int **A, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++)
            std::cout << A[i][j] << ' ';
        std::cout << std::endl;
    }
}

void printSequence(int *B, int n) {
    std::cout << "The sequence is:\n";
    for (int i = 0; i < n; i++)
        std::cout << B[i] << ' ';
    std::cout << std::endl;
}

int *createSequence(int n) {
    int *B = new int[n * n];
    return B;
}

void releaseSequence(int *B) {
    delete[] B;
}
