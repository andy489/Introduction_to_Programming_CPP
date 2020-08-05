// github.com/andy489

#define N 5

#include <iostream>

double maximinj(double A[][N], const size_t n) {   // a)
    double minj[N];
    size_t c(0);
    double curr = A[0][c];
    for (size_t j = 0; j < n; j++) {
        for (size_t i = 0; i < n; i++) if (A[i][j] < curr) curr = A[i][j];
        minj[c] = curr;
        c++;
        curr = A[0][c];
    }
    double maximinj = minj[0];
    for (size_t i = 0; i < N; i++) if (minj[i] > maximinj) maximinj = minj[i];
    return maximinj;
}

double maxjmini(double A[][N], const size_t n) {   // b)
    double mini[N];
    size_t c(0);
    double curr = A[c][0];
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) if (A[i][j] < curr) curr = A[i][j];
        mini[c] = curr;
        c++;
        curr = A[c][0];
    }
    double maxjmini = mini[0];
    for (size_t i = 0; i < N; i++) if (mini[i] > maxjmini) maxjmini = mini[i];
    return maxjmini;
}

double minimaxj(double A[][N], const size_t n) {   // c)
    double maxj[N];
    size_t c(0);
    double curr = A[0][c];
    for (size_t j = 0; j < n; j++) {
        for (size_t i = 0; i < n; i++) if (A[i][j] > curr) curr = A[i][j];
        maxj[c] = curr;
        c++;
        curr = A[0][c];
    }
    double minimaxj = maxj[0];
    for (size_t i = 0; i < N; i++) if (maxj[i] < minimaxj) minimaxj = maxj[i];
    return minimaxj;
}

double minjmaxi(double A[][N], const size_t n) {   // d)
    double maxi[N];
    size_t c(0);
    double curr = A[c][0];
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) if (A[i][j] > curr) curr = A[i][j];
        maxi[c] = curr;
        c++;
        curr = A[c][0];
    }
    double minjmaxi = maxi[0];
    for (size_t i = 0; i < N; i++) if (maxi[i] < minjmaxi) minjmaxi = maxi[i];
    return minjmaxi;
}

int main() {
    double A[][5] = {3, 12, 9, 8, -3,
                     17, 6, -5, -10, 18,
                     22, 31, 9, 0, -6,
                     7, 14, -41, 9, 0,
                     2.5, 9, 99, 16, 54};
    std::cout << "max(i)min(j): " << maximinj(A, N) << std::endl;
    std::cout << "max(j)min(i): " << maxjmini(A, N) << std::endl;
    std::cout << "min(i)max(j): " << minimaxj(A, N) << std::endl;
    std::cout << "min(j)max(i): " << minjmaxi(A, N) << std::endl;
    return 0;
}
