// github.com/andy489

#include <iostream>

void bubbleSort(int *arr, size_t n) {
    while (true) {
        bool swapped = false;
        for (size_t i = 0; i < n - 1; ++i) {
            if (arr[i] > arr[i + 1]) {
                std::swap(arr[i], arr[i + 1]);
                swapped = true;
            }
        }
        if (!swapped) break;
    }
}

double median(int *arr, size_t n) {
    if (n & 1) //odd
        return arr[n / 2];
    else return double(arr[n / 2] + arr[n / 2 - 1]) / 2;
}

int main() {
    int arr[] = {1, 2, 3, 5, 1, 1};

    size_t arrLen = sizeof(arr) / sizeof(arr[0]);

    bubbleSort(arr, arrLen);

    std::cout << median(arr, arrLen);

    return 0;
}
