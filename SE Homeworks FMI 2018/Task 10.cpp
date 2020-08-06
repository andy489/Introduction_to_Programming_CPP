#include<iostream>

/* we will divide the code into а number of functions for clarity
1. Function for multiplying matrices 3x3*/
double **multiplyMatr(double **A, double **B) {
    double **prod; // the ptoduct matrix
    prod = new double *[3];
    for (size_t i = 0; i < 3; i++) {
        prod[i] = new double[3];
        for (size_t j = 0; j < 3; j++) prod[i][j] = 0;
    }
    // Multiplying rows by columns by the rule
    for (size_t i = 0; i < 3; i++)
        for (size_t j = 0; j < 3; j++)
            for (size_t k = 0; k < 3; k++)
                prod[i][j] += A[i][k] * B[k][j];
    return prod;
}

/* 2. Function for transposing a matrix (changing the elements
symmetrically to the main diagonal (rows becomes columns))*/
double **transposition(double **A) {
    double **result; // the transposed matrix
    result = new double *[3];
    for (size_t i = 0; i < 3; i++) {
        result[i] = new double[3];
        for (size_t j = 0; j < 3; j++) result[i][j] = A[j][i];
    }
    return result;
}

// 3. Function for finding the unique inverse matrix
double **inverseMatr(double **A) {
    double **result;
    result = new double *[3];
    for (size_t i = 0; i < 3; i++) {
        result[i] = new double[3];
        for (size_t j = 0; j < 3; j++) result[i][j] = 0;
    }
    // Finding the determinant using the Sarrus rule
    double det = A[0][0] * A[1][1] * A[2][2] + A[1][0] * A[2][1] * A[0][2] + A[0][1] * A[1][2] * A[2][0]
                 - (A[2][0] * A[1][1] * A[0][2] + A[2][1] * A[1][2] * A[0][0] + A[1][0] * A[0][1] * A[2][2]);
    // Creating the unique inverse matrix using adjugate operations
    if (det == 0) {
        std::cout << "There is no inverse matrix.";
        return 0;
    } else {// The inverse matrix exists only if the determinant is not equal to zero
        for (size_t i = 0; i < 3; i++)
            for (int j = 0; j < 3; j++)
                result[i][j] = ((A[(j + 1) % 3][(i + 1) % 3] * A[(j + 2) % 3][(i + 2) % 3]) -
                                (A[(j + 1) % 3][(i + 2) % 3] * A[(j + 2) % 3][(i + 1) % 3])) / det;
    }
    return result;
}

// 4. Function for solving the matrix equation
double **solvingEquation(double **A, double **C) {
    double **sol; // solution matrix
    sol = new double *[3];
    for (size_t i = 0; i < 3; i++) {
        sol[i] = new double[3];
        for (size_t j = 0; j < 3; j++) sol[i][j] = 0;
    }
    // transposing matrix A
    double **A_tr = transposition(A);
    // multiplying by -3
    for (size_t i = 0; i < 3; i++)
        for (size_t j = 0; j < 3; j++) A_tr[i][j] = A_tr[i][j] * (-3);
    // adding 5 to elements from the main diagonal (rule of adding a number to a matrix 3x3)
    for (size_t i = 0; i < 3; i++)
        A[i][i] += 5;
    // finding inverse matrix
    double **A_inv = inverseMatr(A);
    // intermediate calculation
    double **intermCalc = multiplyMatr(A_tr, C);
    sol = multiplyMatr(intermCalc, A_inv);
    return sol;
}

// 5. Function for deleting a dynamically created matrix
void deleteMatr(double **M, size_t rows, size_t cols) {
    for (size_t i = 0; i < rows; i++) delete[] M[i];
    delete[] M;
}

int main() {
    {// we create a local matrix 3x3	
        double A[3][3] =
                {
                        {-4, 1,  1},
                        {1,  -3, 2},
                        {1,  2,  -4}
                };
        double **newA;
        newA = new double *[3];
        for (size_t i = 0; i < 3; i++) {
            newA[i] = new double[3];
            for (int j = 0; j < 3; j++) newA[i][j] = A[i][j];
        }
        double C[3][3] =
                {
                        {-1, -2, -2},
                        {-1, -3, -4},
                        {-1, -3, -5}
                };
        double **newC;
        newC = new double *[3];
        for (size_t i = 0; i < 3; i++) {
            newC[i] = new double[3];
            for (size_t j = 0; j < 3; j++) newC[i][j] = C[i][j];
        }
        // Solving the equation
        double **sol = solvingEquation(newA, newC);
        for (size_t i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++)
                std::cout << sol[i][j] << " ";
            std::cout << std::endl;
        }
        deleteMatr(newA, 3, 3);
        deleteMatr(newC, 3, 3);
        deleteMatr(sol, 3, 3);
    }
    return 0;
}
