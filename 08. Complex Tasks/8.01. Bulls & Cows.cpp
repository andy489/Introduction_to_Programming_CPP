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

int inputNum(int lowerBound, int upperBound, bool &flag) {
    int n;
    while (true) {
        if (!flag) {
            std::cout << "Input a number in range [0..9999]: ";
            std::cin >> n;
        } else {
            std::cout << "Guess the number: ";
            std::cin >> n;
        }
        if (std::cin.fail()) {
            std::cin.clear();
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
        } else if ((n >= lowerBound) && (n <= upperBound)) break;
    }
    flag = true;
    return n;
}

int main() {
    bool flag = false;
    int num = inputNum(0, 9999, flag);
    int guess = inputNum(0, 9999, flag);

    int *numArr = numIntoArr(num);
    int *guessArr = numIntoArr(guess);

    size_t bulls(0), cows(0);

    for (size_t i = 0; i < 4; i++) {
        if (numArr[i] == guessArr[i]) {
            bulls++;
            guessArr[i] = -1;
        }
    }
    for (size_t i = 0; i < 4; i++) {
        size_t curr = guessArr[i];
        for (size_t j = 0; j < 4; j++) {
            if (numArr[j] == curr) {
                cows++;
                break;
            }
        }
    }
    std::cout << bulls << ' ' << cows;

    delete[] numArr;
    delete[] guessArr;
    return 0;
}
