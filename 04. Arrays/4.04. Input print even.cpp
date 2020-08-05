#include <iostream>

void fillArr(size_t n, int *arr) {
    size_t i = 0;
    for (; i < n; ++i) {
        int num;
        std::cin >> num;
        arr[i] = num;
    }
}

void printEvenElements(size_t n, int *arr) {
    std::cout << "Even elements: ";
    for (size_t i = 0; i < n; i++)
        if (!(arr[i] & 1))
            std::cout << arr[i] << ' ';
    std::cout << std::endl;
}

int main() {
    size_t n;
    std::cin >> n;
    int *arr = new int[n];
    fillArr(n, arr);

    printEvenElements(n, arr);

    delete[] arr;

    return 0;
}
