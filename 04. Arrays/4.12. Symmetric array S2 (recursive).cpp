// github.com/andy489

#include <iostream>

bool sym(char *arr, int s, int e) {
    if (s >= e)
        return true;
    if (arr[s] != arr[e])
        return false;
    else
        return sym(arr, s + 1, e - 1);
}

int main() {
    char arr[] = {1, 2, 4, 5, 4, 2, 1};
    size_t len = sizeof(arr) / sizeof(arr[0]);

    std::cout << (sym(arr, 0, len-1) ? "sym\n" : "not sym\n");

    return 0;
}
