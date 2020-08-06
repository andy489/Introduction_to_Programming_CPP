#include <iostream>

#define N 10

void printPath(unsigned *path, unsigned c) {
    if (c != 0) std::cout << " - ";
    for (size_t i = 0; i < c; i++) {
        std::cout << path[i];
        if (i != c - 1) std::cout << " - ";
    }
    std::cout << "\n\n";
}

void printNeighborhoodМatrix(size_t neighborhoodМatrix[N][N], unsigned n) {
    for (size_t i = 0; i < n; i++) {
        for (size_t j = 0; j < n; j++) std::cout << neighborhoodМatrix[i][j] << ' ';
        std::cout << std::endl;
    }
}

unsigned path[100];
unsigned c(0);

bool way(size_t i, size_t j, size_t A[N][N]) {
    int k = -1;
    bool b = false;
    if (i == j)return true;
    if (A[i][j] == 1 || A[j][i] == 1) {
        path[c] = j;
        c++;
        return true;
    }
    if (i < 0 || i >= N || j < 0 || j >= N) return false;
    else {
        do {
            k++;
            if (A[i][k] == 1) { // от град i до град k има пряк път
                path[c] = k;
                c++;
                // унищожаване пътя между градове i и k
                A[i][k] = 0;
                A[k][i] = 0;
                //проверка има ли път от град k до град j
                b = way(k, j, A);
                // възстановяваме пътя между градове i и k 
                A[i][k] = 1;
                A[k][i] = 1;
            }
        } while (!b && k != N - 1);
        return b;
    }
}

int main() {
    size_t A[N][N];
    memset(A, 0, sizeof(A));
    /* сетваме всички клетки да са 0 в матрицата на съседства
  очевидно, ако град i е свързан с град j, то и град j ще е свързан с град i,
    за това ако A[i][j]=1, то и A[j][i]=1 */

    // поставяме пътища на произволни места в матрицата на съседства */
    A[3][2] = 1;
    A[3][5] = 1;
    A[1][7] = 1;
    A[5][6] = 1;
    A[6][7] = 1;
    A[9][1] = 1;

    // финализираме матрицата на съседства 
    for (size_t i = 0; i < N; i++)
        for (size_t j = 0; j < N; j++) {
            if (A[i][j] == 1) A[j][i] = 1;
            if (i == j) A[j][i] = 0;
        }
    printNeighborhoodМatrix(A, N);
    // принтираме матрицата на съседства, за да видим къде сме сетнали да има пътища 

    size_t i(0), j(0);
    do {
        std::cout << "Cities between we searche for a road:\ni = ";
        std::cin >> i;
        std::cout << "j = ";
        std::cin >> j;
        if (way(i, j, A)) {
            std::cout << "There exist a road between the cities " << i
                      << " and " << j << ".\n";
            std::cout << i;
            printPath(path, c);
        } else std::cout << "there is no road between these cities " << i << " and " << j << ".\n";
        c = 0;
    } while (i >= 0 && i < N && j >= 0 && j < N);
    return 0;
}
