#define N 4

#include <iostream>

bool reachable(int A[N][N], int n, int x, int y, int target) {
    if (x < 0 || y < 0 || x >= n || y >= n) return false;
    if (A[x][y] == target) return true;

    if (y + 1 < n && A[x][y] <= A[x][y + 1]) // ако е възможен преход надясно
        if (reachable(A, n, x, y + 1, target))
            return true;
    if (x + 1 < n && A[x][y] <= A[x + 1][y]) // ако е възможен преход надолу
        if (reachable(A, n, x + 1, y, target))
            return true;
    return false; // не съществува възможен преход
}

int main() {
    int A[N][N] = {{1,  2,  4,  3},
                   {10, 15, 6,  8},
                   {50, 20, 50, 50},
                   {40, 0,  40, 60}};
    std::cout << reachable(A, N, 0, 0, 8);
    return 0;
}
