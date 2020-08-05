// github.com/andy489

/* Algorithm: 
1. Partial pivoting: Find the kth pivot by swapping rows, to move the entry with the largest absolute value 
	to the pivot position. This imparts computational stability to the algorithm.
2. For each row below the pivot, calculate the factor f which makes the kth entry zero, and for every element 
	in the row subtract the fth multiple of the corresponding element in the kth row.
3. Repeat above steps for each unknown. We will be left with a partial r.e.f. matrix. */

// C++ program to demostrate working of Guassian Elimination method 
#include<iostream>

#define N 3        // Number of unknowns 

// function to reduce matrix to r.e.f.  Returns a value to  
// indicate whether matrix is singular or not 
int forwardElim(double mat[N][N + 1]);

// function to calculate the values of the unknowns 
void backSub(double mat[N][N + 1]);

// function to get matrix content 
void gaussianElimination(double mat[N][N + 1]) {
    /* reduction into r.e.f. */
    int singular_flag = forwardElim(mat);

    /* if matrix is singular */
    if (singular_flag != -1) {
        printf("Singular Matrix.\n");

        /* if the RHS of equation corresponding to
           zero row  is 0, * system has infinitely
           many solutions, else inconsistent*/
        if (mat[singular_flag][N])
            printf("Inconsistent System.");
        else
            printf("May have infinitely many "
                   "solutions.");

        return;
    }

    /* get solution to system and print it using
       backward substitution */
    backSub(mat);
}

// function for elementary operation of swapping two rows 
void swap_row(double mat[N][N + 1], int i, int j) {
    //printf("Swapped rows %d and %d\n", i, j); 

    for (int k = 0; k <= N; k++) {
        double temp = mat[i][k];
        mat[i][k] = mat[j][k];
        mat[j][k] = temp;
    }
}

// function to print matrix content at any stage 
void print(double mat[N][N + 1]) {
    for (int i = 0; i < N; i++, printf("\n"))
        for (int j = 0; j <= N; j++) {
            std::cout.setf(std::ios::fixed);
            std::cout.precision(4);
            std::cout << mat[i][j] << ' ';
        }

    std::cout << std::endl;
}

// function to reduce matrix to r.e.f. 
int forwardElim(double mat[N][N + 1]) {
    for (int k = 0; k < N; k++) {
        // Initialize maximum value and index for pivot 
        int i_max = k;
        int v_max = (int) mat[i_max][k];

        /* find greater amplitude for pivot if any */
        for (int i = k + 1; i < N; i++)
            if (abs(mat[i][k]) > v_max)
                v_max = (int) mat[i][k], i_max = i;

        /* if a prinicipal diagonal element  is zero,
         * it denotes that matrix is singular, and
         * will lead to a division-by-zero later. */
        if (!mat[i_max][k])
            return k; // Matrix is singular 

        /* Swap the greatest value row with current row */
        if (i_max != k)
            swap_row(mat, k, i_max);


        for (int i = k + 1; i < N; i++) {
            /* factor f to set current row kth element to 0,
             * and subsequently remaining kth column to 0 */
            double f = mat[i][k] / mat[k][k];

            /* subtract fth multiple of corresponding kth
               row element*/
            for (int j = k + 1; j <= N; j++)
                mat[i][j] -= mat[k][j] * f;

            /* filling lower triangular matrix with zeros*/
            mat[i][k] = 0;
        }

        //print(mat);        //for matrix state 
    }
    //print(mat);            //for matrix state 
    return -1;
}

// function to calculate the values of the unknowns 
void backSub(double mat[N][N + 1]) {
    double x[N];  // An array to store solution 

    /* Start calculating from last equation up to the
       first */
    for (int i = N - 1; i >= 0; i--) {
        /* start with the RHS of the equation */
        x[i] = mat[i][N];

        /* Initialize j to i+1 since matrix is upper
           triangular*/
        for (int j = i + 1; j < N; j++) {
            /* subtract all the lhs values
             * except the coefficient of the variable
             * whose value is being calculated */
            x[i] -= mat[i][j] * x[j];
        }

        /* divide the RHS by the coefficient of the
           unknown being calculated */
        x[i] = x[i] / mat[i][i];
    }

    printf("Solution for the system:\n");
    for (int i = 0; i < N; i++) {
        std::cout.setf(std::ios::fixed);
        std::cout.precision(4);
        std::cout << x[i] << std::endl;
    }
}

int main() {
    /* input matrix */
    double mat[N][N + 1] = {{1.0, 0.0,  2.0, 2.0},
                            {5.0, 2.0,  2.0, 2.0},
                            {3.0, -1.0, 4.0, 1.0}
    };

    gaussianElimination(mat);

    return 0;
}
