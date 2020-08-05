// github.com/andy489

#include <iostream>

void fillArr(size_t n, int *arr) {
    size_t i = 0;
    for (; i < n; ++i) {
        int num;
        std::cin >> num;
        arr[i] = num;
    }
}

void minMaxElement(size_t n, int *arr, int &min, int &max) {
    min = arr[0], max = arr[0];
    for (size_t i = 0; i < n; i++) {
        if (arr[i] < min) min = arr[i];
        if (arr[i] > max) max = arr[i];
    }
}

int main() {
    size_t n;
    std::cin >> n;
    int *arr = new int[n];
    fillArr(n, arr);

    int min, max;
    minMaxElement(n, arr, min, max);

    std::cout << "min: " << min << "\nmax: " << max;

    delete[] arr;

    return 0;
}
