// github.com/andy489

#include <iostream>

bool sym(char *arr, size_t len) {
    int i = 0;
    for (; i < (int) (len / 2); ++i)
        if (arr[i] != arr[len - i - 1])
            return false;
    return true;
}

int main() {
    char arr[] = {1, 2, 4, 5, 4, 2, 1};
    size_t len = sizeof(arr) / sizeof(arr[0]);

    std::cout << (sym(arr, len) ? "sym\n" : "not sym\n");

    return 0;
}
