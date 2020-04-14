// github.com/andy489

#include <iostream>

int getRow(size_t n) { // just count the rows, and when you meet the number, return the row
    int row(0), k(1);
    for (row = 1; row <= n; ++row) {
        int j;
        for (j = 1; j <= row; ++j) {
            if (k == n) {
                return row;
            }
            k++;
        }
    }
}

int getCol(int n) { /* having already found the row and knowing that every n-th row starts
with n(n-1)/2+1 and ends with n(n+1)/2, just count the columns and when you
meet the number (and that surely will happen), just return the column and you're done */
    int col(1);
    int r = getRow(n);
    int j, start = r * (r - 1) / 2 + 1, end = r * (r + 1) / 2;
    for (j = start; j <= end; ++j) {
        if (j == n)
            break;
        col++;
    }
    return col;
}

int main() {
    int n;
    std::cin >> n;
    std::cout << "Number " << n << " lies in row " << getRow(n) << ", column " << getCol(n)
              << " of the Floyd's triangle.\n";
    return 0;
}
