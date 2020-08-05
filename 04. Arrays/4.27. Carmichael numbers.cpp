// github.com/andy489

#include <iostream>

size_t countPrimeDivisors(size_t n) {
    size_t count(0), i(2);
    while (n != 1) {
        if (n % i == 0) {
            n /= i;
            count++;
            i = 1;
        }
        i++;
    }
    return count;
}

size_t *divisors(size_t n, size_t count, bool &checkKorslet) {
    size_t num = n;
    size_t *primeDiv = new size_t[count];

    size_t i = 2;
    size_t j = 0;

    while (n != 1) {
        if (n % i == 0) {
            n /= i;
            primeDiv[j] = i;
            i = 1;
            j++;
        }
        i++;
    }
    checkKorslet = true;
    for (size_t i = 0; i < count; i++) {
        if ((num - 1) % (primeDiv[i] - 1) != 0) {
            checkKorslet = false;
        }
    }
    return primeDiv;
}

int main() {
    size_t n;
    std::cin >> n;

    size_t count = countPrimeDivisors(n);

    bool checkKorslet;

    size_t *arr = divisors(n, count, checkKorslet);

    if (count > 1 && checkKorslet) {
        std::cout << "Number " << n << " = ";
        for (size_t i = 0; i < count; i++) {
            if (i != count - 1) std::cout << arr[i] << ".";
            else std::cout << arr[i];
        }
        std::cout << " is a Carmichael's number!";
    } else {
        std::cout << "Number " << n << " = ";
        for (size_t i = 0; i < count; i++) {
            if (i != count - 1) std::cout << arr[i] << ".";
            else std::cout << arr[i];
        }
        std::cout << " is not a Carmichael's number.";
    }
    return 0;
}
