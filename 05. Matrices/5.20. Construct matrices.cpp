// github.com/andy489

#include <iostream>
#include <cmath>

int numLen(size_t n) {
    if (n == 0) return 1;
    else return size_t(floor(log10(n))) + 1;
}

void printSpaces(size_t n) {
    for (size_t i = 1; i <= n; i++) {
        std::cout << ' ';
    }
}

void printMatrix1(int **A, size_t rows, size_t cols) {
    for (size_t i = 0; i < rows; i++) {
        for (size_t j = 0; j < cols; j++) {
            printSpaces(numLen(rows - 1) - numLen(A[i][j]));
            std::cout << A[i][j] << ' ';
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;
}

void printMatrix2(int **A, size_t rows, size_t cols) {
    for (size_t i = 0; i < rows; i++) {
        for (size_t j = 0; j < cols; j++) {
            printSpaces(numLen(rows * cols) - numLen(A[i][j]));
            std::cout << A[i][j] << ' ';
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;
}

void printMatrix3(int **A, size_t rows, size_t cols) {
    for (size_t i = 0; i < rows; i++) {
        for (size_t j = 0; j < cols; j++) {
            printSpaces(numLen(rows) - numLen(A[i][j]));
            std::cout << A[i][j] << ' ';
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;
}

int **initializeMatrix(size_t n) {
    int **matrix = new int *[n];
    for (size_t i = 0; i < n; i++) {
        matrix[i] = new int[n];
    }
    return matrix;
}

int **firstMatrix(size_t n) { // a)
    int **A = initializeMatrix(n);
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) {
            if (i == j) {
                A[i][j] = i;
            } else {
                A[i][j] = 0;
            }
        }
    }
    return A;
}

int **secondMatrix(size_t n) { // b)
    int **B = initializeMatrix(n);
    size_t w = 1;
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) {
            B[i][j] = w++;
        }
    }
    return B;
}

int **thirdMatrix(size_t n) { // c)
    int **C = initializeMatrix(n);
    size_t w = 1;
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) {
            C[j][i] = w++;
        }
    }
    return C;
}

int **forthMatrix(size_t n) { // d)
    int **D = initializeMatrix(n);
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) {
            if (i <= j) {
                D[i][j] = j - i + 1;
            } else {
                D[i][j] = 0;
            }
        }
    }
    return D;
}

int **fifthMatrix(size_t n) { // e)
    int **E = initializeMatrix(n);
    size_t k = 1;
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) {
            if (i % 2 == 0) {
                E[j][i] = k;
                k++;
            } else {
                E[n - j - 1][i] = k;
                k++;
            }
        }
    }
    return E;
}

int **sixthMatrix(size_t n) { // f)
    int **F = initializeMatrix(n);

    int w = 1;

    int i;
    int j;

    for (int k = 0; k < (int) n; k++) {
        i = k;
        j = 0;

        while (i >= 0) {
            F[i][j] = w++;
            i = i - 1;
            j = j + 1;
        }
    }
    for (size_t k = 1; k < n; k++) {
        i = n - 1;
        j = k;
        while (j <= (int) n - 1) {
            F[i][j] = w++;
            i = i - 1;
            j = j + 1;
        }
    }
    return F;
}

int **seventhMatrix(size_t n) { // g)
    int **G = initializeMatrix(n);
    int w = 1;
    size_t i, j;
    for (size_t k = 0; k < n; k++) {
        i = n - k - 1;
        j = 0;
        while (i < n) {
            G[i][j] = w++;
            i++;
            j++;
        }
    }
    for (size_t k = 1; k < n; k++) {
        i = 0;
        j = k;
        while (j < n) {
            G[i][j] = w++;
            i++;
            j++;
        }
    }
    return G;
}

int **eighthMatrix(size_t n) { // h)
    int **H = initializeMatrix(n);
    int w = 1;
    //  k - starting row index, m - ending row index;
    //	l - starting column index, n - ending column index;
    // In outr case we have square matrix and m=n so let:
    int m = (int) n;
    int k = 0, l = 0;
    while (k < m && l < (int) n) {    // Print the first row from the remaining rows
        for (int i = l; i < (int) n; ++i)
            H[k][i] = w++;
        k++;
        // Print the last column from the remaining columns
        for (int i = k; i < m; ++i)
            H[i][n - 1] = w++;
        n--;
        // Print the last row from the remaining rows
        if (k < m) {
            for (int i = (int) n - 1; i >= l; --i)
                H[m - 1][i] = w++;
            m--;
        }
        // Print the first column from the remaining columns
        if (l < (int) n) {
            for (int i = m - 1; i >= k; --i)
                H[i][l] = w++;
            l++;
        }
    }
    return H;
}

void releaseMatrix(int **A, size_t rows) {
    for (size_t i = 0; i < rows; i++) {
        delete[] A[i];
    }
    delete[] A;
}

int main() {
    size_t n;
    std::cout << "Enter order of matrix: ";
    std::cin >> n;

    std::cout << std::endl;

    int **A = firstMatrix(n);
    printMatrix1(A, n, n);
    releaseMatrix(A, n);

    int **B = secondMatrix(n);
    printMatrix2(B, n, n);
    releaseMatrix(B, n);

    int **C = thirdMatrix(n);
    printMatrix2(C, n, n);
    releaseMatrix(C, n);

    int **D = forthMatrix(n);
    printMatrix3(D, n, n);
    releaseMatrix(D, n);

    int **E = fifthMatrix(n);
    printMatrix2(E, n, n);
    releaseMatrix(E, n);

    int **F = sixthMatrix(n);
    printMatrix2(F, n, n);
    releaseMatrix(F, n);

    int **G = seventhMatrix(n);
    printMatrix2(G, n, n);
    releaseMatrix(G, n);

    int **H = eighthMatrix(n);
    printMatrix2(H, n, n);
    releaseMatrix(H, n);

    return 0;
}
