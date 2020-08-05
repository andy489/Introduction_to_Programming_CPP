// github.com/andy489

#include <iostream>

void printArr(int *arr, size_t len) {
    for (size_t i = 0; i < len; i++) std::cout << arr[i] << ' ';
    std::cout << std::endl;
}

int *newSortedSequence(int *arr1, size_t arrLen1, int *arr2, size_t arrLen2) {
    size_t arrLen3 = arrLen1 + arrLen2;
    int *arr3 = new int[arrLen3];
    size_t indx1(0), indx2(0), indx3(0);

    while (indx1 < arrLen1 && indx2 < arrLen2) { // will cycle until one of the two sequences ends
        if (arr1[indx1] > arr2[indx2])
            arr3[indx3++] = arr2[indx2++];
        else
            arr3[indx3++] = arr1[indx1++];
    }
    for (indx1; indx1 < arrLen1; indx1++) // will enter here if the second sequence ends first
        arr3[indx3++] = arr1[indx1];
    for (indx2; indx2 < arrLen2; indx2++) // will enter here if the first sequence ends first
        arr3[indx3++] = arr2[indx2];
    return arr3;
}

int main() {
    int arr1[] = {1, 7, 13, 17};
    int arr2[] = {3, 9};
    size_t arrLen1, arrLen2;

    arrLen1 = sizeof(arr1) / sizeof(arr1[0]);
    arrLen2 = sizeof(arr2) / sizeof(arr2[0]);

    printArr(arr1, arrLen1);
    printArr(arr2, arrLen2);

    int *arr3 = newSortedSequence(arr1, arrLen1, arr2, arrLen2);
    printArr(arr3, arrLen1 + arrLen2);

    delete[] arr3;
    return 0;
}
