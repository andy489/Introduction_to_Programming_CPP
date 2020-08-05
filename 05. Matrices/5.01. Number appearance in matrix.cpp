// github.com/andy489

#include <iostream>
#include <vector>

int main() {
    size_t R, C;
    std::cin >> R >> C;
    std::vector<std::vector<int>> matrix(R);
    for (size_t i = 0; i < R; i++)
        matrix[i] = std::vector<int>(C);

    for (size_t i = 0; i < R; i++)
        for (size_t j = 0; j < C; j++)
            std::cin >> matrix[i][j];

    int searchedNum;
    std::cin >> searchedNum;
    bool flag = false;
    for (size_t i = 0; i < R; i++) {
        for (size_t j = 0; j < C; j++) {
            if (matrix[i][j] == searchedNum) {
                flag = true;
                std::cout << i << ' ' << j << '\n';
            }
        }
    }
    if (!flag)
        std::cout << "not found\n";
    return 0;
}
