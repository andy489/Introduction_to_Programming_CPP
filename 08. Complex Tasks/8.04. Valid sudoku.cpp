// github.com/andy489

#include <iostream>

size_t rowLen(char arr[][9], int row) {
    size_t len = 0;
    for (size_t i = 0; i < 9; i++) {
        if (arr[row][i] != '-' && arr[row][i] >= '0' && arr[row][i] <= '9') {
            len++;
        }
    }
    return len;
}

size_t colLen(char arr[][9], int col) {
    size_t len = 0;
    for (size_t i = 0; i < 9; i++) {
        if (arr[i][col] != '-' && arr[i][col] >= '0' && arr[i][col] <= '9') {
            len++;
        }
    }
    return len;
}

size_t boxLen(char arr[][9], int startRow, int startCol) {
    size_t len = 0;
    for (int i = startRow; i < startRow + 3; i++) {
        for (int j = startCol; j < startCol + 3; j++) {
            if (arr[i][j] != '-' && arr[i][j] >= '0' && arr[i][j] <= '9') {
                len++;
            }
        }
    }
    return len;
}

bool checkRow(char arr[][9], int row) {
    bool rowFlag = true;
    size_t len = rowLen(arr, row);
    char *set = new char[len];
    size_t j = 0;
    for (int i = 0; i < 9; i++) {    // If it is not an empty cell, insert value at the current cell in the set 
        if (arr[row][i] != '-') {
            if (arr[row][i] >= '0' && arr[row][i] <= '9') {
                set[j] = arr[row][i];
                j++;
            } else {
                rowFlag = false;
                break;
            }
        }
    }
    if (rowFlag == true) {
        for (size_t k = 0; k < len; k++) {   // Checks whether there is any duplicate in current row or not 
            char curr = set[k];
            for (size_t l = k + 1; l < len; l++) {
                if (curr == set[l]) {
                    rowFlag = false;
                    break;
                }
            }
        }
    }
    delete[] set;
    return rowFlag;
}

bool checkCol(char arr[][9], int col) {
    bool colFlag = true;
    size_t len = colLen(arr, col);
    char *set = new char[len];
    size_t j = 0;
    for (int i = 0; i < 9; i++) {    // If it is not an empty cell, insert value at the current cell in the set 
        if (arr[i][col] != '-') {
            if (arr[i][col] >= '0' && arr[i][col] <= '9') {
                set[j] = arr[i][col];
                j++;
            } else {
                colFlag = false;
                break;
            }
        }
    }
    if (colFlag == true) {
        for (size_t k = 0; k < len; k++) {    // Checks whether there is any duplicate in current col or not 
            char curr = set[k];
            for (size_t l = k + 1; l < len; l++) {
                if (curr == set[l]) {
                    colFlag = false;
                    break;
                }
            }
        }
    }
    delete[] set;
    return colFlag;
}

bool checkBox(char arr[][9], int startRow, int startCol) {
    bool boxFlag = true;
    size_t len = boxLen(arr, startRow, startCol);
    char *set = new char[len];
    size_t j = 0;
    for (int row = startRow; row < startRow + 3; row++) {
        for (int col = startCol; col < startCol + 3; col++) {
            if (arr[row][col] != '-') {
                if (arr[row][col] >= '0' && arr[row][col] <= '9') {
                    set[j] = arr[row][col];
                    j++;
                } else {
                    boxFlag = false;
                    goto FLAG1;
                }
            }
        }
    }
    FLAG1:
    if (boxFlag == true) {
        for (size_t k = 0; k < len; k++) {    // Checks whether there is any duplicate in current col or not 
            char curr = set[k];
            for (size_t l = k + 1; l < len; l++) {
                if (curr == set[l]) {
                    boxFlag = false;
                    goto FLAG2;
                }
            }
        }
    }
    FLAG2:
    delete[] set;
    return boxFlag;
}

bool isValid(char arr[][9], int row,
             int col) {   // Checks whether current row and current column and current 3x3 box is valid or not 
    return checkRow(arr, row) && checkCol(arr, col) && checkBox(arr, row - row % 3, col - col % 3);
}

bool isValidSudoku(char arr[][9]) {
    for (int i = 0; i < 9; i++) {
        for (int j = 0;
             j < 9; j++) {    // If current row or current column or current 3x3 box is not valid, return false 
            if (!isValid(arr, i, j)) return false;
        }
    }
    return true;
}

int main() {
    char board[9][9] = {{'5', '3', '-', '-', '7', '-', '-', '-', '-'},
                        {'6', '-', '-', '1', '9', '5', '-', '-', '-'},
                        {'-', '9', '8', '-', '-', '-', '-', '6', '-'},
                        {'8', '-', '-', '-', '6', '-', '-', '-', '3'},
                        {'4', '-', '-', '8', '-', '3', '-', '-', '1'},
                        {'7', '-', '-', '-', '2', '-', '-', '-', '6'},
                        {'-', '6', '-', '-', '-', '-', '2', '8', '-'},
                        {'-', '-', '-', '4', '1', '9', '-', '-', '5'},
                        {'-', '-', '-', '-', '8', '-', '-', '7', '9'}};
    isValidSudoku(board) ? std::cout << "True" : std::cout << "False";
    return 0;
}
