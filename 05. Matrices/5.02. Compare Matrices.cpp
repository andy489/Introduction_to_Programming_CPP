// github.com/andy489

#include <iostream>
#include <vector>
#include <sstream>

std::vector<std::vector<int>> inputMatrix(size_t R) {
    std::vector<std::vector<int>> matrix(R);
    for (size_t i = 0; i < R; i++) {
        std::string line;
        getline(std::cin, line);
        std::istringstream istr(line);
        while (istr) {
            int element;
            istr >> element;
            matrix[i].push_back(element);
        }
    }
    return matrix;
}

bool cmpMat(const std::vector<std::vector<int>> &firstMat, size_t R1,
            const std::vector<std::vector<int>> &secMat, size_t R2) {
    if (R1 != R2) return false;
    else {
        for (size_t i = 0; i < R1; i++) {
            size_t C1 = firstMat[i].size();
            size_t C2 = secMat[i].size();
            if (C1 != C2) return false;
            for (size_t j = 0; j < C1; j++) {
                if (firstMat[i][j] != secMat[i][j])
                    return false;
            }
        }
    }
    return true;
}

int main() {
    size_t R1;
    std::cin >> R1;
    std::cin.ignore();
    std::vector<std::vector<int>> firstMat = inputMatrix(R1);
    size_t R2;
    std::cin >> R2;
    std::cin.ignore();
    std::vector<std::vector<int>> secMat = inputMatrix(R2);

    cmpMat(firstMat, R1, secMat, R2) ? std::cout << "equal\n" : std::cout << "not equal\n";

    return 0;
}
