// github.com/andy489

#include <iostream>

int **inputPairs(size_t n) {
    int **M = new int *[n];
    for (size_t i = 0; i < n; i++) 
        M[i] = new int[2];
    for (size_t i = 0; i < n; i++) 
        for (size_t j = 0; j < 2; j++) 
            std::cin >> M[i][j];
    return M;
}

bool isFunc(int **M, size_t n) {
    bool isFunc = true;

    for (size_t i = 0; i < n - 1; i++) {
        int currEl = M[i][0];
        for (size_t j = i + 1; j < n; j++) 
            if (currEl == M[j][0]) 
                if (M[i][1] != M[j][1]) 
                    isFunc = false;
    }
    return isFunc;
}

void releasePairs(int **M, size_t n) {
    for (size_t i = 0; i < n; i++)
        delete[] M[i];
    delete[] M;
}

int main() {
    size_t n;
    std::cout << "Enter number of ordered pairs (argument and value of function): ";
    std::cin >> n;

    int **M = inputPairs(n);

    isFunc(M, n) ? (std::cout << "The set is function") : (std::cout << "The set is not function");

    releasePairs(M, n);

    return 0;
}
