// github.com/andy489

#include <iostream>

using namespace std;

void fillArr(int n, int *arr) {
    int i = 0;
    for (; i < n; ++i)
        cin >> arr[i];
}

bool hs2(int *arr, int k, int n);

bool hs1(int *arr, int k, int n) {
    if (k == n - 2)
        return true;
    return ((arr[k - 1] > arr[k] && arr[k] < arr[k + 1]) && hs2(arr, k + 1, n));
}

bool hs2(int *arr, int k, int n) {
    if (k == n - 2)
        return true;
    return ((arr[k - 1] < arr[k] && arr[k] > arr[k + 1]) && hs1(arr, k + 1, n));
}

bool isHacksaw(int *arr, int n) {
    if (n == 1 || (n == 2 && arr[0] != arr[1]))
        return true;
    if (arr[0] < arr[1] && arr[1] > arr[2])
        return hs1(arr, 1, n);
    if (arr[0] > arr[1] && arr[1] < arr[0])
        return hs2(arr, 1, n);
}

int main() {
    int n;
    cin >> n;

    int *arr = new int[n];

    fillArr(n, arr);

    cout << (isHacksaw(arr, n) ? "yes" : "no");

    delete[] arr;
    return 0;
}
