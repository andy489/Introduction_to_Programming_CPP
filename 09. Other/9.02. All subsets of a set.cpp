// github.com/andy489

#include <iostream>
#include <cmath>

void allPossibleSubset(int arr[], size_t n) {
    size_t count = (size_t) (pow(2, n));
    /* The outer for loop will run 2^n times to print all subset .
       Here variable i will act as a binary counter */
    for (size_t i = 0; i < count; i++) {
        /* The inner for loop will run n times , As the maximum number of elements a set can have is n
        This loop will generate a subset */
        for (size_t j = 0; j < n; j++) {
            /* This if condition will check if jth bit in binary representation of  i  is set or not
            if the value of (i & (1 << j)) is greater than 0 , include arr[j] in the current subset
            otherwise exclude arr[j] */
            if ((i & (1 << j)) > 0)
                std::cout << arr[j] << " ";
        }
        std::cout << "\n";
    }
}

int main() {
    size_t n;
    std::cout << "Enter size of the set\n";
    std::cin >> n;

    int *arr = new int[n];
    std::cout << "Enter Elements of the set\n";
    for (size_t i = 0; i < n; i++)
        std::cin >> arr[i];
    allPossibleSubset(arr, n);
    delete[] arr;

    return 0;
}
