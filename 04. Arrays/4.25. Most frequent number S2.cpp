// github.com/andy489

#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    int n;
    std::vector<int> arr;
    std::cin >> n;
    for (int i = 0; i < n; i++) {
        int el;
        std::cin >> el;
        arr.push_back(el);
    }
    sort(arr.begin(), arr.end());
    std::vector<int> res;
    unsigned maxCount(0);
    static int i = 0;
    for (i; i < n; i++) {
        unsigned currCount(0);
        for (int j = i; j < n; j++) {
            if (arr[j] == arr[i]) {
                currCount++;
                if (currCount == maxCount) res.push_back(arr[j]);
                else if (currCount > maxCount) {
                    res.clear();
                    res.push_back(arr[j]);
                    maxCount = currCount;
                }
            } else {
                i += currCount - 1;
                break;
            }
            if (j == n - 1) goto END;
        }
    }
    END:
    unsigned SIZE = res.size();
    for (unsigned i = 0; i < SIZE; i++) std::cout << res[i] << ' ';
    return 0;
}
