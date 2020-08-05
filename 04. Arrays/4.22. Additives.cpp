// github.com/andy489

#include <iostream>

void printArr(int *arr, int length) {
    for (int i = 0; i < length; i++)
        std::cout << arr[i] << ' ';
    std::cout << std::endl;
}

void printAllAdditives(int *arr, size_t arrLen, int targetSum) {
    int *additives = new int[arrLen];
    for (size_t i = 0; i < arrLen; i++) {
        for (size_t k = 0; k < arrLen - i; k++) {
            int currentIndex = 0;
            int currentSum = targetSum;
            for (size_t j = i; j < arrLen; j++) {
                if (currentSum - arr[j] >= 0) {
                    additives[currentIndex] = arr[j];
                    currentIndex++;
                    currentSum -= arr[j];
                }
                //This is the first iteration of the j loop and arr[j] is part of a potential combination
                if (j == i && currentIndex == 1) j += k;
                    //there's no point in going further if arr[j] is not part of a combination
                else if (j == i) {
                    k = arrLen;
                    break;
                }
            }
            if (currentSum == 0)
                printArr(additives, currentIndex);
        }
    }
    delete[] additives;
}

int main() {
    int arr[] = {2, 8, -6, 9, 7, 3, 5, -9, -4, 7, 6, 2, 11};
    size_t arrLen = sizeof(arr) / sizeof(arr[0]);

    printAllAdditives(arr, arrLen, 22);

    return 0;
}
