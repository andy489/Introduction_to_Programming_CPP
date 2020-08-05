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

std::pair<int, int> minMaxElement(size_t n, int *arr) {
    std::pair<int, int> p = std::make_pair(arr[0], arr[0]);
    for (size_t i = 0; i < n; i++) {
        if (arr[i] < p.first) p.first = arr[i];
        if (arr[i] > p.second) p.second = arr[i];
    }
    return p;
}

int main() {
    size_t n;
    std::cin >> n;
    int *arr = new int[n];
    fillArr(n, arr);

    std::pair<int, int> minMax = minMaxElement(n, arr);

    std::cout << "min: " << minMax.first << "\nmax: " << minMax.second;

    delete[] arr;

    return 0;
}
