//Task 1  
#include <iostream>
int myAbs(int num) 
{
	int absValue;
	absValue = (num >= 0) ? num : -num;
	return absValue;
}
int main()
{
	short input; int minNumber, maxNumber, diff, count, flag;
	minNumber = INT_MAX;
	maxNumber = 0; // no need to take INT_MIN, because if input < 0 it will stop the program;
	count = 0;
	flag = 0;
	std::cout << "Enter an integer number: " << std::endl;;
	while (!(std::cin >> input))
	{
		std::cin.clear(); // reset input
		while (std::cin.get() != '\n') continue; // get rid of bad input
		std::cout << "This input does not work. Enter an integer number in range: " << std::endl;
	}
	while (true)
	{
		if (input >= 0)
		{
			if (input > maxNumber) maxNumber = input;
			if (input < minNumber) minNumber = input;
			count++;
		}
		if (input < 0 && count < 2)
		{
			std::cout << "ERROR! You must enter at least two natural numbers.";
			flag = 2018;
			break;
		}
		else if (input < 0 && count >= 2) break;
		std::cout << "Enter another one: " << std::endl;
		while (!(std::cin >> input))
		{
			std::cin.clear();
			while (std::cin.get() != '\n') continue; 
			std::cout << "This input does not work. Enter an integer number in range: " << std::endl;
		}
	}
	if (flag != 2018)
	{
		diff = minNumber - maxNumber;
		std::cout << "The absolute difference between the smallest and the largest entered numbers is: " << myAbs(diff) << '.';
	}
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
//Task 2
#include <iostream>
int SafelyInputDigit(int lowerBound, int upperBound)
{
	int number;
	bool check;
	do 
	{
		check = false;
		std::cout << "Enter a digit: " << std::endl;
		std::cin >> number;

		if (std::cin.fail())
		{
			std::cin.clear();
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
			check = true;
			continue;
		}
	} while (((number < lowerBound) || (number > upperBound)) || check);
	return number;
}
int main()
{
	int number;
	short digit;
	std::cout << "Enter an integer number: " << std::endl;

	while (!(std::cin >> number))
	{
		std::cin.clear(); // reset input
		while (std::cin.get() != '\n') continue; // get rid of bad input
		std::cout << "Please enter an integer number, that works: " << std::endl;
	}
	int num = number;
	digit = SafelyInputDigit(0, 9);
	int counter = 0;
	while (number != 0)
	{
		if (number % 10 == digit) counter++;
		number /= 10;
	}
	if (counter == 0) std::cout << "Number " << num << " has no digit " << digit << " in it.";
	else if (counter == 1) std::cout << "Number " << num << " has only one digit " << digit << " in it.";
	else std::cout << "Number " << num << " has " << counter << " times the digit " << digit << " in it.";
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
//Task 3
#include <iostream>
int main()
{
	//base 16
	int short firstOperand, secondOperand, operation;
	int base = 16;
	std::cout << "Enter two numbers from 0 to 15 and one from 0 to 3 separated by space:\n";
	while (!(std::cin >> firstOperand >> secondOperand >> operation))
	{
		std::cin.clear(); //reset input
		while (std::cin.get() != '\n') continue; //get rid of bad input
		std::cout << "Please, enter two numbers from 0 to 15 and one from 0 to 3 separated by space:\n";
	}
	bool definitionSet = firstOperand >= 0 && firstOperand <= 15 && operation <= 3 && operation >= 0;
	if (!definitionSet)
	{
		std::cout << "Wrong input";
	}
	else
	{
		/*Since the calculator will be 4 bit - on condition, it is unnecessary for the result variable to be double,
		because the only case in which a floating-point number can be obtained is in the integer division operation,
		but this operation (without casting to double or float) returns integer number. So the result can be at most
		15: 1 = 15 or at least a:b = 0, where a<b and will always be in the allowed values. In this case of division
		we will only check if we divide by 0, which is not allowed.*/
		int result;
		switch (operation)
		{
		case 0:
			std::cout << "The operation is addition and the result is: ";
			result = (firstOperand + secondOperand) % base;
			break;
		case 1:
			std::cout << "The operation is subtraction and the result is: ";
			result = firstOperand - secondOperand;
			if (result < 0) result += 16;
			break;
		case 2:
			std::cout << "The operation is multiplication and the result is: ";
			result = (firstOperand * secondOperand) % base;
			break;
		case 3:
			if (secondOperand != 0)
			{
				std::cout << "The operation is division and the result is: ";
				result = firstOperand / secondOperand;
				break;
			}
			else
			{
				std::cout << "Wrong input";
				return 0;
			}
		}
		std::cout << result<<".\n";
	}
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
//Task 4
#include <iostream>
int main()
{
	short side;
	char symbol;
	std::cout << "Enters side length and symbol separated by space: ";
	while (!(std::cin >> side >> symbol))
	{
		std::cin.clear(); // reset input
		while (std::cin.get() != '\n') continue; // get rid of bad input
		std::cout << "Please enter an integer number between 0 and 13" << std::endl;
	}
	if (side <= 13)
	{
		for (int i = 0; i < 12 - side; i++) std::cout << std::endl;
		for (int i = 0; i < side; i++) //loop for rows
		{
			for (int x = 0; x <= 20 - side - 1; x++) //loop for "rectangle" empty spaces by a row
				std::cout << "  ";
			for (int j = (side - 1) - (i + 1); j >= 0; j--) //loop for "triangle" empty spaces
				std::cout << "  ";
			for (int k = 0; k < 4 * i + 1; k++) //loop for upper triangle made of symbols 
				std::cout << symbol;
			std::cout << std::endl;
		}
		for (int i = side - 1; i > 0; i--) //control loop for rows
		{
			for (int x = 0; x <= 20 - side - 2; x++) //etc.
				std::cout << "  ";
			for (int j = 0; j < side - i + 1; j++)
				std::cout << "  ";
			for (int k = 4 * i - 3; k > 0; k--) //loop for lower triangle made of symbols
				std::cout << symbol;
			std::cout << std::endl;
		}
	}
	else std::cout << "Wrong input. Number must be between 0 and 13.";
}
--------------------------------------------------------------------------------------------------------------------------------
//Task 5
#include <iostream>
int main()
{
	double x, y;
	std::cout << "Enter the coordinates of the point: ";
	while (!(std::cin >> x >> y))
	{
		std::cin.clear(); //reset input
		while (std::cin.get() != '\n') continue; //get rid of bad input
		std::cout << "Please enter correct abscissa and ordinate of a point:\n";
	}
	const int bigCircRad = 6;
	const int medCircRad = 3;
	const int smallCircRad = 1;

	bool inBigCirc = (x*x + y * y) < bigCircRad*bigCircRad;

	bool inMedCircUp = (x*x + (y - medCircRad)*(y - medCircRad)) < medCircRad*medCircRad;
	bool inMedCircDown = (x*x + (y + medCircRad)*(y + medCircRad)) < medCircRad*medCircRad;

	bool inSmallCircUp = (x*x + (y - medCircRad)*(y - medCircRad)) < smallCircRad*smallCircRad;
	bool inSmallCircDown = (x*x + (y + medCircRad)*(y + medCircRad)) < smallCircRad*smallCircRad;

	bool isUndefined =
		x * x + (y - medCircRad)*(y - medCircRad) == smallCircRad * smallCircRad ||
		x * x + (y + medCircRad)*(y + medCircRad) == smallCircRad * smallCircRad ||
		x * x + (y - medCircRad)*(y - medCircRad) == medCircRad * medCircRad ||
		x * x + (y + medCircRad)*(y + medCircRad) == medCircRad * medCircRad ||
		x * x + y * y == bigCircRad * bigCircRad;

	bool inLeftQuadrant = (x < 0);
	
	if (isUndefined) std::cout << "Undefined";
	else if (inBigCirc)
	{
		if (inLeftQuadrant)
		{
			if ((!inMedCircDown || inSmallCircDown) && !inSmallCircUp) std::cout << "White";
			else std::cout << "Black";
		}
		else
		{
			if ((!inMedCircUp || inSmallCircUp) && !inSmallCircDown) std::cout << "Black";
			else std::cout << "White";
		}
	}
	else std::cout << "Outside";
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
//Task 6
#include <iostream>
void printArr(int* arr, size_t size)
{
	std::cout << "Arr = {";
	for (size_t i = 0; i < size; i++)
	{
		if (i == size - 1)
		{
			std::cout << arr[i];
			break;
		}
		std::cout << arr[i] << ", ";
	}
	std::cout << '}';
}
int F(int* arr, size_t const L, int M)
{
	if (M < 0) while (M < 0) M += 5;
	M = M % L; //checking for the condition |M|<L -> unnecessary
	for (int i = 0; i < M; i++)
	{
		int temp = arr[L - 1];
		for (size_t j = L - 1; j > 0; j--)
			arr[j] = arr[j - 1];
		arr[0] = temp;
	}
	return arr[L];
}
int main()
{
	size_t const L = 5;
	int arr[L] = { 6, 5, 6, 0, 3 };
	int arrAfterRotations[L];
	std::cout << "Enter the number of rotations: ";
	int rotationOffset;
	std::cin >> rotationOffset;
	arrAfterRotations[L] = F(arr, L, rotationOffset);
	printArr(arr, L);
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
//Task 7
#include <iostream>
size_t len(char* arr, size_t size)
{
	size_t arrLen = 0;
	for (size_t i = 0; i < size; i++)
	{
		if (arr[i] != '\0') arrLen++;
		else break;
	}
	return arrLen;
}

void G(char* B, char* C, const size_t MAX_ARRAY_SIZE)
{
	size_t lenB = len(B, MAX_ARRAY_SIZE);
	size_t lenC = len(C, MAX_ARRAY_SIZE);
	int index = -1;
	size_t currCount = 0;
	size_t maxCount = 0;
	for (size_t i = 0; i < lenB; i++)
	{
		if (B[i] == C[0])
		{
			for (size_t j = 1; j <= lenC; j++) 
			{
				if (B[i + j - 1] == C[j - 1] && i + j - 1 <= lenB)
				{
					if (j == lenC)
					{
						i = i + j;
						j -= lenC;
						currCount++;
						if (currCount > maxCount)
						{
							maxCount = currCount;
							index = i - maxCount * lenC;
						}
					}
				}
			}
			currCount = 0;
		}
	}

	size_t const L = maxCount * lenC;
	char A[100];

	for (size_t i = 0; i < L; i++)
	{
		A[i] = C[i % lenC];

		//Let for example C={b,c,a} and B={B,E,G,I,N,b,c,a,b,c,a,b,c,a,E,N,D}, then
		//A={b,c,a,b,c,a,b,c,a}

		//A[0]=C[0] 0=0 (mod 3), A[1]=C[1] 1=1 (mod 3), A[2]=C[2] 2=2 (mod 3),
		//A[3]=C[0] 3=0 (mod 3), A[4]=C[1] 4=1 (mod 3), A[5]=C[2] 5=2 (mod 3),
		//A[6]=C[0] 6=0 (mod 3), A[7]=C[1] 7=1 (mod 3), A[8]=C[2] 8=2 (mod 3),
		//so generally A[i] = C [i (mod lenC)]
	}

	/*std::cout << "Subtraction of consistently repeating strings C (in array of chars C) in B is: ";
	for (size_t i = 0; i < L; i++) std::cout << A[i];
	std::cout << std::endl;*/
	std::cout << "Index: " << index << std::endl;
	std::cout << "Length: " << maxCount * lenC << std::endl;
}
int main()
{
	const size_t MAX_ARRAY_SIZE = 100;
	char arrC[MAX_ARRAY_SIZE];
	char arrB[MAX_ARRAY_SIZE];
	std::cout << "Enter array \"B\" : ";
	std::cin >> arrB;
	std::cout << "Enter array \"C\" : ";
	std::cin >> arrC;
	G(arrB, arrC, MAX_ARRAY_SIZE);
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
//Task 8
#include <iostream>
size_t arrLen(int* arr, size_t size)
{
	size_t arrLen = 0;
	for (size_t i = 0; i < size; i++)
	{
		if (arr[i] != '\0') arrLen++;
		else break;
	}
	return arrLen;
}
bool sim(int matrix[][6], size_t row, size_t col) //checks if the matrix is simplified
{
	for (size_t i = 0; i < row; i++)
	{
		for (size_t j = 0; j < col; j++)
		{
			if (matrix[i][j] / 10 != 0 || matrix[i][j] < 0)
				return false;
		}
	}
	return true;
}
int* convertNumToArr(int M, size_t& lenNum)// converts number M to an array of digits
{
	int* numArr = new int[6];
	for (int i = 0; i < 6; i++)
	{
		numArr[i] = M % 10;
		M /= 10;
		if (M == 0)
		{
			lenNum = i + 1;
			break;
		}
	}
	for (size_t i = 0; i < lenNum / 2; i++) // reverses the array of digits
	{
		int temp = numArr[i];
		numArr[i] = numArr[lenNum - i - 1];
		numArr[lenNum - i - 1] = temp;
	}
	return numArr;
}
bool palindrome(int num)
/*checks if a natural number is palindrome, because	if it is - we will cicle through
the matrix only once from left to right and once from top to bottom */
{
	if (num < 0) return false;
	if (num / 10 == 0) return true;
	size_t n = num;
	short digit;
	size_t rev = 0;
	do
	{
		digit = num % 10;
		rev = (rev * 10) + digit;
		num = num / 10;
	} 
	while (num != 0);
	if (n == rev)return true;
	else return false;
}
int countAppearances(int M, int matrix[][6])
{
	size_t lenNum;
	int* numArr = convertNumToArr(M, lenNum);
	size_t count = 0;
	for (size_t i = 0; i < 6; i++)
	{
		for (size_t j = 0; j < 6; j++)
		{
			if (matrix[i][j] == numArr[0])
			{
			 for (size_t k = 0; k <= lenNum - 1; k++)
				/*only here we include k=0, when M is with one digit! Because when M is with one digit
				we cycle the matrix	only by rows from left to right and only once*/
			 {
				if (matrix[i][j + k] == numArr[k] && j + k <= 5) //checks rows from left to right
				{
					if (k == lenNum - 1) count++;
				}
				else break;
			 }
			 for (size_t k = 1; k <= lenNum - 1; k++) //k=1
			 {
				if (matrix[i][j - k] == numArr[k] && j - k >= 0 && !palindrome(M)) //checks rows from right to left
				{
					if (k == lenNum - 1) count++;
				}
				else break;
			 }
			 for (size_t k = 1; k <= lenNum - 1; k++) //k=1
			 {
				if (matrix[i + k][j] == numArr[k] && i + k <= 5) //checks columns from top to bottom
				{
					if (k == lenNum - 1) count++;
				}
				else break;
			 }
			 for (size_t k = 1; k <= lenNum - 1; k++) //k=1
			 {
				if (matrix[i - k][j] == numArr[k] && i - k >= 0 && !palindrome(M))//checks columns from bottom to top
				{
					if (k == lenNum - 1) count++;
				}
				else break;
			 }
			}			
		}
	}
	delete[] numArr;
	return count;
}
bool validNum(int M) //checks if the number is with six digits ot less and positive
{
	return !(M / 1000000 != 0 || M < 0);
}
int main()
{
	const int ROWS = 6;
	const int COLUMNS = 6;
	int matrix[ROWS][COLUMNS] =
	{ 5,4,3,8,0,6,
	  9,4,5,1,0,2,
	  8,5,8,0,6,1,
	  0,9,6,8,4,2,
	  6,1,0,2,6,1,
	  2,1,8,4,2,6 };
	std::cout << "Enter an integer number: ";
	int M;
	std::cin >> M;
	if (sim(matrix, ROWS, COLUMNS))
	{
		if (!validNum(M)) std::cout << 0;
		else std::cout << countAppearances(M, matrix) << std::endl;
	}
	else std::cout << "The matrix is not simplified.";
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
//Task 9
#include "iostream"
#include <windows.h>
const char hello[5][41] =
{
	{'H',' ',' ',' ','H',' ',' ',' ','E','E','E','E','E',' ',' ',' ','L',' ',' ',' ',
	' ',' ',' ',' ','L',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','O',' ',' ',' ',' ','\n'},

	{'H',' ',' ',' ','H',' ',' ',' ','E',' ',' ',' ',' ',' ',' ',' ','L',' ',' ',' ',' ',
	' ',' ',' ','L',' ',' ',' ',' ',' ',' ',' ',' ','O',' ',' ',' ','O',' ',' ','\n'},

	{'H','H','H','H','H',' ',' ',' ','E','E','E','E','E' ,' ',' ',' ','L',' ',' ',' ',' ',
	' ',' ',' ','L',' ',' ',' ',' ',' ',' ',' ','O',' ',' ',' ',' ',' ','O',' ','\n'},

	{'H',' ',' ',' ','H',' ',' ',' ','E',' ',' ',' ',' ',' ',' ',' ','L',' ',' ',' ',' ',
	' ',' ',' ','L',' ',' ',' ',' ',' ',' ',' ',' ','O',' ',' ',' ','O',' ',' ','\n'},

	{'H',' ',' ',' ','H',' ',' ',' ','E','E','E','E','E',' ',' ',' ','L','L','L','L','L',
	' ',' ',' ','L','L','L','L','L',' ',' ',' ',' ',' ',' ','O',' ',' ',' ',' ','\n'}
};
void printMe(int count)
{
	//we create 10 empty lines to center the text
	std::cout << "\n\n\n\n\n\n\n\n\n\n";
	//before the first printing
	if (count <= 40)
	{
		for (int i = 0; i < 5; i++)
		{
			for (int j = 40 - count; j < 40; j++)
			{
				std::cout << hello[i][j];
			}
			std::cout << std::endl;
		}
	}
	else if (count > 40 && count <= 80)
	{ //printing the text
		for (int k = 0; k < 5; k++)
		{ //putting the spaces
			for (int i = 0; i < count - 40; i++) std::cout << ' ';
			for (int j = 0; j < 39; j++) std::cout << hello[k][j];
			std::cout << std::endl;
		}
	}
	else
	{
		for (int i = 0; i < 5; i++)
		{ //printing blank symbols
			for (int k = 0; k < count - 40; k++) std::cout << ' ';
			for (int j = 0; j < 80 - (count - 39); j++) std::cout << hello[i][j];
			std::cout << std::endl;
		}
	}
}
int main()
{
	int count = 0;
	while (true)
	{
		printMe(count++);
		if (count > 120) count = 0;
		Sleep(30);
		system("CLS");
	}
	system("pause");
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
//Task 10
#include<iostream>
/* we will divide the code into а number of functions for clarity
1. Function for multiplying matrices 3x3*/
double** multiplyMatr(double** A, double** B)
{
	double **prod; // the ptoduct matrix
	prod = new double*[3];
	for (size_t i = 0; i < 3; i++)
	{
		prod[i] = new double[3];
		for (size_t j = 0; j < 3; j++) prod[i][j] = 0;
	}
	// Multiplying rows by columns by the rule
	for (size_t i = 0; i < 3; i++)
		for (size_t j = 0; j < 3; j++)
			for (size_t k = 0; k < 3; k++)
				prod[i][j] += A[i][k] * B[k][j];
	return prod;
}

/* 2. Function for transposing a matrix (changing the elements
symmetrically to the main diagonal (rows becomes columns))*/
double** transposition(double** A)
{
	double** result; // the transposed matrix
	result = new double*[3];
	for (size_t i = 0; i < 3; i++)
	{
		result[i] = new double[3];
		for (size_t j = 0; j < 3; j++) result[i][j] = A[j][i];
	}
	return result;
}

// 3. Function for finding the unique inverse matrix
double** inverseMatr(double** A)
{
	double** result;
	result = new double*[3];
	for (size_t i = 0; i < 3; i++)
	{
		result[i] = new double[3];
		for (size_t j = 0; j < 3; j++) result[i][j] = 0;
	}
	// Finding the determinant using the Sarrus rule
	double det = A[0][0] * A[1][1] * A[2][2] + A[1][0] * A[2][1] * A[0][2] + A[0][1] * A[1][2] * A[2][0]
		- (A[2][0] * A[1][1] * A[0][2] + A[2][1] * A[1][2] * A[0][0] + A[1][0] * A[0][1] * A[2][2]);
	// Creating the unique inverse matrix using adjugate operations
	if (det == 0)
	{
		std::cout << "There is no inverse matrix.";
		return 0;
	}
	else
	{// The inverse matrix exists only if the determinant is not equal to zero
		for (size_t i = 0; i < 3; i++)
			for (int j = 0; j < 3; j++)
				result[i][j] = ((A[(j + 1) % 3][(i + 1) % 3] * A[(j + 2) % 3][(i + 2) % 3]) -
				(A[(j + 1) % 3][(i + 2) % 3] * A[(j + 2) % 3][(i + 1) % 3])) / det;
	}
	return result;
}

// 4. Function for solving the matrix equation
double** solvingEquation(double** A, double** C)
{
	double** sol; // solution matrix
	sol = new double*[3];
	for (size_t i = 0; i < 3; i++)
	{
		sol[i] = new double[3];
		for (size_t j = 0; j < 3; j++) sol[i][j] = 0;
	}
	// transposing matrix A
	double** A_tr = transposition(A);
	// multiplying by -3
	for (size_t i = 0; i < 3; i++)
		for (size_t j = 0; j < 3; j++) A_tr[i][j] = A_tr[i][j] * (-3);
	// adding 5 to elements from the main diagonal (rule of adding a number to a matrix 3x3)
	for (size_t i = 0; i < 3; i++)
		A[i][i] += 5;
	// finding inverse matrix
	double** A_inv = inverseMatr(A);
	// intermediate calculation
	double** intermCalc = multiplyMatr(A_tr, C);
	sol = multiplyMatr(intermCalc, A_inv);
	return sol;
}
// 5. Function for deleting a dynamically created matrix
void deleteMatr(double** M, size_t rows, size_t cols)
{
	for (size_t i = 0; i < rows; i++) delete[] M[i];
	delete[] M;
}
int main()
{
	{// we create a local matrix 3x3	
		double A[3][3] =
		{
			{-4,1,1},
			{1,-3,2},
			{1,2,-4}
		};
		double **newA;
		newA = new double*[3];
		for (size_t i = 0; i < 3; i++)
		{
			newA[i] = new double[3];
			for (int j = 0; j < 3; j++) newA[i][j] = A[i][j];
		}
		double C[3][3] =
		{
			{-1,-2,-2},
			{-1,-3,-4},
			{-1,-3,-5}
		};
		double** newC;
		newC = new double*[3];
		for (size_t i = 0; i < 3; i++)
		{
			newC[i] = new double[3];
			for (size_t j = 0; j < 3; j++) newC[i][j] = C[i][j];
		}
		// Solving the equation
		double** sol = solvingEquation(newA, newC);
		for (size_t i = 0; i < 3; i++)
		{
			for (int j = 0; j < 3; j++)
				std::cout << sol[i][j] << " ";
			std::cout << std::endl;
		}
		deleteMatr(newA, 3, 3);
		deleteMatr(newC, 3, 3);
		deleteMatr(sol, 3, 3);
	}
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
//Task 11
#define _CRTDBG_MAP_ALLOC   // required
#include <stdlib.h>         // to enable MSVC++
#include <crtdbg.h>         // memory leak detection

#include <string>
#include <iostream>

/* 1. Function that simplifies the matrix. Applying Carl Friedrich Gauss's method
and returning an array, which shows us the columns on which we have been working on*/
size_t* simMatr(double** A, size_t m)
{
	static size_t indexes[4];// creating an array filled with zeroes, which we will return
	for (size_t i = 0; i < 4; i++) indexes[i] = 0;
	// there are two cases, both of which are analogical
	if (m < 4)
	{
		for (size_t i = 0, k = 0; i < m && k < 4; i++, k++)
		{
			double max = 0;
			int index = i;
			do
			{//we find the abs maximum number in each non-zero column by checking only under the number taken
				max = abs(A[i][k]);
				index = i;
				for (size_t j = i; j < m; j++)
				{
					if (abs(A[j][k]) > max)
					{
						max = A[j][k];
						index = j;
					}
				}
				/*if the maximum number in this column is different from zero, then the number of
					this coefficient in the array бецомес 1 in order to know that we have worked with it*/
				if (max != 0) indexes[k] = 1;
				else
				{
					bool flag = true;
					for (size_t h = 0; h < m; h++) if (A[h][k] != 0)
						flag = false;
					if (flag) indexes[k] = 2;
					/*if the maximum in this column is different from zero, then the coef
					in the array becomes 2 and all zero to know that we have worked with it*/
					++k;
				}
			} while (max == 0);
			for (size_t g = i; g < 4; g++)
			{
				double tmp = A[index][g];
				A[index][g] = A[i][g];
				A[i][g] = tmp;
			}// we put this row that we found in the highest possible place
			for (size_t j = 0; j < m; j++)
			{
				if (j == i) continue; //we do nothing, because at least one row must be preserved					
				if (A[j][k] == 0) continue; // nothing changes in this column
				double c = (-1)*(A[j][k] / A[i][k]); //Gauss's method
				for (size_t g = i; g < 4; g++)
				{
					if (g == k)	A[j][g] = 0;
					else
					{
						A[j][g] = A[j][g] + c * A[i][g];
						if (A[j][g] <= 0.0001&&A[j][g] >= -0.0001)A[j][g] = 0;
						// since double provides approximations, this verification is needed
					}
				}
			}
		}
	}
	// analogous logic of the upper case
	if (m >= 4)
	{
		for (size_t i = 0, k = 0; i < 4 && k < 4; i++, k++)
		{
			double max = 0;
			int index = i;
			do
			{
				max = abs(A[i][k]);
				index = i;
				for (size_t j = i; j < m; j++)
				{
					if (abs(A[j][k]) > max)
					{
						max = A[j][k];
						index = j;
					}
				}
				if (max != 0) indexes[k] = 1;
				else
				{
					bool flag = true;
					for (size_t h = 0; h < m; h++) if (A[h][k] != 0) flag = false;
					if (flag) indexes[k] = 2;
					++k;
				}
			} while (max == 0);

			for (int g = i; g < 4; g++)
			{
				double tmp = A[index][g];
				A[index][g] = A[i][g];
				A[i][g] = tmp;
			}
			for (size_t j = 0; j < m; j++)
			{
				if (j == i) continue;
				if (A[j][k] == 0) continue;
				double c = (-1)*(A[j][k] / A[i][k]);
				for (int g = i; g < 4; g++)
				{
					if (g == k) A[j][g] = 0;
					else
					{
						A[j][g] = A[j][g] + c * A[i][g];
						if (A[j][g] <= 0.0001 && A[j][g] >= -0.0001) A[j][g] = 0;
					}
				}
			}
		}
	}
	return indexes;
}
// 2. Function for finding a fundamental system of solutions
double** FSS(double** A, size_t m, size_t &t)
{// t is a tracker and keeps the number of rows we have not worked on
	size_t* indexes = simMatr(A, m);
	size_t count = 0;
	// checking which rows we have not used
	for (size_t i = 0; i < 4; i++) if (indexes[i] != 1) count++;
	// creating arrays in which we will keep track of which rows we have used and which do not
	size_t* notUsed = new size_t[count];
	size_t k = 4 - count;
	size_t* used = new size_t[k];
	size_t count1 = 0, count2 = 0;
	for (size_t i = 0; i < 4; i++)
	{
		if (indexes[i] != 1)
		{
			notUsed[count1] = i;
			count1++;
		}
		else
		{
			used[count2] = i;
			count2++;
		}
	}
	if (count == 0) {// if all are used then the only solution is null 
		std::cout << "Only null solution for the system.";

		delete[] notUsed;
		delete[] used;

		return 0;
	}
	else
	{
		//delete[] indexes;
		double** FSSnew = nullptr;
		FSSnew = new double*[count];
		for (size_t i = 0; i < count; i++)
		{
			FSSnew[i] = new double[4];
			for (size_t j = 0; j < 4; j++) {
				FSSnew[i][j] = 0;
			}
		}
		int tr = 0;
		/* we use an algorithm for finding fundamental system of solutions, giving free
		values ​​1, and 0 to all others*/
		for (size_t i = 0; i < count1; i++) {
			size_t in = notUsed[i];
			FSSnew[tr][in] = 1;
			for (size_t j = 0; j < count2; j++)
			{
				int in2 = used[j];
				if (A[j][in] != 0) FSSnew[tr][in2] = -A[j][in] / A[j][in2];
			}
			tr++;
		}
		t = count;

		delete[] notUsed;
		delete[] used;

		return FSSnew;
	}// returning a matrix with every row a vector of FS (fundamental solution)
}
double** func(double** A, double** B, int n, size_t &m) // the function wanted from the condition
{
	size_t tr = 0; // it will show the number of rows in FSS (fundamental system of solutions)
	double ** new_B = FSS(B, m, tr); // finding FSS
	double** sol;
	size_t br = tr + n;
	sol = new double*[br]; // making а common matrix between the given vectors and the FSS 
	for (size_t i = 0; i < br; i++)
	{
		sol[i] = new double[4];
		for (size_t j = 0; j < 4; j++)
		{
			if (i < tr) sol[i][j] = new_B[i][j];
			else sol[i][j] = A[i - tr][j];
		}
	}
	for (size_t i = 0; i < tr; i++)
		delete[] new_B[i];
	delete[] new_B;
	// creating new matrix whose non-zero rows are the basis of U + W, using Gauss's method
	simMatr(sol, br);
	m = br;// keeping track of how many these rows are in our new matrix
	return sol;
}
void test()
{
	// we create the matrices locally
	double A[4][4] =
	{
		{2, 8, -3, 14},
		{-1, 2, 3, 5},
		{-1, 14, 6, 29},
		{0, 12, 3, 24},
	};
	double** newA;
	newA = new double*[4];
	for (size_t i = 0; i < 4; i++)
	{
		newA[i] = new double[4];
		for (size_t j = 0; j < 4; j++) newA[i][j] = A[i][j];
	}
	double B[2][4] =
	{
		{0, 1, 1, 0},
		{10, 7, 0, -8}
	};
	double** newB;
	newB = new double*[2];
	for (size_t i = 0; i < 2; i++)
	{
		newB[i] = new double[4];
		for (size_t j = 0; j < 4; j++) newB[i][j] = B[i][j];
	}
	size_t m(2), n(4);
	double** solution = func(newA, newB, n, m);
	std::cout << "The basis of W + U is: " << std::endl;
	// printing only the non-zero rows
	for (size_t i = 0; i < m; i++)
	{
		bool isPrint = false;
		for (int j = 0; j < 4; j++) if (solution[i][j] != 0) isPrint = true;
		if (isPrint)
		{
			std::cout << "( ";
			for (size_t j = 0; j < 4; j++)
			{
				std::cout << solution[i][j];
				if (j != 3) std::cout << ", ";
			}
			std::cout << ")" << std::endl;;
		}
	}
	for (size_t i = 0; i < m; i++) delete[] solution[i];
	delete[] solution;
	for (size_t i = 0; i < m - n; i++) delete[] newB[i];
	delete[] newB;
	for (size_t i = 0; i < n; i++) delete[] newA[i];
	delete[] newA;
}
int main()
{
	test();
	_CrtDumpMemoryLeaks();
	return 0;
}
