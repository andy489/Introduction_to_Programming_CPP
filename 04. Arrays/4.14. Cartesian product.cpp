// github.com/andy489

#include <iostream>

int main() {
    int n, k(0), i(0), j(0);
    std::cin >> n;
    int *arr = new int[n];

    for (; i < n; ++i)
        std::cin >> arr[i];

    int newArrLen = n * n;
    int *carProdArr = new int[newArrLen];

    for (i = 0; i < n; ++i)
        for (j = 0; j < n; ++j)
            carProdArr[k++] = arr[i] * arr[j];

    for (i = 0; i < newArrLen; i++)
        std::cout << carProdArr[i] << ' ';

    delete[] arr;
    delete[] carProdArr;
    return 0;
}
