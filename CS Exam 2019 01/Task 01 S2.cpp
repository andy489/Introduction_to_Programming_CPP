#include <iostream>

struct Range {
    const int *begin, *end;

    int len() const {
        return end - begin;
    }
};

unsigned progress(int a[], unsigned n) {
    int *first = a;
    int *last = &a[n - 1];
    Range r{nullptr, nullptr}, t;
    while (first < last) {
        t.begin = first;
        while (++first != last)
            if (*(first - 1) > *first) break; // проверка за растене на подредицата чрез поинтъри
        t.end = first;
        if (r.len() < t.len()) r = t; // избираме максималната дължина
    }
    return r.len();
}

int main() {
    int a[] = {1, 3, 1, 2, 3, 1};
    unsigned n = sizeof(a) / sizeof(a[0]);

    std::cout << progress(a, n);
    return 0;
}
