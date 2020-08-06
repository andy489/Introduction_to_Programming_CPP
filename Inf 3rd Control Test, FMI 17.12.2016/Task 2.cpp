#include <iostream>

bool isBalanced(unsigned int *arr, unsigned int n) {
    unsigned int leftSum(0), rightSum(0), i = 0;
    for (; i < n / 2; i++) {
        leftSum += arr[i];
        rightSum += arr[n - i - 1];
    }
    if (leftSum == rightSum) return true;
    return false;
}

int main() {
    unsigned int a[] = {5, 10, 4, 1, 7, 3, 9};
    unsigned int len_a = sizeof(a) / sizeof(a[0]);

    unsigned int b[] = {5, 10, 4, 1, 7, 9};
    unsigned int len_b = sizeof(b) / sizeof(b[0]);

    std::cout << (isBalanced(a, len_a) ? "balanced\n" : "is not balanced\n");
    std::cout << (isBalanced(b, len_b) ? "balanced\n" : "not balanced\n");

    return 0;
}
