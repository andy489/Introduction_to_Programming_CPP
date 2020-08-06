#define N 3

#include <iostream>

size_t myStrlen(char *str) {
    size_t len = 0;;
    while (str[len] != '\0') len++;
    return len;
}

/* Функция, която проверява дали дадена дума съществува в матрицата от букви,
като стартира от първото срещане на първата буква от търсената дума в матрицата
от букви. С level отбелязваме кога ще сме изчерпали думата, а x и y са текущата
позиция в буквената матрица */
bool findWord(char C[3][3], char *word, int x, int y, int length) {
    int len = myStrlen(word);
    // Ако сме достигнали дължината на думата, значи сме намерили такава дума 
    if (length == len) return true;

    // Дефиниционно множество. Ако излезем извън буквената таблица връщаме false
    if (x < 0 || y < 0 || x >= 3 || y >= 3) return false;

    // Знаем, че сме съвпаднали с тази буква, защото първитре x и y ще са проверените i и j
    if (C[x][y] == word[length]) {    // Търсим съвпадение в допустимите клетки по правилото
        bool rest = findWord(C, word, x - 1, y, length + 1) ||
                    findWord(C, word, x + 1, y, length + 1) ||
                    findWord(C, word, x, y - 1, length + 1) ||
                    findWord(C, word, x, y + 1, length + 1);
        return rest;
    } else return false; // Не сме намерили съвпадение тогава false 
}

//Функция, която проверява дали дадена дума я има в матрицата по дадените правила
bool matchWord(char C[3][3], char *word) {
    int len = myStrlen(word);
    // Обхождаме матрицата и търсим съвпадение с първата буква на думата 
    for (int i = 0; i < N; i++) {
        for (int j = 0;
             j < N; j++) {   // Ако имаме съвпадение, то проверяваме с рекурсията дали може да довършим думата			
            if (C[i][j] == word[0]) {
                if (findWord(C, word, i, j, 0)) return true;
            }
        }
    }
    return false;
}

bool crossword(char C[3][3], char words[][10], unsigned countWords) {
    for (size_t i = 0; i < countWords; i++) {
        char currentWord[10];
        size_t j = 0;
        do {
            currentWord[j] = words[i][j];
            j++;
        } while (words[i][j] != '\0');
        currentWord[j] = '\0';
        j = 0; // връщаме брояча на нула, за да може да запишем коректно следващата дума
        if (!matchWord(C, currentWord)) {
            return false;
        }
    }
    return true;
}

int main() {
    char C[3][3] = {'c', 'a', 't',
                    'w', 'h', 'o',
                    'w', 'i', 'n'};
    // с дължина 10, за да има място и за терминиращата нула
    char words[][10] = {"cat",
                        "what",
                        "not"};
    unsigned countWords = sizeof(words) / sizeof(words[0]);

    crossword(C, words, countWords) ? std::cout << "true" : std::cout << "false";
    return 0;
}
