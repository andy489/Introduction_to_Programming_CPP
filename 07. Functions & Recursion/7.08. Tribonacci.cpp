// github.com/andy489

#include <iostream>
#include <cmath>

int tribonacci1(int n) {   // first way - using recursion
    if (n == 0)return 0;
    if (n == 1 || n == 2) return 1;
    else return tribonacci1(n - 1) + tribonacci1(n - 2) + tribonacci1(n - 3);
}

int tribonacci2(int n) {   // second way - solving the characteristics polynomial of the sequence
    double var1 = 1 / 3.0 * pow(19 + 3 * sqrt(33), 1 / 3.0);
    double var2 = 1 / 3.0 * pow(19 - 3 * sqrt(33), 1 / 3.0);
    double var3 = pow(586 + 102 * sqrt(33), 1 / 3.0);
    double var4 = pow(586 + 102 * sqrt(33), 2 / 3.0);
    double var5 = pow(586 + 102 * sqrt(33), 1 / 3.0);
    return (int) ((3 * pow(var1 + var2 + 1 / 3.0, n) * (var3)) / (var4 + 4 - 2 * var5) + 0.5);
}

int tribonacci3(int n) {   // third way - cycling
    size_t tri0(0), tri1(1), tri2(1), tri3;
    if (n == 0) return tri0;
    if (n == 1) return tri1;
    if (n == 2) return tri2;
    for (int i = 3; i <= n; i++) {
        tri3 = tri2 + tri1 + tri0;
        tri0 = tri1;
        tri1 = tri2;
        tri2 = tri3;
    }
    return tri2;
}

int main() {
    int n;
    std::cin >> n;
    for (int i = 0; i < n; i++) std::cout << tribonacci1(i) << ' ';
    std::cout << std::endl;
    for (int i = 0; i < n; i++) std::cout << tribonacci2(i) << ' ';
    std::cout << std::endl;
    for (int i = 0; i < n; i++) std::cout << tribonacci3(i) << ' ';
    return 0;
}
