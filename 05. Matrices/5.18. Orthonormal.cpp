// github.com/andy489

#define N 3

#include <iostream>
#include <cmath>

using namespace std;

const double scalarProd(double arr1[], double arr2[], size_t n) {
    double result = 0;
    for (size_t i = 0; i < n; i++) result += arr1[i] * arr2[i];
    if (result - 1 > -0.00001 && result - 1 < 0.00001) result = 1;
    return result;
}

const bool isOrtonormal(double A[][N], size_t n) {
    for (size_t i = 0; i < n; i++) {
        double *currPtr = A[i];
        for (size_t j = i; j < n; j++) // from j=i, because multiplication is commutative
        {
            if (i != j) {
                if (scalarProd(A[i], A[j], n) != 0) return false;
            } else {
                if (scalarProd(A[i], A[j], n) != 1) return false;
            }
        }
    }
    return true;
}

int main() {
    double A[][N] = {1 / sqrt(2), 0.0, -1 / sqrt(2),
                     2.0 / 3, 1.0 / 3, 2.0 / 3,
                     1 / (3 * sqrt(2)), -4 / (3 * sqrt(2)), 1 / (3 * sqrt(2))};

    isOrtonormal(A, N) ? std::cout << "Ortonormal" : std::cout << "Not ortonormal";
    return 0;
}
