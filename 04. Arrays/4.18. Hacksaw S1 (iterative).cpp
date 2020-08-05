// github.com/andy489

#include <iostream>

using namespace std;

void fillArr(int n, int *arr) {
    int i = 0;
    for (; i < n; ++i)
        cin >> arr[i];
}

bool hacksawNums(int a0, int a1, int a2, int rem) {
    if (rem == 1) {
        if (a0 < a1 && a1 > a2) {
            return true;
        }
    } else {
        if (a0 > a1 && a1 < a2) {
            return true;
        }
    }
    return false;
}

bool isHacksaw(int n, int *arr) {
    if (n == 1)
        return true;
    if (n == 2 && arr[0] != arr[1])
        return true;

    bool firstTypeCheck = hacksawNums(arr[0], arr[1], arr[2], 0);
    bool secondTypeCheck = hacksawNums(arr[0], arr[1], arr[2], 1);

    if (firstTypeCheck) {
        for (int i = 1; i < n - 1; ++i) {
            if (hacksawNums(arr[i - 1], arr[i], arr[i + 1], (i + 1) % 2)) {
                if (i == n - 2)
                    return true;
                continue;
            }
        }
    }
    if (secondTypeCheck) {
        for (int i = 1; i < n - 1; i++) {
            if (hacksawNums(arr[i - 1], arr[i], arr[i + 1], i % 2)) {
                if (i == n - 2)
                    return true;
                continue;
            }
        }
    }
    return false;
}

int main() {
    int n;
    cin >> n;

    int *arr = new int[n];

    fillArr(n, arr);

    cout << (isHacksaw(n, arr) ? "yes" : "no");

    delete[] arr;
    return 0;
}
