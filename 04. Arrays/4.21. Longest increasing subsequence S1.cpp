// github.com/andy489

#include <iostream>

size_t indexLongestIncreasingSubsequence(int *arr, size_t arrLen, size_t &len) {
    size_t currCount(0), currIndex, maxCount(0), maxIndex(0);
    for (size_t i = 0; i < arrLen; i++) {
        currIndex = i;
        for (size_t j = i; j < arrLen; j++) {
            if (arrLen - i <= maxCount) goto end; // optimization
            if (arr[j] < arr[j + 1]) currCount++;
            else {
                i = j;
                break;
            }
        }
        if (currCount > maxCount) {
            maxCount = currCount;
            maxIndex = currIndex;
        }
        currCount = 0;
    }
    end:
    len = maxCount;
    return maxIndex;
}

void print(int *arr, size_t s, size_t e) {
    for (size_t i = s; i <= s + e; i++)
        std::cout << arr[i] << ' ';
    std::cout << std::endl;
}

int main() {
    int arr[] = {1, 2, 3, 1, 2, 3, 4, 5, 1, 2, 3, 4};
    size_t arrLen = sizeof(arr) / sizeof(arr[0]);

    size_t end;
    size_t start = indexLongestIncreasingSubsequence(arr, arrLen, end);
    std::cout << "The longest increasing subsequence is: ";
    print(arr, start, end);
    return 0;
}
