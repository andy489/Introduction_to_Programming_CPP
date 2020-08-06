#include <iostream>

size_t len(char *arr, size_t size) {
    size_t arrLen = 0;
    for (size_t i = 0; i < size; i++) {
        if (arr[i] != '\0') arrLen++;
        else break;
    }
    return arrLen;
}

void G(char *B, char *C, const size_t MAX_ARRAY_SIZE) {
    size_t lenB = len(B, MAX_ARRAY_SIZE);
    size_t lenC = len(C, MAX_ARRAY_SIZE);
    int index = -1;
    size_t currCount = 0;
    size_t maxCount = 0;
    for (size_t i = 0; i < lenB; i++) {
        if (B[i] == C[0]) {
            for (size_t j = 1; j <= lenC; j++) {
                if (B[i + j - 1] == C[j - 1] && i + j - 1 <= lenB) {
                    if (j == lenC) {
                        i = i + j;
                        j -= lenC;
                        currCount++;
                        if (currCount > maxCount) {
                            maxCount = currCount;
                            index = i - maxCount * lenC;
                        }
                    }
                }
            }
            currCount = 0;
        }
    }

    size_t const L = maxCount * lenC;
    char A[100];

    for (size_t i = 0; i < L; i++) {
        A[i] = C[i % lenC];

        //Let for example C={b,c,a} and B={B,E,G,I,N,b,c,a,b,c,a,b,c,a,E,N,D}, then
        //A={b,c,a,b,c,a,b,c,a}

        //A[0]=C[0] 0=0 (mod 3), A[1]=C[1] 1=1 (mod 3), A[2]=C[2] 2=2 (mod 3),
        //A[3]=C[0] 3=0 (mod 3), A[4]=C[1] 4=1 (mod 3), A[5]=C[2] 5=2 (mod 3),
        //A[6]=C[0] 6=0 (mod 3), A[7]=C[1] 7=1 (mod 3), A[8]=C[2] 8=2 (mod 3),
        //so generally A[i] = C [i (mod lenC)]
    }

    /*std::cout << "Subtraction of consistently repeating strings C (in array of chars C) in B is: ";
    for (size_t i = 0; i < L; i++) std::cout << A[i];
    std::cout << std::endl;*/
    std::cout << "Index: " << index << std::endl;
    std::cout << "Length: " << maxCount * lenC << std::endl;
}

int main() {
    const size_t MAX_ARRAY_SIZE = 100;
    char arrC[MAX_ARRAY_SIZE];
    char arrB[MAX_ARRAY_SIZE];
    std::cout << "Enter array \"B\" : ";
    std::cin >> arrB;
    std::cout << "Enter array \"C\" : ";
    std::cin >> arrC;
    G(arrB, arrC, MAX_ARRAY_SIZE);
    return 0;
}
