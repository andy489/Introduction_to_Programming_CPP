// github.com/andy489

#include <iostream>
#include <climits>

int myAbs(int a) {
    return a > 0 ? a : -a;
}

void bubbleSort(int *arr, int arrLen) {
    while (true) {
        bool swapped = false;
        for (int index = 0; index < arrLen - 1; index++) {
            if (arr[index] > arr[index + 1]) {
                std::swap(arr[index], arr[index + 1]);
                swapped = true;
            }
        }
        if (!swapped) break;
    }
}

int findMinAbsVal(int *arr, unsigned n) {
    int minAbs = INT_MAX;
    for (int i = 0; i < n - 1; i++) {
        if (arr[i] - arr[i + 1] == 0)
            return 0;
        else if (myAbs(arr[i] - arr[i + 1]) < minAbs)
            minAbs = myAbs(arr[i] - arr[i + 1]);
    }
    return minAbs;
}

int main() {
    int n, i = 0;
    std::cin >> n;
    if (n == 1)
        return std::cout << 0, 0;

    int *arr = new int[n];
    for (; i < n; i++)
        std::cin >> arr[i];

    bubbleSort(arr, n);

    std::cout << findMinAbsVal(arr, n);

    delete[] arr;
    return 0;
}
