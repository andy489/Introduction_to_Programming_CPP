// github/com/andy489

#include <iostream>

void printArr(size_t arrLen, int *arr) { 
    size_t i = 0;
    for (; i < arrLen; i++)
        std::cout << arr[i] << ' ';
    std::cout << std::endl;
}

int main() {
    int arr[] = {1, 1, 2, 3, 5, 8, 13};

    size_t arrLen = sizeof(arr) / sizeof(arr[0]);

    printArr(arrLen, arr);

    return 0;
}
