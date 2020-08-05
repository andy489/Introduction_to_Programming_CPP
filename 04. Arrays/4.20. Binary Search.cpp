// github.com/andy489

#include <iostream>

int binarySearch1(int arr[], int l, int r, int x) {/* A iterative binary search function. It returns location of x
 in given array arr[l..r] if present, otherwise -1. First way */
    while (l <= r) {
        int m = l + (r - l) / 2;
        if (arr[m] == x) return m; // Check if x is present at mid
        if (arr[m] < x) l = m + 1; // If x greater, ignore left half
        else r = m - 1; // If x is smaller, ignore right half
    }
    return -1; // if we reach here, then element was not present
}

int binarySearch2(int arr[], int l, int r, int x) { //Second way, with recursion
    if (r >= l) {
        int mid = l + (r - l) / 2;
        if (arr[mid] == x) return mid; // If the element is present at the middle itself
        // If element is smaller than mid, then it can only be present in left subarray
        if (arr[mid] > x) return binarySearch2(arr, l, mid - 1, x);
        // Else the element can only be present in right subarray
        return binarySearch2(arr, mid + 1, r, x);
    }
    return -1; // We reach here when element is not present in array
}

int main() {
    int arr[] = {1, 4, 5, 5, 7, 8, 9};
    int x = 8;
    size_t n = sizeof(arr) / sizeof(arr[0]);
    //int result = binarySearch1(arr, 0, n - 1, x);
    int result = binarySearch2(arr, 0, n - 1, x);
    (result == -1) ? std::cout << "Element is not present in array"
                   : std::cout << "Element is present at index " << result;
    return 0;
}
