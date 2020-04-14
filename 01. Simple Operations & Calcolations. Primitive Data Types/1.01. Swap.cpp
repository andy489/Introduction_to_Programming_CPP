# github.com/andy489

#include <iostream>

void swap_a(int &a, int &b) {
    int temp = a;
    a = b;
    b = temp;
}

void swap_b(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int main() {
    int a = 3, b = 10;
    std::cout << "a: " << a << "; " << "b: " << b << '\n';
    swap_a(a, b);
    std::cout << "a: " << a << "; " << "b: " << b << '\n';

    swap_b(&a, &b);
    std::cout << "a: " << a << "; " << "b: " << b << '\n';
    
    int c = 4, d = 11;
    std::cout << "c: " << c << "; " << "d: " << d << '\n';
    c += d - (d = c); // clever swap
    std::cout << "c: " << c << "; " << "d: " << d << '\n';
    return 0;
}
