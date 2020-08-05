// github.com/andy489

#include <iostream>

// returns value of poly[0]x(n-1) + poly[1]x(n-2) + .. + poly[n-1] 
int horner1(int poly[], int n, int x) {       //iterative 
    int result = poly[0];  // Initialize result 

    // Evaluate value of polynomial using Horner's method 
    for (int i = 1; i < n; i++)
        result = result * x + poly[i];

    return result;
}

int horner2(int *poly, int k, int x) {    //recursive
    if (k == 1) return poly[k - 1];
    return poly[k - 1] + (x * (horner2(poly, k - 1, x)));
}

int main() {
    // Let us evaluate value of 2x3 + 3x + 1 for x = 2 
    int poly[] = {2, 0, 3, 1};
    int x = 2;
    int n = sizeof(poly) / sizeof(poly[0]);
    std::cout << "Value of polynomial is " << horner1(poly, n, x) << " iteratively\n";
    std::cout << "Value of polynomial is " << horner2(poly, n, x) << " using recursion\n";
    return 0;
}
