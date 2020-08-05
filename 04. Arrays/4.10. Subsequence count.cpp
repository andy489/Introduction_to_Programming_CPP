// github.com/andy489

#include <iostream>

size_t subseqA1A2(int *arr1, int *arr2, size_t len1, size_t len2) {
    size_t count = 0;
    if (len2 < len1) return count;
    else {
        for (size_t i = 0; i < len2 - len1 + 1; i++) {
            if (arr2[i] == arr1[0]) {
                for (size_t j = 1; j < len1; j++) {
                    if (arr2[i + j] == arr1[j]) {
                        if (j == len1 - 1) {
                            count++;
                            i += j;
                            break;
                        }
                    } else break;
                }
            }
        }
    }
    return count;
}

int main() {
    int arr1[] = {1, 2};
    size_t len1 = sizeof(arr1) / sizeof(arr1[0]);
    int arr2[] = {0, 1, 2, 3, 0, 1, 2, 3, 4, 3, 2, 1, 2, 3, 1, 2, 1, 2};
    size_t len2 = sizeof(arr2) / sizeof(arr2[0]);

    std::cout << subseqA1A2(arr1, arr2, len1, len2) << std::endl;

    return 0;
}
