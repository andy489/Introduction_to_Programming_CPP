// github.com/andy489

#include <iostream>

void swap(int &a, int &b) {
    int t = a;
    a = b;
    b = t;
}

void reverse(size_t arrLen, int *arr) {
    size_t i = 0;
    for (; i < arrLen / 2; i++)
        swap(arr[i], arr[arrLen - i - 1]);
}

void printArr(size_t arrLen, int *arr) {
    size_t i = 0;
    for (; i < arrLen; i++)
        std::cout << arr[i] << ' ';
    std::cout << std::endl;
}

int main() {
    int arr[] = {1, 1, 2, 3, 5, 8, 13};

    size_t arrLen = sizeof(arr) / sizeof(arr[0]);

    reverse(arrLen, arr);

    printArr(arrLen, arr);

    return 0;
}
