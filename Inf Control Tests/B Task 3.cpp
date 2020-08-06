#include <iostream>
#include <time.h>

#define RAND_NUMS
typedef unsigned int uint;

uint ary[1000];

int main() {
    int sum = 0;
    uint n, k, spos = 0;

    std::cin >> k >> n;

    if (k > n) {    // bad input
        return 0;
    }

    // you can enable RAND_NUMS for tests with large 
    // arrays of randomly generated integers in the
    // [0..1000] range

#ifdef RAND_NUMS
    // just fill this array with random data, 
    // so that we don't have to input 100 numbers
    srand((unsigned) time(NULL));
    for (unsigned i = 0; i < n; i++) {
        ary[i] = (rand() % 1000);
    }
#else
    for (int i = 0; i < n; i++) {
        std::cin >> ary[i];
    }
#endif

    // do selection sort as we assume K is lot smaller than N
    do {
        for (unsigned i = spos; i < n; i++) {
            if (ary[i] < ary[spos]) {
                int t = ary[spos];
                ary[spos] = ary[i];
                ary[i] = t;
            }
        }

        sum += ary[spos++];
    } while (spos < k);

    std::cout << sum;
}
