#include <iostream>

void printArr(int *arr, size_t size) {
    std::cout << "Arr = {";
    for (size_t i = 0; i < size; i++) {
        if (i == size - 1) {
            std::cout << arr[i];
            break;
        }
        std::cout << arr[i] << ", ";
    }
    std::cout << '}';
}

int F(int *arr, size_t const L, int M) {
    if (M < 0) while (M < 0) M += 5;
    M = M % L; //checking for the condition |M|<L -> unnecessary
    for (int i = 0; i < M; i++) {
        int temp = arr[L - 1];
        for (size_t j = L - 1; j > 0; j--)
            arr[j] = arr[j - 1];
        arr[0] = temp;
    }
    return arr[L];
}

int main() {
    size_t const L = 5;
    int arr[L] = {6, 5, 6, 0, 3};
    int arrAfterRotations[L];
    std::cout << "Enter the number of rotations: ";
    int rotationOffset;
    std::cin >> rotationOffset;
    arrAfterRotations[L] = F(arr, L, rotationOffset);
    printArr(arr, L);
    return 0;
}
