// github.com/andy489

#include <iostream>

size_t findTrain(int *vec, size_t n, size_t &begin) {
    size_t maxCount = 0, maxBegin = 0;
    for (size_t i = 0; i < n; i++) {
        size_t begin = i;
        size_t currCount = 1;
        for (size_t j = begin + 1; j < n; j++) {
            if (vec[j] == vec[begin]) {
                currCount++;
            } else {
                i += currCount - 1;
                break;
            }
        }
        if (currCount > maxCount) {
            maxCount = currCount;
            maxBegin = begin;
        }
    }
    begin = maxBegin;
    return maxCount;
}

int main() {
    int vec[] = {1, 2, 3, 4, 4, 4, 4, -3, -6, 8, 8, 8, 9, 0, 0, 0, -12, 7, 7};
    size_t len = sizeof(vec) / sizeof(vec[0]);

    size_t begin;
    size_t lenTrain = findTrain(vec, len, begin);

    std::cout << "Beginning of train at: " << begin << "\n";
    std::cout << "Train length: " << lenTrain << "\n";

    return 0;
}
