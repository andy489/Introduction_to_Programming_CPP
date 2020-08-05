// github.com/andy489

#include <iostream>

unsigned partition(int *arr, unsigned start, unsigned end) {
    int pivot = arr[end]; // pick rightmost element as pivot from the array
    /* elements less than pivot will be pushed to the left of pIndex
       elements more than pivot will be pushed to the right of pIndex
       equal elements can go either way */
    unsigned pIndex = start;
    /* each time we finds an element less than or equal to pivot, pIndex
      is incremented and that element would be placed before the pivot. */
    for (unsigned i = start; i < end; i++) {
        if (arr[i] <= pivot) {
            std::swap(arr[i], arr[pIndex]);
            pIndex++;
        }
    }
    std::swap(arr[pIndex], arr[end]); // swap pIndex with Pivot	
    return pIndex; // return pIndex (index of pivot element)
}

void quickSort(int *arr, int start, int end) {
    if (start >= end) return; // base condition		
    unsigned pivot = partition(arr, start, end); // rearrange the elements across pivot	
    // recursion on sub-array containing elements that are less than pivot
    quickSort(arr, start, pivot - 1);
    // recursion on sub-array containing elements that are more than pivot
    quickSort(arr, pivot + 1, end);
}

int *inputData(int &len) {
    std::cin >> len;
    int *arr = new int[len];
    for (int i = 0; i < len; i++) std::cin >> arr[i];
    return arr;
}

int main() {
    int n;
    int *arr = inputData(n);
    quickSort(arr, 0, n - 1);

    // for (int i = 0; i < n; i++) std::cout << arr[i] << ' ';
    int *res = new int[n];
    int indx(0), size(0);
    unsigned maxCount(0);
    static int i = 0;
    for (i; i < n; i++) {
        unsigned currCount(0);
        int currEl = arr[i];
        for (int j = i; j < n; j++) {
            if (arr[j] == arr[i]) {
                currCount++;
                if (currCount == maxCount) {
                    size++;
                    res[indx++] = arr[j];
                } else if (currCount > maxCount) {
                    indx = 0;
                    size = 1;
                    res[indx++] = arr[j];
                    maxCount = currCount;
                }
            } else {
                i += currCount - 1;
                break;
            }
            if (j == n - 1) {
                goto END;
            }
        }
    }
    END:
    for (int i = 0; i < size; i++) {
        std::cout << res[i] << ' ';
    }
    delete[] arr;
    delete[] res;
    return 0;
}
