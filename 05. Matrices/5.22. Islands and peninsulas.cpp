// github.com/andy489

#define ROWS 5
#define COLS 10

#include <iostream>

template<typename T>
void print(T M[ROWS][COLS]) {
    for (size_t i = 0; i < ROWS; i++) {
        for (size_t j = 0; j < COLS; j++) {
            std::cout << M[i][j] << ' ';
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;
}

int isSafe(int M[ROWS][COLS], int row, int col,
           bool visited[ROWS][COLS]) {    // row number is in range, column number is in range and value is not 0 
    // and not yet visited 
    return (row >= 0) && (row < ROWS) && (col >= 0) && (col < COLS) && (M[row][col] && !visited[row][col]);
}

void DFS(int M[ROWS][COLS], int row, int col, bool visited[ROWS][COLS]) {    // These arrays are used to get 
    // row and column numbers of 8 
    // neighbours of a given cell 
    static int rowNbr[] = {-1, -1, -1, 0, 0, 1, 1, 1};
    static int colNbr[] = {-1, 0, 1, -1, 1, -1, 0, 1};

    // Mark this cell as visited 
    visited[row][col] = true;

    // Recur for all connected neighbours 
    for (int k = 0; k < 8; k++)
        if (isSafe(M, row + rowNbr[k], col + colNbr[k], visited))
            DFS(M, row + rowNbr[k], col + colNbr[k], visited);
}

int countIslands(int M[ROWS][COLS]) {
    int count = 0; // Initialize count as 0 and travese through the all cells of given matrix (map)

    bool visited[ROWS][COLS];// Make a bool array to mark visited cells. 
    memset(visited, 0, sizeof(visited));// Initially all cells are unvisited 

    for (int i = 0; i < ROWS; i++)
        for (int j = 0; j < COLS; j++)

            // If a cell with value 1 is not 
            if (M[i][j] && !visited[i][j]) {
                // Visited yet, then new island found. Visit all cells in this island. 
                DFS(M, i, j, visited); // Depth First Search (DFS)

                // and increment island count 
                count++;
            }
    return count;
}

int main() {
    int M[ROWS][COLS] = {{4, 3, 2, 1, 0, 0, 0, 1, 3, 1},
                         {3, 2, 1, 0, 0, 1, 0, 0, 1, 0},
                         {2, 1, 0, 0, 1, 2, 1, 0, 0, 0},
                         {2, 1, 0, 0, 0, 1, 0, 0, 0, 0},
                         {1, 0, 0, 0, 0, 0, 0, 0, 0, 1}}; // Hard-code map
    print(M); //Print the map

    std::cout << countIslands(M);
    return 0;
}
