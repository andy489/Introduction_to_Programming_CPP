//Task 5.01
#include <iostream>
#include <vector>
int main()
{
	size_t R, C; std::cin >> R >> C;
	std::vector<std::vector<int>> matrix(R);
	for (size_t i = 0; i < R; i++)
	{
		matrix[i] = std::vector<int>(C);
	}

	for (size_t i = 0; i < R; i++)
	{
		for (size_t j = 0; j < C; j++)
		{
			std::cin >> matrix[i][j];
		}
	}

	int searchedNum; std::cin >> searchedNum;
	bool flag = false;
	for (size_t i = 0; i < R; i++)
	{
		for (size_t j = 0; j < C; j++)
		{
			if (matrix[i][j]==searchedNum)
			{
				flag = true;
				std::cout << i << ' ' << j << '\n';
			}
		}		
	}
	if (!flag)
	{
		std::cout << "not found\n";
	}
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.02
#include <iostream>
#include <vector>
#include <sstream>

std::vector<std::vector<int>> inputMatrix(size_t R)
{	
	std::vector<std::vector<int>> matrix(R);
	for (size_t i = 0; i < R; i++)
	{
		std::string line; getline(std::cin, line);
		std::istringstream istr(line);
		while (istr)
		{
			int element; istr >> element;
			matrix[i].push_back(element);
		}
	}
	return matrix;
}

bool cmpMat(const std::vector<std::vector<int>>& firstMat, size_t R1,
	const std::vector<std::vector<int>>& secMat, size_t R2)
{
	if (R1 != R2) return false;
	else
	{
		for (size_t i = 0; i < R1; i++)
		{
			size_t C1 = firstMat[i].size(); 
			size_t C2 = secMat[i].size();
			if (C1 != C2) return false;
			for (size_t j = 0; j < C1; j++)
			{
				if (firstMat[i][j]!=secMat[i][j])
				{
					return false;
				}
			}
		}
	}
	return true;
}

int main()
{
	size_t R1;std::cin >> R1; std::cin.ignore();
	std::vector<std::vector<int>> firstMat = inputMatrix(R1);
	size_t R2;std::cin >> R2; std::cin.ignore();
	std::vector<std::vector<int>> secMat = inputMatrix(R2);

	cmpMat(firstMat, R1, secMat, R2) ? std::cout << "equal\n" : std::cout << "not equal\n";
	
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.03
#define ROWS 6
#define COLUMNS 6
#include <iostream>
int main()
{
	int A[ROWS][COLUMNS] = {
		2,   3,  -4,  12,  5,  45,
		3,   9,   2,   8, -1,  16,
	       44, -12,  -4,  44, 23,   1,
		3,  23,  45,   0, 19,   8,
		0,  -3, -14, -44, 12,   6,
		2,   4,  90,   4,  5, -10
	};
	for (size_t i = 1; i < ROWS - 1; i++)
	{
		for (size_t j = 1; j < COLUMNS - 1; j++)
		{
			if (A[i][j] < A[i - 1][j] && A[i][j] < A[i + 1][j] && A[i][j] < A[i][j + 1] && A[i][j] < A[i][j - 1])
				std::cout << A[i][j] << ' ';
		}
	}
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.04
#include <iostream>
int** inputMatrix(size_t& rows, size_t& cols)
{
	std::cin >> rows >> cols;

	int** matrix = new int*[rows];
	for (size_t i = 0; i < rows; i++)
	{
		matrix[i] = new int[cols];
	}
	for (size_t i = 0; i < rows; i++)
	{
		for (size_t j = 0; j < cols; j++)
		{
			std::cin >> matrix[i][j];
		}
	}
	return matrix;
}
void printRowsWithAtLeastOneNegativeElement(int** matrix, size_t rows, size_t cols)
{
	std::cout << "Numbers of rows with at least one negative element:\n";
	for (size_t i = 0; i < rows; i++)
	{
		for (size_t j = 0; j < cols; j++)
		{
			if (matrix[i][j] < 0)
			{
				std::cout << i + 1 << std::endl;
				break;
			}
		}
	}
}
void releaseMatrix(int** matrix, size_t rows)
{
	for (size_t i = 0; i < rows; i++)
	{
		delete[] matrix[i];
	}
	delete[] matrix;
}
int main()
{
	size_t rows, cols;
	int** matrix = inputMatrix(rows, cols);
	printRowsWithAtLeastOneNegativeElement(matrix, rows, cols);
	releaseMatrix(matrix, rows);
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.05
#include <iostream>
double** inputMatrix(size_t n)
{ // a)
	double** matrix = new double*[n];
	for (size_t i = 0; i < n; i++)
	{
		matrix[i] = new double[n];
	}
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++)
		{
			std::cin >> matrix[i][j];
		}
	}
	return matrix;
}
double* constructVec(double** matrix, size_t n)
{ // b)
	double* vec = new double[n*n];
	size_t k = 0;
	for (size_t j = 0; j < n; j++)
	{
		for (size_t i = 0; i < n; i++)
		{
			vec[k] = matrix[i][j];
			k++;
		}
	}
	return vec;
}
void sortVec(double* arr, size_t len)
{ // c)
	for (size_t i = 0; i < len - 1; i++)
	{
		size_t p;
		double min;
		p = i; min = arr[i];
		size_t j = i + 1;
		do
		{
			if (arr[j] < min)
			{
				min = arr[j];
				p = j;
			}
			j++;
		} while (j < len);
		std::swap(arr[p], arr[i]);
	}
}
double** constructMatrix(double* vec, size_t n)
{ // d)
	double** matrix = new double*[n];
	for (size_t i = 0; i < n; i++)
	{
		matrix[i] = new double[n];
	}
	size_t k = 0;
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++)
		{
			matrix[i][j] = vec[k];
			k++;
		}
	}
	return matrix;
}
void printVec(double* arr, size_t len)
{
	for (size_t i = 0; i < len; i++)
	{
		std::cout << arr[i] << ' ';
	}
	std::cout << std::endl;
}
void printMatrix(double** matrix, size_t n)
{ // e)
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++)
		{
			std::cout << matrix[i][j] << ' ';
		}
		std::cout << std::endl;
	}
}
void releaseMatrix(double** matrix, size_t rows)
{
	for (size_t i = 0; i < rows; i++)
	{
		delete[] matrix[i];
	}
	delete[] matrix;
}
int main()
{
	size_t n;
	std::cin >> n;
	double** A = inputMatrix(n);
	double* vec = constructVec(A, n);
	sortVec(vec, n*n);
	// printVec(vec, n*n);
	double** B = constructMatrix(vec, n);
	
	printMatrix(B, n);

	releaseMatrix(B, n);
	delete[] vec;
	releaseMatrix(A, n);

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.06
#define n 4
#include <iostream>
int** inputMatrix(size_t m)
{
	int** matrix = new int*[m];
	for (size_t i = 0; i < m; i++)
	{
		matrix[i] = new int[m];
	}
	for (size_t i = 0; i < m; i++)
	{
		for (size_t j = 0; j < m; j++)
		{
			matrix[i][j] = j + 1;
		}
	}
	return matrix;
}
void printMatrix(int** matrix, size_t m)
{
	for (size_t i = 0; i < m; i++)
	{
		for (size_t j = 0; j < m; j++)
		{
			std::cout << matrix[i][j] << ' ';
		}
		std::cout << std::endl;
	}
}
void releaseMatrix(int** A, size_t m)
{
	for (size_t i = 0; i < m; i++)
	{
		delete[] A[i];
	}
	delete[] A;
}
int sumOverMainDiagonal(int** A, size_t m)
{ // a)
	int sum = 0;
	for (size_t i = 0; i < m; i++)
	{
		for (size_t j = 0; j < m; j++)
		{
			if (i < j)
			{
				sum += A[i][j];
			}
		}
	}
	return sum;
}
int prodUnderMainDiagonal(int**A, size_t m)
{ // b)
	int prod = 1;
	for (size_t i = 0; i < m; i++)
	{
		for (size_t j = 0; j < m; j++)
		{
			if (i > j)
			{
				prod *= A[i][j];
			}
		}
	}
	return prod;
}
int positiveElementsFromMainDiag(int**A, size_t m)
{ // c)
	int sum = 0;
	for (size_t i = 0; i < m; i++)
	{
		if (A[i][i] > 0)
		{
			sum += A[i][i];
		}
	}
	return sum;
}
int productElementsFromSecDiag(int**A, size_t m)
{ // d)
	int prod = 1;
	for (size_t i = 0; i < m; i++)
	{
		prod *= A[i][m - i-1];
	}
	return prod;
}
int sumElementsOutOfSecDiag(int**A, size_t m)
{ // e)
	int sum = 0;
	for (size_t i = 0; i < m; i++)
	{
		for (size_t j = 0; j < m; j++)
		{
			if (i!=j)
			{
				sum += A[i][j];
			}
		}
	}
	return sum;
}
int main()
{
	int** A = inputMatrix(n);
	printMatrix(A, n);

	int sum = sumOverMainDiagonal(A, n);
	std::cout << "Sum of elements under the main diagonal is: " << sum << "\n";

	int prod = prodUnderMainDiagonal(A, n);
	std::cout << "Prod of elements under the main diagonal is: " << prod << "\n";

	int sumPosDiag = positiveElementsFromMainDiag(A, n);
	std::cout << "Sum of positive elements from the main diagonal is: " << sumPosDiag << "\n";

	int prodSecDiag = productElementsFromSecDiag(A, n);
	std::cout << "Product of elements from the second diagonal is: " << prodSecDiag << "\n";

	int sumOutSecDiag = sumElementsOutOfSecDiag(A, n);
	std::cout << "Sum of elements out of the second diagonal is: " << sumOutSecDiag << "\n";


	releaseMatrix(A, n);

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.07
#include <iostream>
int** inputMatrix(size_t rows, size_t cols)
{
	int** matrix = new int*[rows];
	for (size_t i = 0; i < rows; i++)
	{
		matrix[i] = new int[cols];
	}
	for (size_t i = 0; i < rows; i++)
	{
		for (size_t j = 0; j < cols; j++)
		{
			matrix[i][j] = j + 1;
		}
	}
	return matrix;
}
void releaseMatrix(int** A, size_t m)
{
	for (size_t i = 0; i < m; i++)
	{
		delete[] A[i];
	}
	delete[] A;
}

void printMatrix(int** matrix, size_t rows, size_t cols)
{
	for (size_t i = 0; i < rows; i++)
	{
		for (size_t j = 0; j < cols; j++)
		{
			std::cout << matrix[i][j] << ' ';
		}
		std::cout << std::endl;
	}
}
int** eraseCol(int** A, size_t rows, size_t cols, size_t k)
{
	if (k >= 1 && k < cols+1)
	{
		int** B = new int*[rows];
		for (size_t i = 0; i < rows; i++)
		{
			B[i] = new int[cols - 1];
		}
		for (size_t i = 0; i < rows; i++)
		{
			for (size_t j = 0; j < cols-1; j++)
			{
				if (j >= k-1)
				{
					B[i][j] = A[i][j + 1];
				}
				else
				{
					B[i][j] = A[i][j];
				}
			}
		}
		return B;
	}
	return A;
}

int main()
{
	size_t rows, cols, k;
	std::cout << "Matrix rows: ";
	std::cin >> rows;
	std::cout << "Matrix cols: ";
	std::cin >> cols;
	std::cout << "Erase col: ";
	std::cin >> k;

	int**A = inputMatrix(rows, cols);
	std::cout << "Matrix:\n";
	printMatrix(A, rows, cols);

	int**B = eraseCol(A, rows, cols, k);
	std::cout << "Matrix after erasing the " << k << "-th column:\n";
	if ((k >= 1 && k <= cols))
	{
		printMatrix(B, rows, cols - 1);
		releaseMatrix(B, rows);
	}
	else
	{
		printMatrix(B, rows, cols);
		releaseMatrix(A, rows);
	}
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.08
#define n 5
#include <iostream>
double sumSquaresSpecEl(double A[][n], size_t m)
{
	double sum = 0;
	for (size_t i = 1; i < m - 1; i++)
	{
		for (size_t j = 1; j < m - 1; j++)
		{
			if (A[i][j] >= (A[i - 1][j] + A[i][j - 1] + A[i][j + 1] + A[i + 1][j]) / 4.0) sum += A[i][j] * A[i][j];
		}
	}
	return sum;
}
int main()
{
	double A[n][n] = { 2.5, 4.1, 10.1, -9  , -21,
			   7  ,-2.2, -1  ,  0  ,  3,
		          14  , 0.6,  8  ,  5.9,  1.2,
		          17  ,18  ,  0.3, 14  ,  1.9,
		           0  , 0.7,  7  ,  9  , 17 };
	double sum = sumSquaresSpecEl(A, n);
	std::cout << "The sum of squares of all special elements is: " << sum << "\n";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.09
#include <iostream>
int** inputPairs(size_t n)
{
	int** M = new int*[n];
	for (size_t i = 0; i < n; i++)
	{
		M[i] = new int[2];
	}
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < 2; j++)
		{
			std::cin >> M[i][j];
		}
	}
	return M;
}
bool isFunc(int**M, size_t n)
{
	bool isFunc = true;

	for (size_t i = 0; i < n - 1; i++)
	{
		int currEl = M[i][0];
		for (size_t j = i + 1; j < n; j++)
		{
			if (currEl == M[j][0])
			{
				if (M[i][1] != M[j][1])
				{
					isFunc = false;
				}
			}
		}
	}
	return isFunc;
}
void releasePairs(int**M, size_t n)
{
	for (size_t i = 0; i < n; i++)
	{
		delete[] M[i];
	}
	delete[] M;
}
int main()
{
	size_t n;
	std::cout << "Enter number of ordered pairs (argument and value of function): ";
	std::cin >> n;
	
	int** M = inputPairs(n);	
		
	isFunc(M,n) ? (std::cout << "The set is function") : (std::cout << "The set is not function");

	releasePairs(M, n);

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.10
#include <iostream>
int* inputVector(size_t k)
{
	int* newVec = new int[k];
	for (size_t i = 0; i < k; i++)
		std::cin >> newVec[i];

	return newVec;
}
int** inputMatrix(size_t n, size_t m)
{
	int** matrix = new int*[n];
	for (size_t i = 0; i < n; i++)
		matrix[i] = new int[m];

	for (size_t rows = 0; rows < n; rows++)
		for (size_t cols = 0; cols < m; cols++)
			std::cin >> matrix[rows][cols];

	return matrix;
}
void releaseMatrix(int** matrix, size_t n)
{
	for (size_t i = 0; i < n; i++)
		delete[] matrix[i];
	delete[] matrix;
}
int** sumMatrix(int** A, size_t n1, size_t m1, int** B, size_t n2, size_t m2)
{ // a)
	int** sum = new int*[n1];
	for (size_t i = 0; i < n1; i++)
		sum[i] = new int[m1];

	for (size_t i = 0; i < n1; i++)
		for (size_t j = 0; j < m1; j++)
			sum[i][j] = A[i][j] + B[i][j];

	return sum;
}
int* prodMatrixVector(int** A, size_t n, size_t m, int* arr, size_t k)
{ // b)
	int* resultVec = new int[k];
	for (size_t i = 0; i < k; i++)
		resultVec[i] = 0;

	for (size_t i = 0; i < n; i++)
		for (size_t j = 0; j < m; j++)
			resultVec[i] += A[i][j] * arr[j];

	return resultVec;
}
int** multMatrix(int** A, size_t n1, size_t m1, int**B, size_t n2, size_t m2)
{ // c)
	int** mult = new int*[n1];
	for (size_t i = 0; i < n1; i++)
		mult[i] = new  int[m2];

	for (size_t i = 0; i < n1; i++)
		for (size_t j = 0; j < m2; j++)
			mult[i][j] = 0;

	for (size_t i = 0; i < n1; i++)
		for (size_t j = 0; j < m2; j++)
			for (size_t k = 0; k < m1; k++)
				mult[i][j] += A[i][k] * B[k][j];

	return mult;
}
int** transposeMatrix(int** A, size_t n1, size_t m1)
{ // d)
	int** tMatrix = new int*[m1];
	for (size_t i = 0; i < m1; i++)
	{
		tMatrix[i] = new int[n1];
	}
	for (size_t i = 0; i < m1; i++)
	{
		for (size_t j = 0; j < n1; j++)
		{
			tMatrix[i][j] = A[j][i];
		}
	}
	return tMatrix;
}
void printVec(int* arr, size_t n)
{
	for (size_t i = 0; i < n; i++)
		std::cout << arr[i] << ' ';

	std::cout << std::endl;
}
void printMatrix(int** matrix, size_t n, size_t m)
{
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < m; j++)
			std::cout << matrix[i][j] << ' ';
		std::cout << std::endl;
	}
}
int main()
{
	size_t n1, m1, n2, m2, k;
	std::cout << "Rows A: ";
	std::cin >> n1;
	std::cout << "Cols A: ";
	std::cin >> m1;
	std::cout << "Rows B: ";
	std::cin >> n2;
	std::cout << "Cols B: ";
	std::cin >> m2;

	std::cout << "Vector length: ";
	std::cin >> k;

	std::cout << "Enter matrix A:\n";
	int** A = inputMatrix(n1, m1);
	std::cout << "Enter matrix B:\n";
	int** B = inputMatrix(n2, m2);
	std::cout << "Enter vector V:\n";
	int* vec = inputVector(k);

	std::cout << "Command menu:\nA - Add\nV - multiply matrix by vector\n";
	std::cout << "M - multiply matrices\nT - transpose matrix\n";

	while (true)
	{
		char command;
		std::cout << "Command: ";
		std::cin >> command;
		switch (command)
		{
		case 'Q':
		{
			return 0;
		}
		case 'A':
		{
			if (n1 != n2 || m1 != m2)
			{
				std::cout << "Cannot add matrices of different sizes.\n";
			}
			else
			{
				std::cout << "Sum of matrices A and B:\n";
				int** sum = sumMatrix(A, n1, m1, B, n2, m2);
				printMatrix(sum, n1, m2);
				releaseMatrix(sum, n1);
			}
			break;
		}
		case 'V':
		{
			if (m1 != k)
			{
				std::cout << "Error! Size of column not equal to size of vector\n";
			}
			else
			{
				std::cout << "Product of matrix A and vector V:\n";
				int* resultVec = prodMatrixVector(A, n1, m1, vec, k);
				printVec(resultVec, k);
				delete[] resultVec;
			}
			break;
		}
		case 'M':
		{
			if (m1 != n2)
			{
				std::cout << "Error! Column of first matrix not equal to row of second.\n";
			}
			else
			{
				std::cout << "Multiplication of matrices A and B:\n";
				int** result = multMatrix(A, n1, m1, B, n2, m2);
				printMatrix(result, n1, m2);
				releaseMatrix(result, n2);
			}
			break;
		}
		case 'T':
		{
			std::cout << "Transpose matrix A:\n";
			int** tMatrix = transposeMatrix(A, n1, m1);
			printMatrix(tMatrix, m1, n1);
			releaseMatrix(tMatrix, m1);
			break;
		}
		case ' ':
		case '\n':
		{
			break;
		}
		default:
		{
			std::cout << "invalid command" << std::endl;
		}
		}
	}
	releaseMatrix(A, n1);
	releaseMatrix(B, n2);
	delete[] vec;

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.11
#define N 5
#include <iostream>
void countAppearances(int A[N][N], size_t n, bool(&appearances)[N][N])
{
	for (size_t i = 0; i < n; i++)
	{
		size_t j = 0;
	S:for (j; j < n; j++)
	{
		if (!appearances[i][j]) // optimization
		{
			int curr = A[i][j];
			for (size_t k = 0; k < n; k++)
			{
				for (size_t l = 0; l < n; l++)
				{
					if (curr == A[k][l] && (i != k && j != l))
					{
						appearances[i][j]=true;
						if (appearances[i][j] == true)
						{
							appearances[k][l] = true; // optimization
							j++;
							goto S;
						}
					}
				}
			}
		}
	}
	}
}
template <typename T>
void printM(T M[N][N], size_t n)
{
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++)
		{
			std::cout << M[i][j] << ' ';
		}
		std::cout << std::endl;
	}
}
int main()
{
	int A[N][N] = { 2,  4, 10, -9, -2,
					22, -2, 10, 10,  3,
				   14,  0,  8,  5,  2,
				   17, 18,  0, 14,  9,
					0,  0,  7,  9, 17 };
	bool appearances[N][N]; // Make a size_t array to check is an element apears more than once 
	memset(appearances, 0, sizeof(appearances));
	countAppearances(A, N, appearances);
	printM(appearances, N);
	int maxNum = A[0][0];
	for (size_t i = 0; i < N; i++)
	{
		for (size_t j = 0; j < N; j++)
		{
			if (appearances[i][j] == 1)
			{
				if (maxNum < A[i][j])
				{
					maxNum = A[i][j];
				}
			}
		}
	}
	std::cout << maxNum;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.12 first approach
#include <iostream>
bool isSubset(int* set1, int* set2, const size_t rows)
{
	for (size_t i = 0; i < rows; i++)
	{
		double curr = set2[i];
		for (size_t j = 0; j < rows; j++)
		{
			if (curr == set1[j]) break;
			if (j == rows - 1) return false;
		}
	}
	return true;
}
int main()
{
	const size_t rows = 5;
	const size_t cols = 6;
	int  matrix[][cols] = { 1,2,3,3,5,1,
							2,3,4,2,6,1,
							2,5,5,1,2,3,
							2,3,5,1,3,1,
							3,4,2,1,8,2 };
	for (size_t i = 0; i < cols; i++)
	{
		std::cout << "alike column numbers to column " << i + 1 << " are: ";
		int currSet[rows];
		for (size_t j = 0; j < rows; j++) currSet[j] = matrix[j][i]; //fill the current column to an array
		bool count(0);
		for (size_t k = 0; k < cols; k++)
		{
			int setToCheck[rows];
			for (size_t l = 0; l < rows; l++) setToCheck[l] = matrix[l][k]; // fill the column to an array to compare			
			if (i != k && isSubset(currSet, setToCheck, rows) && isSubset(setToCheck, currSet, rows))
			{
				std::cout << k + 1 << ' ';
				count=true;
			}
		}
		if (!count) std::cout << "this column is unique!";		
		count = 0;
		std::cout << std::endl;
	}
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.12 second approach
#include <iostream>
void findSimilarRows(int** matrix, size_t rows);
bool isSubset(int** matrix, size_t firstColumn, size_t secondColumn, size_t rows);
bool isContained(int **matrix, size_t column, size_t searchedElement, size_t rows);

int main()
{
	std::cout << "Enter number of rows and columns: ";
	size_t rows;
	std::cin >> rows;

	std::cout << "Enter the elements of the matrix: " << std::endl;
	int** matrix = new int*[rows];

	// matrix allocation and initialization
	for (size_t i = 0; i < rows; i++)
	{
		matrix[i] = new int[rows];
		for (size_t j = 0; j < rows; j++) std::cin >> matrix[i][j];
	}
	std::cout << std::endl;

	//print matrix
	std::cout << "The matrix is: " << std::endl;
	for (size_t i = 0; i < rows; i++)
	{
		for (size_t j = 0; j < rows; j++) std::cout << matrix[i][j] << " ";		
		std::cout << std::endl;
	}
	std::cout << std::endl;

	findSimilarRows(matrix, rows);

	// deleting matrix
	for (size_t i = 0; i < rows; i++) delete[] matrix[i];	
	delete[] matrix;

	return 0;
}
// checks if two columns are similar
void findSimilarRows(int** matrix, size_t rows)
{
	bool areSimilarColumns = false;

	for (size_t i = 0; i < rows; i++)
	{
		for (size_t j = i + 1; j < rows; j++)
		{
			if (isSubset(matrix, i, j, rows) && isSubset(matrix, i, j, rows))
			{
				std::cout << "Columns " << i << " and " << j << " are similar" << std::endl;
				areSimilarColumns = true;
			}
		}
	}
	if (!areSimilarColumns) std::cout << "There are no similar columns" << std::endl;
}
// checks if the elements of secondColumn are contained in firstColumn
bool isSubset(int** matrix, size_t firstColumn, size_t secondColumn, size_t rows)
{
	for (size_t i = 0; i < rows; i++)
	{
		if (!isContained(matrix, firstColumn, matrix[i][secondColumn], rows)) return false;		
	}
	return true;
}
// checks if searchedElement is contained in the column
bool isContained(int **matrix, size_t column, size_t searchedElement, size_t rows)
{
	for (size_t i = 0; i < rows; i++)
	{
		if (matrix[i][column] == searchedElement) return true;		
	}
	return false;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.13 & 5.14
#define M 5
#include <iostream>
int main()
{
	int A[][M] = {  10, 11, 12, 44, 19,
					17, 12, 33, 11, 20,
				    66, 33, 94, 83, 35,
				    13, 23, 19, 15, 33,
				    22, 10, 23, 11, 17 };
	size_t N = sizeof(A) / sizeof(A[0][0])/M;
	
	for (size_t i = 0; i < N; i++)
	{
		int max = A[0][i];
		size_t col(0);
		for (size_t j = 0; j < M; j++)
		{
			if (A[j][i] > max)
			{
				max = A[j][i];
				col = j;
			}
		}
		bool saddle = true;
		int min = A[col][i];
		for (size_t k = 0; k < N; k++)
		{
			if (A[col][k] < min)
			{
				saddle = false;
				break;
			}
		}
		if (saddle)
		{
			std::cout << "Saddle point A[i][j]= A["<<i<<"]["<<col<<']';
			std::cout << std::endl;
			return 0;
		}
	}
	std::cout << "Matrix A does not have a saddle point";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.15
#define N 8
#include <iostream>
const bool existK(int A[][N], size_t n)
{
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++)
		{
			if (A[i][j] != A[j][i])	break;
			if (j == n - 1)	return true;
		}
	}
	return false;
}
int main()
{
	int A[][N] = { 1,  3,  5,  7,  1, 11, 14, 15,
				   2, 15,  8,  0, 13, 22, 34, -9,
				  11,-33, 13, 26,  7,  1, 15, 44,
				  12, -8,-19, 99,  0, 14, 75, 45,
				   4, 31, 20, 19, -5, -3, 98, 10,
				  13, 44,  7, 17, 16, 23, 43,  0,
				  14, 34, 15, 75, 98, 43, 19, 13,
				  18,-57,-41, 67,  2, 11, 13, 36 };
	existK(A, N) ? std::cout << "yes, there exist such k" : std::cout << "no, there does not exist such k";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
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
