// github.com/andy489

#include <iostream>

void copy(double *f, double *s, size_t flen) {
    size_t i = 0;
    for (; i < flen; ++i)
        s[i] = f[i];

}

int main() {
    double firstArr[] = {1, 1, 2, 3, 5, 8, 13};

    const size_t s = sizeof(firstArr) / sizeof(firstArr[0]);

    const size_t secondArrLen = 2 * s;
    
    double secondArr[secondArrLen];

    copy(firstArr, secondArr, s);

    return 0;
}
