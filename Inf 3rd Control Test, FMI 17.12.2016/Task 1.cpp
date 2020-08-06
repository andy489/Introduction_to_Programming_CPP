#include <iostream>

#define MAX 100

struct Indian {
    unsigned height;
} indians[MAX + 1]; // Масив от индианци
unsigned n; // Брой елементи в масива

void insertIndian(unsigned height) {// Добавя нов индианец
    indians[n].height = height;
    n++;
}

void seqPrint() { // Извежда списък с редицата от индианци
    unsigned i;
    for (i = 0; i < n; ++i)
        std::cout << "Indian " << i << " with height " << indians[i].height << '\n';
}

unsigned visibleIndians(Indian *indians, unsigned n) {
    unsigned visible = 0;
    unsigned maxHeight = 0; // за максимална височина може да сложим всяко число под 140 (в нашия случай)

    for (size_t i = 0; i < n; ++i) {
        if (indians[i].height > maxHeight) {
            maxHeight = indians[i].height;
            ++visible;
        }
    }
    return visible;
}

void randomSequenceIndians(unsigned n) {
    for (size_t i = 0; i < n; i++) {
        insertIndian(140 + rand() % 41); // Индианците са с височини от 140 до 180
    }
}

int main() {
    srand(unsigned(time(0)));

    randomSequenceIndians(25);
    seqPrint();

    std::cout << "Visible indians: " << visibleIndians(indians, n);
    return 0;
}
