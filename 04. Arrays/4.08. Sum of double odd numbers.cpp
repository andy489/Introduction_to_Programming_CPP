// github.com/andy489

#include <iostream>

int *inputArr(size_t n) {
    int *arr = new int[n];
    for (size_t i = 0; i < n; i++)
        std::cin >> arr[i];
    return arr;
}

int findSumDoubleOdd(int *arr, size_t n) {
    int sum = 0, i = 0;
    for (; i < n; ++i)
        if (arr[i] % 2 == 0 && arr[i] % 4 != 0)
            sum += arr[i];
    return sum;
}

int main() {
    size_t n;
    std::cin >> n;
    int *arr = inputArr(n);
    std::cout << findSumDoubleOdd(arr, n);
    delete[] arr;
    return 0;
}
