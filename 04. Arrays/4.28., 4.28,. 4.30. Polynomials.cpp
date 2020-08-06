// github.com/andy489
//Task 4.28 & 4.29 & 4.30

#include <iostream>

double *definePoly(char &symbol, char &coef, int &k) {
    std::cout << "deg(" << symbol << "(x)) = ";
    std::cin >> k;
    symbol++;
    double *a = new double[k + 1];
    for (int i = k; i >= 0; i--) {
        std::cout << coef << "_{" << i << "} = ";
        std::cin >> a[i];
    }
    coef++;
    return a;
}

void printPoly(int n, double *P, char &symbol) {
    symbol--;
    std::cout << symbol << "(x)=";
    for (int i = n; i >= 0; i--) {
        if (P[i] != 0) {
            if (P[i] > 0) {
                std::cout << '+';
            }
            std::cout.setf(std::ios::fixed);
            std::cout.precision(2);
            std::cout << P[i] << ".x^{" << i << "}";
        }
    }
    std::cout << "\n";
    symbol++;
}

double *sumPoly(double *a, int n, double *b, int m, char &symbol) {    // Task 4.27
    symbol++;
    double *c = new double[(n + m + abs(n - m)) / 2 + 1];
    if (n > m) {
        for (int i = 0; i <= m; i++) c[i] = a[i] + b[i];
        for (int i = m + 1; i <= n; i++) c[i] = a[i];
    } else if (n < m) {
        for (int i = 0; i <= n; i++) c[i] = a[i] + b[i];
        for (int i = n + 1; i <= m; i++) c[i] = b[i];
    } else for (int i = 0; i <= n; i++)c[i] = a[i] + b[i];
    return c;
}

double *prodPoly(double *a, int n, double *b, int m, char &symbol) {    // Task 4.28
    symbol++;
    double *d = new double[n + m + 1];
    for (int p = 0; p <= n + m; p++) {
        d[p] = 0;
        for (int i = 0; i <= n; i++)
            for (int j = 0; j <= m; j++)
                if (i + j == p) d[p] = d[p] + a[i] * b[j];
    }
    return d;
}

double *powPoly(double *a, int n, int m, char &symbol) {    // Task 4.29
    symbol++;
    if (m == 0) {
        double *powPoly = new double[1];
        powPoly[0] = 1;
        return powPoly;
    } else if (m == 1) {
        double *powPoly = new double[n + 1];
        for (int i = 0; i < n + 1; i++) {
            powPoly[i] = a[i];
        }
        return powPoly;
    } else {
        double *tempPoly = new double[m * n + 1];
        for (int i = m * n; i > 0; i--) {
            tempPoly[i] = 0;
        }
        tempPoly[0] = 1;

        double *powPoly = nullptr;

        for (int i = 0; i < m; i++) {
            powPoly = prodPoly(tempPoly, m * n + 1, a, n, symbol);
            delete[] tempPoly;
            tempPoly = powPoly;
        }
        return powPoly;
    }
}

int main() {
    int n;
    int m;
    char symbol('P'), coef('a');

    double *firstPoly = definePoly(symbol, coef, n);
    printPoly(n, firstPoly, symbol);

    double *secondPoly = definePoly(symbol, coef, m);
    printPoly(m, secondPoly, symbol);

    double *sum = sumPoly(firstPoly, n, secondPoly, m, symbol);
    std::cout << "Sum:\n";
    printPoly((n + m + abs(n - m)) / 2, sum, symbol);

    double *prod = prodPoly(firstPoly, n, secondPoly, m, symbol);
    std::cout << "Product:\n";
    printPoly(n + m, prod, symbol);

    size_t k;
    std::cout << "Enter power:\n";
    std::cin >> k;

    double *pow = powPoly(firstPoly, n, k, symbol);
    std::cout << "Power:\n";
    printPoly(n * k, pow, symbol);

    delete[] firstPoly;
    delete[] secondPoly;
    delete[] sum;
    delete[] prod;
    delete[] pow;

    return 0;
}
