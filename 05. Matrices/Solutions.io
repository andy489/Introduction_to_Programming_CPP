//Task 5.16
#include <iostream>
void scrollArr(double arr[], size_t n)
{
	double temp = arr[0];
	for (size_t i = 0; i < n-1; i++) arr[i] = arr[i + 1];
	arr[n - 1] = temp;
}
void printMatrix(double A[][8], const size_t n)
{
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++) std::cout << A[i][j] << ' ';		
		std::cout << std::endl;
	}
}
int main()
{
	double arr[] = { 1.13,2.16,3.22,4.11,5.09,6.78,7.32,8.13 };
	const size_t len = sizeof(arr) / sizeof(arr[0]);

	double A[len][len];
		
	for (size_t i = 0; i < len; i++)
	{
		for (size_t j = 0; j < len; j++) A[i][j] = arr[j];		
		scrollArr(arr, len);
	}
	printMatrix(A, len);

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.17
#define N 5
#include <iostream>
double maximinj(double A[][N], const size_t n)
{   // a)
	double minj[N];
	size_t c(0);
	double curr = A[0][c];
	for (size_t j = 0; j < n; j++)
	{
		for (size_t i = 0; i < n; i++) if (A[i][j] < curr)	curr = A[i][j];
		minj[c] = curr;
		c++;
		curr = A[0][c];
	}
	double maximinj = minj[0];
	for (size_t i = 0; i < N; i++) if (minj[i] > maximinj) maximinj = minj[i];	
	return maximinj;
}
double maxjmini(double A[][N], const size_t n)
{   // b)
	double mini[N];
	size_t c(0);
	double curr = A[c][0];
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++) if (A[i][j] < curr) curr = A[i][j];		
		mini[c] = curr;
		c++;
		curr = A[c][0];
	}
	double maxjmini = mini[0];
	for (size_t i = 0; i < N; i++) if (mini[i] > maxjmini)	maxjmini = mini[i];	
	return maxjmini;
}
double minimaxj(double A[][N], const size_t n)
{   // c)
	double maxj[N];
	size_t c(0);
	double curr = A[0][c];
	for (size_t j = 0; j < n; j++)
	{
		for (size_t i = 0; i < n; i++) if (A[i][j] > curr)	curr = A[i][j];			
		maxj[c] = curr;
		c++;
		curr = A[0][c];
	}
	double minimaxj = maxj[0];
	for (size_t i = 0; i < N; i++) if (maxj[i] < minimaxj) minimaxj = maxj[i];		
	return minimaxj;
}
double minjmaxi(double A[][N], const size_t n)
{   // d)
	double maxi[N];
	size_t c(0);
	double curr = A[c][0];
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++) if (A[i][j] > curr) curr = A[i][j];
		maxi[c] = curr;
		c++;
		curr = A[c][0];
	}
	double minjmaxi = maxi[0];
	for (size_t i = 0; i < N; i++) if (maxi[i] < minjmaxi)	minjmaxi = maxi[i];
	return minjmaxi;
}
int main()
{
	double A[][5] = {  3, 12,  9,  8, -3,
				      17,  6, -5,-10, 18,
				      22, 31,  9,  0, -6,
				       7, 14,-41,  9,  0,
				     2.5,  9, 99, 16, 54 };	
	std::cout << "max(i)min(j): " << maximinj(A, N) << std::endl;
	std::cout << "max(j)min(i): " << maxjmini(A, N) << std::endl;
	std::cout << "min(i)max(j): " << minimaxj(A, N) << std::endl;
	std::cout << "min(j)max(i): " << minjmaxi(A, N) << std::endl;	   
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.18
#define N 3
#include <iostream>
const double scalarProd(double arr1[], double arr2[], size_t n)
{
	double result = 0;
	for (size_t i = 0; i < n; i++) result += arr1[i] * arr2[i];
	if (result - 1 > -0.00001 && result - 1 < 0.00001) result = 1;
	return result;
}
const bool isOrtonormal(double A[][N], size_t n)
{
	for (size_t i = 0; i < n; i++)
	{
		double* currPtr = A[i];
		for (size_t j = i; j < n; j++) // from j=i, because multiplication is commutative
		{
			if (i != j)
			{
				if (scalarProd(A[i], A[j], n) != 0)	return false;				
			}
			else
			{
				if (scalarProd(A[i], A[j], n) != 1)	return false;				
			}
		}
	}
	return true;
}

int main()
{
	double A[][N] = {       1 / sqrt(2),                0.0,         -1 / sqrt(2),
								2.0 / 3,            1.0 / 3,            2.0 / 3,
					  1 / (3 * sqrt(2)), -4 / (3 * sqrt(2)),  1 / (3 * sqrt(2)) };
		
	isOrtonormal(A, N) ? std::cout << "Ortonormal" : std::cout << "Not ortonormal";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.19
#define N 3
#include <iostream>
const bool isMagicSquare(double A[][N], size_t n)
{
	double sum(0);
	for (size_t i = 0; i < n; i++) sum += A[0][i]; // sum to compare

	double sumRow(0), sumCol(0);
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++)
		{
			sumRow += A[i][j];
			sumCol += A[j][i];
		}
		if (sumRow != sumCol || sumRow != sum || sumCol != sum) return false;
		sumRow = 0; sumCol = 0;
	}
	return true;
}
int main()
{
	double A[][N] = { 3, 8, 1,
					  2, 4, 6,
					  7, 0, 5 };
	isMagicSquare(A, N) ? std::cout << "Magic square!" : std::cout << "Not magic square";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.20
#include <iostream>
#include <cmath>
int numLen(size_t n)
{
	if (n == 0) return 1;
	else return size_t(floor(log10(n))) + 1;
}
void printSpaces(size_t n)
{
	for (size_t i = 1; i <= n; i++)
	{
		std::cout << ' ';
	}
}
void printMatrix1(int** A, size_t rows, size_t cols)
{
	for (size_t i = 0; i < rows; i++)
	{
		for (size_t j = 0; j < cols; j++)
		{
			printSpaces(numLen(rows-1) - numLen(A[i][j]));
			std::cout << A[i][j] << ' ';			
		}
		std::cout << std::endl;
	}
	std::cout << std::endl;
}
void printMatrix2(int** A, size_t rows, size_t cols)
{
	for (size_t i = 0; i < rows; i++)
	{
		for (size_t j = 0; j < cols; j++)
		{
			printSpaces(numLen(rows*cols) - numLen(A[i][j]));
			std::cout << A[i][j] << ' ';
		}
		std::cout << std::endl;
	}
	std::cout << std::endl;
}
void printMatrix3(int** A, size_t rows, size_t cols)
{
	for (size_t i = 0; i < rows; i++)
	{
		for (size_t j = 0; j < cols; j++)
		{
			printSpaces(numLen(rows) - numLen(A[i][j]));
			std::cout << A[i][j] << ' ';
		}
		std::cout << std::endl;
	}
	std::cout << std::endl;
}
int** initializeMatrix(size_t n)
{
	int** matrix = new int*[n];
	for (size_t i = 0; i < n; i++)
	{
		matrix[i] = new int[n];
	}
	return matrix;
}
int**firstMatrix(size_t n)
{ // a)
	int** A = initializeMatrix(n);
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++)
		{
			if (i == j)
			{
				A[i][j] = i;
			}
			else
			{
				A[i][j] = 0;
			}
		}
	}
	return A;
}
int** secondMatrix(size_t n)
{ // b)
	int** B = initializeMatrix(n);
	size_t w = 1;
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++)
		{
			B[i][j] = w++;
		}
	}
	return B;
}
int** thirdMatrix(size_t n)
{ // c)
	int** C = initializeMatrix(n);
	size_t w = 1;
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++)
		{
			C[j][i] = w++;
		}
	}
	return C;
}
int** forthMatrix(size_t n)
{ // d)
	int** D = initializeMatrix(n);
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++)
		{
			if (i <= j)
			{
				D[i][j] = j - i + 1;
			}
			else
			{
				D[i][j] = 0;
			}
		}
	}
	return D;
}
int** fifthMatrix(size_t n)
{ // e)
	int** E = initializeMatrix(n);
	size_t k = 1;
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++)
		{
			if (i % 2 == 0)
			{
				E[j][i] = k;
				k++;
			}
			else
			{
				E[n - j - 1][i] = k;
				k++;
			}
		}
	}
	return E;
}
int** sixthMatrix(size_t n)
{ // f)
	int** F = initializeMatrix(n);

	int w = 1;

	int i;
	int j;

	for (int k = 0; k < (int)n; k++)
	{
		i = k;
		j = 0;

		while (i >= 0)
		{
			F[i][j] = w++;
			i = i - 1;
			j = j + 1;
		}
	}
	for (size_t k = 1; k < n; k++)
	{
		i = n - 1;
		j = k;
		while (j <= (int)n - 1)
		{
			F[i][j] = w++;
			i = i - 1;
			j = j + 1;
		}
	}
	return F;
}
int** seventhMatrix(size_t n)
{ // g)
	int** G = initializeMatrix(n);
	int w = 1;
	size_t i, j;
	for (size_t k = 0; k < n; k++)
	{
		i = n - k - 1;
		j = 0;
		while (i < n)
		{
			G[i][j] = w++;
			i++;
			j++;
		}
	}
	for (size_t k = 1; k < n; k++)
	{
		i = 0;
		j = k;
		while (j < n)
		{
			G[i][j] = w++;
			i++;
			j++;
		}
	}
	return G;
}
int** eighthMatrix(size_t n)
{ // h)
	int** H = initializeMatrix(n);
	int w = 1;
	//  k - starting row index, m - ending row index;
	//	l - starting column index, n - ending column index;
	// In outr case we have square matrix and m=n so let:
	int m = (int)n;
	int k = 0, l = 0;
	while (k < m && l < (int)n)
	{	// Print the first row from the remaining rows 
		for (int i = l; i < (int)n; ++i)
			H[k][i] = w++;
		k++;
		// Print the last column from the remaining columns 
		for (int i = k; i < m; ++i)
			H[i][n - 1] = w++;
		n--;
		// Print the last row from the remaining rows 
		if (k < m)
		{
			for (int i = (int)n - 1; i >= l; --i)
				H[m - 1][i] = w++;
			m--;
		}
		// Print the first column from the remaining columns 
		if (l < (int)n)
		{
			for (int i = m - 1; i >= k; --i)
				H[i][l] = w++;
			l++;
		}
	}
	return H;
}
void releaseMatrix(int** A, size_t rows)
{
	for (size_t i = 0; i < rows; i++)
	{
		delete[] A[i];
	}
	delete[] A;
}
int main()
{
	size_t n;
	std::cout << "Enter order of matrix: ";
	std::cin >> n;

	std::cout << std::endl;

	int** A = firstMatrix(n);
	printMatrix1(A, n, n);
	releaseMatrix(A, n);

	int** B = secondMatrix(n);
	printMatrix2(B, n, n);
	releaseMatrix(B, n);

	int** C = thirdMatrix(n);
	printMatrix2(C, n, n);
	releaseMatrix(C, n);

	int** D = forthMatrix(n);
	printMatrix3(D, n, n);
	releaseMatrix(D, n);

	int** E = fifthMatrix(n);
	printMatrix2(E, n, n);
	releaseMatrix(E, n);

	int** F = sixthMatrix(n);
	printMatrix2(F, n, n);
	releaseMatrix(F, n);

	int** G = seventhMatrix(n);
	printMatrix2(G, n, n);
	releaseMatrix(G, n);

	int** H = eighthMatrix(n);
	printMatrix2(H, n, n);
	releaseMatrix(H, n);

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.21
// hidden
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.22
#define ROWS 5
#define COLS 10
#include <iostream>
template  <typename T>
void print(T M[ROWS][COLS])
{
	for (size_t i = 0; i < ROWS; i++)
	{
		for (size_t j = 0; j < COLS; j++)
		{
			std::cout << M[i][j] << ' ';
		}
		std::cout << std::endl;
	}
	std::cout << std::endl;
}
int isSafe(int M[ROWS][COLS], int row, int col, bool visited[ROWS][COLS])
{	// row number is in range, column number is in range and value is not 0 
	// and not yet visited 
	return (row >= 0) && (row < ROWS) && (col >= 0) && (col < COLS) && (M[row][col] && !visited[row][col]);
}
void DFS(int M[ROWS][COLS], int row, int col, bool visited[ROWS][COLS])
{	// These arrays are used to get 
	// row and column numbers of 8 
	// neighbours of a given cell 
	static int rowNbr[] = { -1, -1, -1, 0, 0, 1, 1, 1 };
	static int colNbr[] = { -1, 0, 1, -1, 1, -1, 0, 1 };

	// Mark this cell as visited 
	visited[row][col] = true;

	// Recur for all connected neighbours 
	for (int k = 0; k < 8; k++)
		if (isSafe(M, row + rowNbr[k], col + colNbr[k], visited))
			DFS(M, row + rowNbr[k], col + colNbr[k], visited);
}
int countIslands(int M[ROWS][COLS])
{
	int count = 0; // Initialize count as 0 and travese through the all cells of given matrix (map)

	bool visited[ROWS][COLS];// Make a bool array to mark visited cells. 
	memset(visited, 0, sizeof(visited));// Initially all cells are unvisited 

	for (int i = 0; i < ROWS; i++)
		for (int j = 0; j < COLS; j++)

			// If a cell with value 1 is not 
			if (M[i][j] && !visited[i][j])
			{
				// Visited yet, then new island found. Visit all cells in this island. 
				DFS(M, i, j, visited); // Depth First Search (DFS)

				// and increment island count 
				count++;
			}
	return count;
}
int main()
{
	int M[ROWS][COLS] = { { 4, 3, 2, 1, 0, 0, 0, 1, 3, 1 },
						  { 3, 2, 1, 0, 0, 1, 0, 0, 1, 0 },
						  { 2, 1, 0, 0, 1, 2, 1, 0, 0, 0 },
						  { 2, 1, 0, 0, 0, 1, 0, 0, 0, 0 },
						  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 1 } }; // Hard-code map
	print(M); //Print the map

	std::cout << countIslands(M);
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.23
/*Algorithm: 
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
void gaussianElimination(double mat[N][N + 1])
{
	/* reduction into r.e.f. */
	int singular_flag = forwardElim(mat);

	/* if matrix is singular */
	if (singular_flag != -1)
	{
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
void swap_row(double mat[N][N + 1], int i, int j)
{
	//printf("Swapped rows %d and %d\n", i, j); 

	for (int k = 0; k <= N; k++)
	{
		double temp = mat[i][k];
		mat[i][k] = mat[j][k];
		mat[j][k] = temp;
	}
}

// function to print matrix content at any stage 
void print(double mat[N][N + 1])
{
	for (int i = 0; i < N; i++, printf("\n"))
		for (int j = 0; j <= N; j++)
		{
			std::cout.setf(std::ios::fixed);
			std::cout.precision(4);
			std::cout << mat[i][j] << ' ';
		}

	std::cout<<std::endl;
}

// function to reduce matrix to r.e.f. 
int forwardElim(double mat[N][N + 1])
{
	for (int k = 0; k < N; k++)
	{
		// Initialize maximum value and index for pivot 
		int i_max = k;
		int v_max = (int)mat[i_max][k];

		/* find greater amplitude for pivot if any */
		for (int i = k + 1; i < N; i++)
			if (abs(mat[i][k]) > v_max)
				v_max = (int)mat[i][k], i_max = i;

		/* if a prinicipal diagonal element  is zero,
		 * it denotes that matrix is singular, and
		 * will lead to a division-by-zero later. */
		if (!mat[i_max][k])
			return k; // Matrix is singular 

		/* Swap the greatest value row with current row */
		if (i_max != k)
			swap_row(mat, k, i_max);


		for (int i = k + 1; i < N; i++)
		{
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
void backSub(double mat[N][N + 1])
{
	double x[N];  // An array to store solution 

	/* Start calculating from last equation up to the
	   first */
	for (int i = N - 1; i >= 0; i--)
	{
		/* start with the RHS of the equation */
		x[i] = mat[i][N];

		/* Initialize j to i+1 since matrix is upper
		   triangular*/
		for (int j = i + 1; j < N; j++)
		{
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
	for (int i = 0; i < N; i++)
	{
		std::cout.setf(std::ios::fixed);
		std::cout.precision(4);
		std::cout << x[i] << std::endl;
	}
}

int main()
{
	/* input matrix */
	double mat[N][N + 1] = { {1.0, 0.0,2.0, 2.0},
				 {5.0, 2.0, 2.0, 2.0},
				 {3.0, -1.0, 4.0, 1.0}
	};

	gaussianElimination(mat);

	return 0;
}
