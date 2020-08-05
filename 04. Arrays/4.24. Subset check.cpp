// github.com/andy489

#include <iostream>

bool isSubset(int arr1[], size_t n1, int arr2[], size_t n2) {
    if (n2 > n1) return false;
    else {
        for (size_t i = 0; i < n2; i++) {
            bool contains = false;
            for (size_t j = 0; j < n1; j++)
                if (arr2[i] == arr1[j]) 
                    contains = true;
            if (contains) continue;
            else return false;
        }
        return true;
    }
}

int main() {
    int arr1[] = {1, 2, 3, 4, 5, 6};
    size_t len1 = sizeof(arr1) / sizeof(arr1[0]);
    int arr2[] = {5, 1, 2};
    size_t len2 = sizeof(arr2) / sizeof(arr2[0]);
    bool subset = isSubset(arr1, len1, arr2, len2);
    if (subset) std::cout << "is subset";
    else std::cout << "is not subset";
    return 0;
}
