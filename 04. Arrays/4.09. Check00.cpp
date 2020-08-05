// github.com/andy489

#include <iostream>

bool check00(int *arr, size_t n) {
    size_t i = 0;
    for (; i < n - 1; ++i)
        if (arr[i] == 0)
            if (arr[i + 1] == 0)
                return true;
    return false;
}

int main() {
    int arr[] = {-3, 2, -45, 21, 0, 4, 5, 0, 0, 3, 32, -4, 0, 3};
    size_t len = sizeof(arr) / sizeof(arr[len]);

    std::cout << (check00(arr, len) ? "Yes\n" : "No\n");

    return 0;
}
