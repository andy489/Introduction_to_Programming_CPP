// github.com/andy489

#include <iostream>
#include <cmath>

int main() {
    int n(1);
    while (true) {
        int curr_i, curr_j;
        int count(0);
        int i, j, end(std::pow(n, 1.0 / 3));
        for (i = 1; i <= end; ++i) {
            for (j = 1; j <= end; j++) {
                if (pow(i, 3) + pow(j, 3) == n) {
                    if (count == 0) {
                        curr_i = i;
                        curr_j = j;
                    }
                    ++count;
                    if (count == 3) {
                        std::cout << "The smallest number,\n";
                        std::cout << "expressible as the sum of two cubes in two different ways is:\n";
                        std::cout << n << "\n";
                        std::cout << n << "=" << curr_i << "^{3}+" << curr_j << "^{3}=" << j << "^{3}+" << i
                                  << "^{3}\n";
                        return 0;
                    }
                }
            }
        }
        ++n;
    }
    return 0;
}
