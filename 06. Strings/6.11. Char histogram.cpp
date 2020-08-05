// github.com/andy489

#include <iostream>
#include <cstring>

void printHisto(int *histo) {
    for (size_t i = 0; i < 26; i++)
        if (histo[i] > 0)
            std::cout << char(97 + i) << " - " << histo[i] << std::endl;
}

void printHisto(const char *str) {
    int *histo = new int[26];
    memset(histo, 0, 26 * sizeof(histo[0]));
    size_t len = strlen(str);

    for (size_t i = 0; i < len; i++)
        if (str[i] >= 'a' && str[i] <= 'z') histo[(int) str[i] - 97]++;

    printHisto(histo);
    delete[] histo;
}

int main() {
    const char *str = "randomness";
    printHisto(str);
    return 0;
}
