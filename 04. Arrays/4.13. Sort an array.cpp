// github.com/andy489

#include <iostream>

void bubbleSort(int *arr, size_t n) { //first way
    while (true) {
        bool swapped = false;
        for (size_t i = 0; i < n - 1; ++i) {
            if (arr[i] > arr[i + 1]){ // if descending "<"
                std::swap(arr[i], arr[i + 1]);
                swapped = true;
            }
        }
        if (!swapped) break;
    }
}

void selectionSort(int *arr, size_t n) { //second way
    for (size_t i = 0; i < n - 1; ++i) {
        size_t min = i;
        for (size_t j = i + 1; j < n; ++j)
            if (arr[j] < arr[min]) // if descending ">"
                min = j;
        std::swap(arr[i], arr[min]);
    }
}

void printArr(int *arr, size_t n) {
    for (size_t i = 0; i < n; ++i)
        std::cout << arr[i] << ' ';
    std::cout << std::endl;
}

int main() {
    int arr[15] = {-3, 10, 1, 6, 11, 2, -2, 5, 4, 8, -1, 9, 7, 0, 3};
    size_t arrLen = sizeof(arr) / sizeof(arr[0]);
    printArr(arr, arrLen);
    bubbleSort(arr, arrLen);
    //selectionSort(arr, arrLen);
    printArr(arr, arrLen);
    return 0;
}
