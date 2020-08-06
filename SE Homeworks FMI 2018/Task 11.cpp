#define _CRTDBG_MAP_ALLOC   // required

#include <stdlib.h>         // to enable MSVC++
#include <crtdbg.h>         // memory leak detection

#include <string>
#include <cmath>
#include <iostream>

/* 1. Function that simplifies the matrix. Applying Carl Friedrich Gauss's method
and returning an array, which shows us the columns on which we have been working on*/
size_t *simMatr(double **A, size_t m) {
    static size_t indexes[4];// creating an array filled with zeroes, which we will return
    for (size_t i = 0; i < 4; i++) indexes[i] = 0;
    // there are two cases, both of which are analogical
    if (m < 4) {
        for (size_t i = 0, k = 0; i < m && k < 4; i++, k++) {
            double max = 0;
            int index = i;
            do {//we find the abs maximum number in each non-zero column by checking only under the number taken
                max = abs(A[i][k]);
                index = i;
                for (size_t j = i; j < m; j++) {
                    if (abs(A[j][k]) > max) {
                        max = A[j][k];
                        index = j;
                    }
                }
                /*if the maximum number in this column is different from zero, then the number of
                    this coefficient in the array бецомес 1 in order to know that we have worked with it*/
                if (max != 0) indexes[k] = 1;
                else {
                    bool flag = true;
                    for (size_t h = 0; h < m; h++)
                        if (A[h][k] != 0)
                            flag = false;
                    if (flag) indexes[k] = 2;
                    /*if the maximum in this column is different from zero, then the coef
                    in the array becomes 2 and all zero to know that we have worked with it*/
                    ++k;
                }
            } while (max == 0);
            for (size_t g = i; g < 4; g++) {
                double tmp = A[index][g];
                A[index][g] = A[i][g];
                A[i][g] = tmp;
            }// we put this row that we found in the highest possible place
            for (size_t j = 0; j < m; j++) {
                if (j == i) continue; //we do nothing, because at least one row must be preserved
                if (A[j][k] == 0) continue; // nothing changes in this column
                double c = (-1) * (A[j][k] / A[i][k]); //Gauss's method
                for (size_t g = i; g < 4; g++) {
                    if (g == k) A[j][g] = 0;
                    else {
                        A[j][g] = A[j][g] + c * A[i][g];
                        if (A[j][g] <= 0.0001 && A[j][g] >= -0.0001)A[j][g] = 0;
                        // since double provides approximations, this verification is needed
                    }
                }
            }
        }
    }
    // analogous logic of the upper case
    if (m >= 4) {
        for (size_t i = 0, k = 0; i < 4 && k < 4; i++, k++) {
            double max = 0;
            int index = i;
            do {
                max = abs(A[i][k]);
                index = i;
                for (size_t j = i; j < m; j++) {
                    if (abs(A[j][k]) > max) {
                        max = A[j][k];
                        index = j;
                    }
                }
                if (max != 0) indexes[k] = 1;
                else {
                    bool flag = true;
                    for (size_t h = 0; h < m; h++) if (A[h][k] != 0) flag = false;
                    if (flag) indexes[k] = 2;
                    ++k;
                }
            } while (max == 0);

            for (int g = i; g < 4; g++) {
                double tmp = A[index][g];
                A[index][g] = A[i][g];
                A[i][g] = tmp;
            }
            for (size_t j = 0; j < m; j++) {
                if (j == i) continue;
                if (A[j][k] == 0) continue;
                double c = (-1) * (A[j][k] / A[i][k]);
                for (int g = i; g < 4; g++) {
                    if (g == k) A[j][g] = 0;
                    else {
                        A[j][g] = A[j][g] + c * A[i][g];
                        if (A[j][g] <= 0.0001 && A[j][g] >= -0.0001) A[j][g] = 0;
                    }
                }
            }
        }
    }
    return indexes;
}

