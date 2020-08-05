// github.com/andy489

#include <iostream>
#include <cmath>

size_t getDigitCount(size_t n) {
    return (size_t) (floor(log10(n))) + 1;
}

size_t *numArr(size_t n, size_t len) {
    size_t *arr = new size_t[len];
    for (int i = len - 1; i >= 0; i--) {
        size_t curr = n % 10;
        arr[i] = curr;
        n /= 10;
    }
    return arr;
}

void countBurgers(size_t *arr, size_t len, size_t &leftBurgers, size_t &rightBurgers) {
    for (size_t i = 0; i < len / 2; i++) {
        leftBurgers += arr[i];
        rightBurgers += arr[len - i - 1];
    }
    if (len % 2 != 0) {
        leftBurgers += arr[len / 2];
        rightBurgers += arr[len / 2];
    }
}

int main() {
    size_t n;
    std::cin >> n;
    size_t digitCount = getDigitCount(n);
    size_t *arr = numArr(n, digitCount);

    size_t leftBurgers(0), rightBurgers(0);
    countBurgers(arr, digitCount, leftBurgers, rightBurgers);

    if (leftBurgers == rightBurgers)
        std::cout << "Even";
    else if (leftBurgers > rightBurgers)
        std::cout << "Strahil " << leftBurgers;
    else if (leftBurgers < rightBurgers)
        std::cout << "Pesho " << rightBurgers;
    delete[] arr;
    return 0;
}
