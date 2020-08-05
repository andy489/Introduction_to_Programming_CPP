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

bool findTreasure(int x, int y) {
    printPoint("We try to step at", x, y);
    if (x < 0 || y < 0 || x >= HEIGHT || y >= WIDTH || labyrinth[x][y] == '*') {
        printPoint("We cannot step at", x, y);
        return false;
    }
    if (labyrinth[x][y] == '"') {
        printPoint("We have already been at", x, y);
        return false;
    }
    if (labyrinth[x][y] == '$') {
        printPoint("We found treasure at", x, y);
        return true;
    }
    // 0 <= x < HEIGHT && 0 <= WIDTH && labyrinth[x][y] == ' '
    printPoint("We step at", x, y);
    labyrinth[x][y] = '"';
    //north
    if (findTreasure(x - 1, y)) {
        printPoint("The journey goes through", x - 1, y);
        return true;
    }
    //east
    if (findTreasure(x, y + 1)) {
        printPoint("The journey goes through", x, y + 1);
        return true;
    }
    //south
    if (findTreasure(x + 1, y)) {
        printPoint("The journey goes through", x + 1, y);
        return true;
    }
    //west
    if (findTreasure(x, y - 1)) {
        printPoint("The journey goes through", x, y - 1);
        return true;
    }
    printPoint("We are stepping back from", x, y);
    labyrinth[x][y] = 'X';
    return false;
}

int main() {
    printLabyrinth();
    std::cout << findTreasure(4, 1) << std::endl;
    printLabyrinth();
    return 0;
}
