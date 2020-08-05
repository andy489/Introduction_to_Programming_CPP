// github.com/andy489

#include <iostream>

bool isSubset(int *set1, int *set2, const size_t rows) {
    for (size_t i = 0; i < rows; i++) {
        double curr = set2[i];
        for (size_t j = 0; j < rows; j++) {
            if (curr == set1[j]) break;
            if (j == rows - 1) return false;
        }
    }
    return true;
}

int main() {
    const size_t rows = 5;
    const size_t cols = 6;
    int matrix[][cols] = {1, 2, 3, 3, 5, 1,
                          2, 3, 4, 2, 6, 1,
                          2, 5, 5, 1, 2, 3,
                          2, 3, 5, 1, 3, 1,
                          3, 4, 2, 1, 8, 2};
    for (size_t i = 0; i < cols; i++) {
        std::cout << "alike column numbers to column " << i + 1 << " are: ";
        int currSet[rows];
        for (size_t j = 0; j < rows; j++) currSet[j] = matrix[j][i]; //fill the current column to an array
        bool count(0);
        for (size_t k = 0; k < cols; k++) {
            int setToCheck[rows];
            for (size_t l = 0; l < rows; l++) setToCheck[l] = matrix[l][k]; // fill the column to an array to compare			
            if (i != k && isSubset(currSet, setToCheck, rows) && isSubset(setToCheck, currSet, rows)) {
                std::cout << k + 1 << ' ';
                count = true;
            }
        }
        if (!count) std::cout << "this column is unique!";
        count = 0;
        std::cout << std::endl;
    }
    return 0;
}
