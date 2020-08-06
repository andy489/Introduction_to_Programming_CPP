#include <iostream>
#include <time.h>

int ary[1000];

/*
 given a sequence of 1000 numbers (we'll generate it)
 clear all elements of the sequence, that
 are lower than the sum of the preceding elements
*/

int main() {
    srand(time(NULL));

    int sum = 0, cnum = 0;

    int numcount = sizeof(ary) / sizeof(int);

    // generate numbers, so that the beginning of the sequence
    // has lower values, and the end - higher

    for (int i = 0; i < numcount; ++i)
        ary[i] = (rand() % 1000) * i / numcount;

    do {
        if (ary[cnum] < sum) {
            for (int i = cnum; i < numcount - 1; ++i)
                ary[i] = ary[i + 1];
            numcount--;
            ary[numcount] = 0;
        } else {
            sum += ary[cnum];
            cnum++;
        }
    } while (cnum < numcount);

    for (int i = 0; i < cnum; ++i)
        std::cout << ary[i]<<' ';
    return 0;
}
