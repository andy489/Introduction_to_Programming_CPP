// github.com/andy489

#include <iostream>

void fillArr(size_t n, int *arr) {
    for (size_t i = 0; i < n; i++) {
        int num;
        std::cin >> num;
        arr[i] = num;
    }
}

void printArrReverse(size_t n, int *arr) { 
    std::cout << "Elements in reversed order: ";
    for (size_t i = 0; i < n; i++)
        std::cout << arr[n - i - 1] << ' ';
    std::cout << std::endl;
}

int main() {
    size_t n;
    std::cin >> n;
    int *arr = new int[n];
    fillArr(n, arr);

    printArrReverse(n, arr);

    delete[] arr;

    return 0;
}
