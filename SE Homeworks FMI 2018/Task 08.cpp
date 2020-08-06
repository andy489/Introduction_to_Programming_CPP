#include <iostream>

size_t arrLen(int *arr, size_t size) {
    size_t arrLen = 0;
    for (size_t i = 0; i < size; i++) {
        if (arr[i] != '\0') arrLen++;
        else break;
    }
    return arrLen;
}

bool sim(int matrix[][6], size_t row, size_t col) //checks if the matrix is simplified
{
    for (size_t i = 0; i < row; i++) {
        for (size_t j = 0; j < col; j++) {
            if (matrix[i][j] / 10 != 0 || matrix[i][j] < 0)
                return false;
        }
    }
    return true;
}

int *convertNumToArr(int M, size_t &lenNum)// converts number M to an array of digits
{
    int *numArr = new int[6];
    for (int i = 0; i < 6; i++) {
        numArr[i] = M % 10;
        M /= 10;
        if (M == 0) {
            lenNum = i + 1;
            break;
        }
    }
    for (size_t i = 0; i < lenNum / 2; i++) // reverses the array of digits
    {
        int temp = numArr[i];
        numArr[i] = numArr[lenNum - i - 1];
        numArr[lenNum - i - 1] = temp;
    }
    return numArr;
}

bool palindrome(int num)
/*checks if a natural number is palindrome, because	if it is - we will cicle through
the matrix only once from left to right and once from top to bottom */
{
    if (num < 0) return false;
    if (num / 10 == 0) return true;
    size_t n = num;
    short digit;
    size_t rev = 0;
    do {
        digit = num % 10;
        rev = (rev * 10) + digit;
        num = num / 10;
    } while (num != 0);
    if (n == rev)return true;
    else return false;
}

int countAppearances(int M, int matrix[][6]) {
    size_t lenNum;
    int *numArr = convertNumToArr(M, lenNum);
    size_t count = 0;
    for (size_t i = 0; i < 6; i++) {
        for (size_t j = 0; j < 6; j++) {
            if (matrix[i][j] == numArr[0]) {
                for (size_t k = 0; k <= lenNum - 1; k++)
                    /*only here we include k=0, when M is with one digit! Because when M is with one digit
                    we cycle the matrix	only by rows from left to right and only once*/
                {
                    if (matrix[i][j + k] == numArr[k] && j + k <= 5) //checks rows from left to right
                    {
                        if (k == lenNum - 1) count++;
                    } else break;
                }
                for (size_t k = 1; k <= lenNum - 1; k++) //k=1
                {
                    if (matrix[i][j - k] == numArr[k] && j - k >= 0 && !palindrome(M)) //checks rows from right to left
                    {
                        if (k == lenNum - 1) count++;
                    } else break;
                }
                for (size_t k = 1; k <= lenNum - 1; k++) //k=1
                {
                    if (matrix[i + k][j] == numArr[k] && i + k <= 5) //checks columns from top to bottom
                    {
                        if (k == lenNum - 1) count++;
                    } else break;
                }
                for (size_t k = 1; k <= lenNum - 1; k++) //k=1
                {
                    if (matrix[i - k][j] == numArr[k] && i - k >= 0 &&
                        !palindrome(M))//checks columns from bottom to top
                    {
                        if (k == lenNum - 1) count++;
                    } else break;
                }
            }
        }
    }
    delete[] numArr;
    return count;
}

bool validNum(int M) //checks if the number is with six digits ot less and positive
{
    return !(M / 1000000 != 0 || M < 0);
}

int main() {
    const int ROWS = 6;
    const int COLUMNS = 6;
    int matrix[ROWS][COLUMNS] =
            {5, 4, 3, 8, 0, 6,
             9, 4, 5, 1, 0, 2,
             8, 5, 8, 0, 6, 1,
             0, 9, 6, 8, 4, 2,
             6, 1, 0, 2, 6, 1,
             2, 1, 8, 4, 2, 6};
    std::cout << "Enter an integer number: ";
    int M;
    std::cin >> M;
    if (sim(matrix, ROWS, COLUMNS)) {
        if (!validNum(M)) std::cout << 0;
        else std::cout << countAppearances(M, matrix) << std::endl;
    } else std::cout << "The matrix is not simplified.";
    return 0;
}
