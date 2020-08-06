#define N 8
#define M 13

#include <iostream>

// създаваме си произволна мрежа с размери NxM
char web[N][M] = {
        ' ', 'a', ' ', ' ', 'a', ' ', ' ', ' ', ' ', ' ', ' ', 'a', ' ',
        ' ', 'a', ' ', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a',
        ' ', 'a', 'a', 'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a',
        ' ', ' ', ' ', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
        ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
        'a', ' ', ' ', ' ', ' ', ' ', 'a', ' ', ' ', ' ', ' ', ' ', 'a',
        'a', 'a', ' ', ' ', 'a', 'a', 'a', ' ', ' ', ' ', 'a', 'a', 'a',
        'a', 'a', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'a', 'a', 'a'
};

void printWeb(); // функция за принтиране на мрежата имплементирана по-долу

int countAreas(int x, int y) {
    unsigned count;

    if (x < 0 || x > N - 1 || y < 0 || y > M - 1) // извън мрежата
    {
        count = 0;
    } else {
        if (web[x][y] == ' ') // при стъпване на празна клетка големината на региона е 0
        {
            count = 0;
        }
            /* в този случай не сме извън мрежата и не сме стъпили на празна клетка следователно
            сме стъпили на запълнена и започваме да броим размера на областта*/
        else {
            web[x][y] = ' ';
            count = 1 + countAreas(x - 1, y + 1) + countAreas(x, y + 1)
                    + countAreas(x + 1, y + 1) + countAreas(x + 1, y) +
                    +countAreas(x + 1, y - 1) + countAreas(x, y - 1) +
                    countAreas(x - 1, y - 1) + countAreas(x - 1, y);
        }
    }
    return count;
}

int main() {
    std::cout << "The starting web:\n";
    printWeb();
    unsigned br(0); // брояч за номер на област
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            if (web[i][j] != ' ') {
                br++;
                std::cout << "~The area of region " << br << " is " << countAreas(i, j);
                std::cout << "\n~Web after counting region " << br << ":\n";
                printWeb();
            }
        }
    }
    return 0;
}

void printWeb() {
    for (size_t i = 0; i < N; i++) {
        for (size_t j = 0; j < M; j++) std::cout << web[i][j];
        std::cout << std::endl;
    }
    std::cout << std::endl;
}
