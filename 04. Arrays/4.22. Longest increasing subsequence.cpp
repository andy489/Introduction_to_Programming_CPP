// github.com/andy489

#include <iostream>

struct Range {
    const int *begin, *end;

    int len() const {
        return end - begin;
    }
};

Range longestSeq(const int *first, const int *last) {
    Range r{nullptr, nullptr}, t;
    while (first < last) {
        t.begin = first;
        while (++first != last)
            if (*(first - 1) >= *first) break;
        t.end = first;
        if (r.len() < t.len()) r = t;
    }
    return r;
}

int main() {
    int a[] = {8, 19, 3, 5, 7, 4, 8, 9, 19, -5, 3};
    size_t n = sizeof(a) / sizeof(a[0]);
    for (auto r = longestSeq(a, a + n); r.begin != r.end; ++r.begin)
        std::cout << *r.begin << ' ';
    std::cout << std::endl;
}
