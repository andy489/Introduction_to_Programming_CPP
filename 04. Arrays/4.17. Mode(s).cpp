// github.com/andy489

#include <iostream>
#include <vector>

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

std::vector<int> modes(int *arr, size_t n) {
    std::vector<int> m;

    int max = 1, c = 0;
    for (int i = 0; i < n; ++i) {
        for (int j = i; j < n; ++j) {
            if (arr[i] == arr[j]) {
                ++c;
                if (c > max) {
                    max = c;
                    m.clear();
                    m.push_back(arr[i]);
                } else if (c == max) {
                    m.push_back(arr[i]);
                }
            } else {
                c = 0;
                i += c;
            }
        }
    }
    return m;
}

int main() {
    int arr[] = {1, 2, 3, 5, 3, 1};
    //int arr[] = {1, 2, 3, 5};
    //int arr[] = {1, 2, 3, 3, 5};

    size_t arrLen = sizeof(arr) / sizeof(arr[0]);

    bubbleSort(arr, arrLen);

    std::vector<int> m = modes(arr, arrLen);

    for (int i = 0; i < m.size(); ++i)
        std::cout << m[i] << ' ';

    return 0;
}
