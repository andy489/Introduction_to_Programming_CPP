#include <iostream>

int main() {
    unsigned n;
    std::cout << "n = ";
    std::cin >> n;

    unsigned *arr = new unsigned[n];
    unsigned sum = 0, count = 0;

    for (size_t i = 0; i < n; i++) {
        std::cout << "a[" << i << "] = ";
        std::cin >> arr[i];

        if (sum == arr[i]) count++;
        sum += arr[i];
    }

    std::cout << "Answer: " << count << '\n';

    unsigned bonusCount = 0;
    size_t i = 1;
    for (i; i < n; i++) {
        int curr = arr[i];
        for (int j = i - 1; j >= 0; j--) {
            curr -= arr[j];
            if (curr == 0) {
                bonusCount++;
                break;
            } else if (curr < 0) break;
        }
    }
    std::cout << "Bonus answer: " << bonusCount << '\n';
    delete[] arr;
    return 0;
}