// 2. Function for finding a fundamental system of solutions
double **FSS(double **A, size_t m, size_t &t) {// t is a tracker and keeps the number of rows we have not worked on
    size_t *indexes = simMatr(A, m);
    size_t count = 0;
    // checking which rows we have not used
    for (size_t i = 0; i < 4; i++) if (indexes[i] != 1) count++;
    // creating arrays in which we will keep track of which rows we have used and which do not
    size_t *notUsed = new size_t[count];
    size_t k = 4 - count;
    size_t *used = new size_t[k];
    size_t count1 = 0, count2 = 0;
    for (size_t i = 0; i < 4; i++) {
        if (indexes[i] != 1) {
            notUsed[count1] = i;
            count1++;
        } else {
            used[count2] = i;
            count2++;
        }
    }
    if (count == 0) {// if all are used then the only solution is null
        std::cout << "Only null solution for the system.";

        delete[] notUsed;
        delete[] used;

        return 0;
    } else {
        //delete[] indexes;
        double **FSSnew = nullptr;
        FSSnew = new double *[count];
        for (size_t i = 0; i < count; i++) {
            FSSnew[i] = new double[4];
            for (size_t j = 0; j < 4; j++) {
                FSSnew[i][j] = 0;
            }
        }
        int tr = 0;
        /* we use an algorithm for finding fundamental system of solutions, giving free
        values ​​1, and 0 to all others*/
        for (size_t i = 0; i < count1; i++) {
            size_t in = notUsed[i];
            FSSnew[tr][in] = 1;
            for (size_t j = 0; j < count2; j++) {
                int in2 = used[j];
                if (A[j][in] != 0) FSSnew[tr][in2] = -A[j][in] / A[j][in2];
            }
            tr++;
        }
        t = count;

        delete[] notUsed;
        delete[] used;

        return FSSnew;
    }// returning a matrix with every row a vector of FS (fundamental solution)
}

double **func(double **A, double **B, int n, size_t &m) // the function wanted from the condition
{
    size_t tr = 0; // it will show the number of rows in FSS (fundamental system of solutions)
    double **new_B = FSS(B, m, tr); // finding FSS
    double **sol;
    size_t br = tr + n;
    sol = new double *[br]; // making а common matrix between the given vectors and the FSS
    for (size_t i = 0; i < br; i++) {
        sol[i] = new double[4];
        for (size_t j = 0; j < 4; j++) {
            if (i < tr) sol[i][j] = new_B[i][j];
            else sol[i][j] = A[i - tr][j];
        }
    }
    for (size_t i = 0; i < tr; i++)
        delete[] new_B[i];
    delete[] new_B;
    // creating new matrix whose non-zero rows are the basis of U + W, using Gauss's method
    simMatr(sol, br);
    m = br;// keeping track of how many these rows are in our new matrix
    return sol;
}

void test() {
    // we create the matrices locally
    double A[4][4] =
            {
                    {2,  8,  -3, 14},
                    {-1, 2,  3,  5},
                    {-1, 14, 6,  29},
                    {0,  12, 3,  24},
            };
    double **newA;
    newA = new double *[4];
    for (size_t i = 0; i < 4; i++) {
        newA[i] = new double[4];
        for (size_t j = 0; j < 4; j++) newA[i][j] = A[i][j];
    }
    double B[2][4] =
            {
                    {0,  1, 1, 0},
                    {10, 7, 0, -8}
            };
    double **newB;
    newB = new double *[2];
    for (size_t i = 0; i < 2; i++) {
        newB[i] = new double[4];
        for (size_t j = 0; j < 4; j++) newB[i][j] = B[i][j];
    }
    size_t m(2), n(4);
    double **solution = func(newA, newB, n, m);
    std::cout << "The basis of W + U is: " << std::endl;
    // printing only the non-zero rows
    for (size_t i = 0; i < m; i++) {
        bool isPrint = false;
        for (int j = 0; j < 4; j++) if (solution[i][j] != 0) isPrint = true;
        if (isPrint) {
            std::cout << "( ";
            for (size_t j = 0; j < 4; j++) {
                std::cout << solution[i][j];
                if (j != 3) std::cout << ", ";
            }
            std::cout << ")" << std::endl;;
        }
    }
    for (size_t i = 0; i < m; i++) delete[] solution[i];
    delete[] solution;
    for (size_t i = 0; i < m - n; i++) delete[] newB[i];
    delete[] newB;
    for (size_t i = 0; i < n; i++) delete[] newA[i];
    delete[] newA;
}

int main() {
    test();
    _CrtDumpMemoryLeaks();
    return 0;
}
