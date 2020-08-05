// github.com/andy489

#include <iostream>

size_t *checkNums(long num1, long num2, size_t &commonDigitsLength) {
    size_t *commonDigits = new size_t[10];
    size_t currentIndex = 0;

    for (long currentNum1 = num1; currentNum1 != 0; currentNum1 /= 10) {
        size_t digit1 = currentNum1 % 10;

        bool isDigitAlreadyAdded = false;
        for (size_t i = 0; i < currentIndex; i++) {
            if (commonDigits[i] == digit1) {
                isDigitAlreadyAdded = true;
                break;
            }
        }
        if (isDigitAlreadyAdded) continue;
        for (long currentNum2 = num2; currentNum2 != 0; currentNum2 /= 10) {
            long digit2 = currentNum2 % 10;
            if (digit1 == digit2) {
                commonDigits[currentIndex] = digit1;
                currentIndex++;
                break;
            }
        }
    }
    commonDigitsLength = currentIndex;
    return commonDigits;
}

int main() {
    size_t len;
    size_t *arr = checkNums(12345690, 3456780, len);
    for (size_t i = 0; i < len; i++)
        std::cout << arr[len - i - 1] << ' ';
    delete[] arr;
    return 0;
}
