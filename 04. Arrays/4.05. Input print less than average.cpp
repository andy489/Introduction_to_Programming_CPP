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

void printAllLessThanAverage(size_t n, int *arr) {
    int sum(0), i(0);
    for (; i < n; i++)
        sum += arr[i];

    double average = (double) sum / n;
    std::cout << "Less than average elements: ";
    for (i = 0; i < n; i++) {
        if (arr[i] < average) {
            std::cout << arr[i] << ' ';
        }
    }
    std::cout << std::endl;
}

int main() {
    size_t n;
    std::cin >> n;
    int *arr = new int[n];
    fillArr(n, arr);

    printAllLessThanAverage(n, arr);

    delete[] arr;

    return 0;
}
