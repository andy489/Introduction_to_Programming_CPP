#include <iostream>

const int MAX = 100;

char labyrinth[MAX][MAX] = {
        "*$** ",
        "* $  ",
        "$*** ",
        "*    ",
        "  **$"
};

const int WIDTH = 5;
const int HEIGHT = 5;

void printPoint(char const *text, int x, int y) {
    std::cout << text << " (" << x << ',' << y << ")\n";
}

void printLabyrinth() {
    for (int i = 0; i < HEIGHT; i++) {
        std::cout << labyrinth[i] << std::endl;
    }
}

int findAllTreasures(int x, int y) {
    printPoint("We try to step at", x, y);
    if (x < 0 || y < 0 || x >= HEIGHT || y >= WIDTH || labyrinth[x][y] == '*') {
        printPoint("We cannot step at", x, y);
        return 0;
    }
    if (labyrinth[x][y] == '"') {
        printPoint("We have already been at", x, y);
        return 0;
    }
    int foundTreasures = 0;
    if (labyrinth[x][y] == '$') {
        printPoint("We found treasure at", x, y);
        foundTreasures = 1;
    }
    // 0 <= x < HEIGHT && 0 <= y < WIDTH && labyrinth[x][y] == ' '
    printPoint("We step at", x, y);
    labyrinth[x][y] = '"';
    foundTreasures += findAllTreasures(x - 1, y);//north	
    foundTreasures += findAllTreasures(x, y + 1);//east
    foundTreasures += findAllTreasures(x + 1, y);//south
    foundTreasures += findAllTreasures(x, y - 1);//west
    printPoint("We stepping back from", x, y);
    labyrinth[x][y] = 'X';
    return foundTreasures;
}

int main() {
    printLabyrinth();
    std::cout << findAllTreasures(4, 1) << std::endl;
    printLabyrinth();
    return 0;
}
