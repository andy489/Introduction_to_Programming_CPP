// github.com/andy489

#include <iostream>

int *numIntoArr(int num) {
    int *arr = new int[4];
    for (int i = 3; i >= 0; i--) {
        arr[i] = num % 10;
        num /= 10;
    }
    return arr;
}

int inputNum(int lowerBound, int upperBound) {
    int n;
    while (true) {
        std::cout << "Input a number in range [0..9999]: ";
        std::cin >> n;
        if (std::cin.fail()) {
            std::cin.clear();
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
        } else if ((n >= lowerBound) && (n <= upperBound)) break;
    }
    return n;
}

int main() {
    int guess = inputNum(0, 9999);
    int *guessArr = numIntoArr(guess);
    size_t b, c;
    std::cout << "bulls: ";
    std::cin >> b;
    std::cout << "cows: ";
    std::cin >> c;

    for (size_t i = 0; i <= 9; i++) {
        for (size_t j = 0; j <= 9; j++) {
            for (size_t k = 0; k <= 9; k++) {
                for (size_t l = 0; l <= 9; l++) {
                    size_t countB(0), countC(0);
                    if (i == guessArr[0]) countB++;
                    if (j == guessArr[1]) countB++;
                    if (k == guessArr[2]) countB++;
                    if (l == guessArr[3]) countB++;
                    bool cow1 = i != guessArr[0] &&
                                ((i == guessArr[1] && j != guessArr[1]) ||
                                 (i == guessArr[2] && k != guessArr[2]) ||
                                 (i == guessArr[3] && l != guessArr[3]));
                    bool cow2 = j != guessArr[1] &&
                                ((j == guessArr[0] && i != guessArr[0]) ||
                                 (j == guessArr[2] && k != guessArr[2]) ||
                                 (j == guessArr[3] && l != guessArr[3]));
                    bool cow3 = k != guessArr[2] &&
                                ((k == guessArr[0] && i != guessArr[0]) ||
                                 (k == guessArr[1] && j != guessArr[1]) ||
                                 (k == guessArr[3] && l != guessArr[3]));
                    bool cow4 = l != guessArr[3] &&
                                ((l == guessArr[0] && i != guessArr[0]) ||
                                 (l == guessArr[1] && j != guessArr[1]) ||
                                 (l == guessArr[2] && k != guessArr[2]));
                    if (cow1) countC++;
                    if (cow2) countC++;
                    if (cow3) countC++;
                    if (cow4) countC++;

                    if (countB == b && countC == c) std::cout << i << j << k << l << std::endl;
                }
            }
        }
    }
    delete[] guessArr;
    return 0;
}
