//Task 8.01
#include <iostream>
int* numIntoArr(int num)
{
	int* arr = new int[4];
	for (int i = 3; i >= 0; i--)
	{
		arr[i] = num % 10;
		num /= 10;
	}
	return arr;
}
int inputNum(int lowerBound, int upperBound, bool& flag)
{
	int n;
	while (true)
	{
		if (!flag)
		{
			std::cout << "Input a number in range [0..9999]: ";
			std::cin >> n;
		}
		else
		{
			std::cout << "Guess the number: ";
			std::cin >> n;
		}
		if (std::cin.fail())
		{
			std::cin.clear();
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
		}
		else if ((n >= lowerBound) && (n <= upperBound)) break;
	}
	flag = true;
	return n;
}
int main()
{
	bool flag = false;
	int num = inputNum(0, 9999, flag);
	int guess = inputNum(0, 9999, flag);

	int* numArr = numIntoArr(num);
	int* guessArr = numIntoArr(guess);

	size_t bulls(0), cows(0);

	for (size_t i = 0; i < 4; i++)
	{
		if (numArr[i] == guessArr[i])
		{
			bulls++;
			guessArr[i] = -1;
		}
	}
	for (size_t i = 0; i < 4; i++)
	{
		size_t curr = guessArr[i];
		for (size_t j = 0; j < 4; j++)
		{
			if (numArr[j] == curr)
			{
				cows++;
				break;
			}
		}
	}
	std::cout << bulls << ' ' << cows;
	
	delete[] numArr;
	delete[] guessArr;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 8.02
#include <iostream>
int* numIntoArr(int num)
{
	int* arr = new int[4];
	for (int i = 3; i >= 0; i--)
	{
		arr[i] = num % 10;
		num /= 10;
	}
	return arr;
}
int inputNum(int lowerBound, int upperBound)
{
	int n;
	while (true)
	{
		std::cout << "Input a number in range [0..9999]: ";
		std::cin >> n;
		if (std::cin.fail())
		{
			std::cin.clear();
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
		}
		else if ((n >= lowerBound) && (n <= upperBound)) break;
	}
	return n;
}
int main()
{
	int guess = inputNum(0, 9999);
	int* guessArr = numIntoArr(guess);
	size_t b, c;
	std::cout << "bulls: ";
	std::cin >> b;
	std::cout << "cows: ";
	std::cin >> c;

	for (size_t i = 0; i <= 9; i++)
	{
		for (size_t j = 0; j <= 9; j++)
		{
			for (size_t k = 0; k <= 9; k++)
			{
				for (size_t l = 0; l <= 9; l++)
				{
					size_t countB(0), countC(0);
					if (i == guessArr[0]) countB++;
					if (j == guessArr[1]) countB++;
					if (k == guessArr[2]) countB++;
					if (l == guessArr[3]) countB++;
					bool cow1 = i != guessArr[0] &&
						((i == guessArr[1] && j != guessArr[1]) ||
						(i == guessArr[2] && k != guessArr[2]) ||
							(i == guessArr[3] && l != guessArr[3]));
					bool cow2 = j != guessArr[1] &&
						((j == guessArr[0] && i != guessArr[0]) ||
						(j == guessArr[2] && k != guessArr[2]) ||
							(j == guessArr[3] && l != guessArr[3]));
					bool cow3 = k != guessArr[2] &&
						((k == guessArr[0] && i != guessArr[0]) ||
						(k == guessArr[1] && j != guessArr[1]) ||
							(k == guessArr[3] && l != guessArr[3]));
					bool cow4 = l != guessArr[3] &&
						((l == guessArr[0] && i != guessArr[0]) ||
						(l == guessArr[1] && j != guessArr[1]) ||
							(l == guessArr[2] && k != guessArr[2]));
					if (cow1) countC++;
					if (cow2) countC++;
					if (cow3) countC++;
					if (cow4) countC++;

					if (countB == b && countC == c) std::cout << i << j << k << l << std::endl;
				}
			}
		}
	}
	delete[] guessArr;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 8.03
#include <iostream>
#include <cmath>
size_t getDigitCount(size_t n)
{
	return (size_t)(floor(log10(n))) + 1;
}
size_t* numArr(size_t n, size_t len)
{
	size_t* arr = new size_t[len];
	for (int i = len - 1; i >= 0; i--)
	{
		size_t curr = n % 10;
		arr[i] = curr;
		n /= 10;
	}
	return arr;
}
void countBurgers(size_t* arr, size_t len, size_t& leftBurgers, size_t& rightBurgers)
{
	for (size_t i = 0; i < len / 2; i++)
	{
		leftBurgers += arr[i];
		rightBurgers += arr[len - i - 1];
	}
	if (len % 2 != 0)
	{
		leftBurgers += arr[len / 2];
		rightBurgers += arr[len / 2];
	}
}
int main()
{
	size_t n;
	std::cin >> n;
	size_t digitCount = getDigitCount(n);
	size_t* arr = numArr(n, digitCount);

	size_t leftBurgers(0), rightBurgers(0);
	countBurgers(arr, digitCount, leftBurgers, rightBurgers);

	if (leftBurgers == rightBurgers)std::cout << "Even";
	else if (leftBurgers > rightBurgers)std::cout << "Strahil " << leftBurgers;
	else if (leftBurgers < rightBurgers)std::cout << "Pesho " << rightBurgers;

	delete[] arr;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 8.04
#include <iostream>
size_t rowLen(char arr[][9], int row)
{
	size_t len = 0;
	for (size_t i = 0; i < 9; i++)
	{
		if (arr[row][i] != '-'&&arr[row][i] >= '0'&&arr[row][i] <= '9')
		{
			len++;
		}
	}
	return len;
}
size_t colLen(char arr[][9], int col)
{
	size_t len = 0;
	for (size_t i = 0; i < 9; i++)
	{
		if (arr[i][col] != '-'&&arr[i][col] >= '0'&&arr[i][col] <= '9')
		{
			len++;
		}
	}
	return len;
}
size_t boxLen(char arr[][9], int startRow, int startCol)
{
	size_t len = 0;
	for (int i = startRow; i < startRow + 3; i++)
	{
		for (int j = startCol; j < startCol + 3; j++)
		{
			if (arr[i][j] != '-'&&arr[i][j] >= '0'&&arr[i][j] <= '9')
			{
				len++;
			}
		}
	}
	return len;
}
bool checkRow(char arr[][9], int row)
{
	bool rowFlag = true;
	size_t len = rowLen(arr, row);
	char* set = new char[len];
	size_t j = 0;
	for (int i = 0; i < 9; i++)
	{	// If it is not an empty cell, insert value at the current cell in the set 
		if (arr[row][i] != '-')
		{
			if (arr[row][i] >= '0' && arr[row][i] <= '9')
			{
				set[j] = arr[row][i];
				j++;
			}
			else
			{
				rowFlag = false;
				break;
			}
		}
	}
	if (rowFlag == true)
	{
		for (size_t k = 0; k < len; k++)
		{   // Checks whether there is any duplicate in current row or not 
			char curr = set[k];
			for (size_t l = k + 1; l < len; l++)
			{
				if (curr == set[l])
				{
					rowFlag = false;
					break;
				}
			}
		}
	}
	delete[] set;
	return rowFlag;
}
bool checkCol(char arr[][9], int col)
{
	bool colFlag = true;
	size_t len = colLen(arr, col);
	char* set = new char[len];
	size_t j = 0;
	for (int i = 0; i < 9; i++)
	{	// If it is not an empty cell, insert value at the current cell in the set 
		if (arr[i][col] != '-')
		{
			if (arr[i][col] >= '0' && arr[i][col] <= '9')
			{
				set[j] = arr[i][col];
				j++;
			}
			else
			{
				colFlag = false;
				break;
			}
		}
	}
	if (colFlag == true)
	{
		for (size_t k = 0; k < len; k++)
		{	// Checks whether there is any duplicate in current col or not 
			char curr = set[k];
			for (size_t l = k + 1; l < len; l++)
			{
				if (curr == set[l])
				{
					colFlag = false;
					break;
				}
			}
		}
	}
	delete[] set;
	return colFlag;
}
bool checkBox(char arr[][9], int startRow, int startCol)
{
	bool boxFlag = true;
	size_t len = boxLen(arr, startRow, startCol);
	char* set = new char[len];
	size_t j = 0;
	for (int row = startRow; row < startRow + 3; row++)
	{
		for (int col = startCol; col < startCol + 3; col++)
		{
			if (arr[row][col] != '-')
			{
				if (arr[row][col] >= '0' && arr[row][col] <= '9')
				{
					set[j] = arr[row][col];
					j++;
				}
				else
				{
					boxFlag = false;
					goto FLAG1;
				}
			}
		}
	}
FLAG1:if (boxFlag == true)
{
	for (size_t k = 0; k < len; k++)
	{	// Checks whether there is any duplicate in current col or not 
		char curr = set[k];
		for (size_t l = k + 1; l < len; l++)
		{
			if (curr == set[l])
			{
				boxFlag = false;
				goto FLAG2;
			}
		}
	}
}
  FLAG2:delete[] set;
	  return boxFlag;
}
bool isValid(char arr[][9], int row, int col)
{   // Checks whether current row and current column and current 3x3 box is valid or not 
	return checkRow(arr, row) && checkCol(arr, col) && checkBox(arr, row - row % 3, col - col % 3);
}
bool isValidSudoku(char arr[][9])
{
	for (int i = 0; i < 9; i++)
	{
		for (int j = 0; j < 9; j++)
		{	// If current row or current column or current 3x3 box is not valid, return false 
			if (!isValid(arr, i, j)) return false;
		}
	}
	return true;
}
int main()
{
	char board[9][9] = { { '5', '3', '-', '-', '7', '-', '-', '-', '-' },
						 { '6', '-', '-', '1', '9', '5', '-', '-', '-' },
						 { '-', '9', '8', '-', '-', '-', '-', '6', '-' },
						 { '8', '-', '-', '-', '6', '-', '-', '-', '3' },
						 { '4', '-', '-', '8', '-', '3', '-', '-', '1' },
						 { '7', '-', '-', '-', '2', '-', '-', '-', '6' },
						 { '-', '6', '-', '-', '-', '-', '2', '8', '-' },
						 { '-', '-', '-', '4', '1', '9', '-', '-', '5' },
						 { '-', '-', '-', '-', '8', '-', '-', '7', '9' } };
	isValidSudoku(board) ? std::cout << "True" : std::cout << "False";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 8.05
#include <iostream>
int myStrcmp(char string1[], char string2[])
{
	for (int i = 0; ; i++)
	{
		if (string1[i] != string2[i]) return string1[i] < string2[i] ? -1 : 1;
		if (string1[i] == '\0') return 0;
	}
}
void printMatrix(char** M, size_t len)
{
	for (size_t i = 0; i < len; i++)
	{
		size_t j = 0;
		while (M[i][j] != 0)
		{
			std::cout << M[i][j];
			j++;
		}
		std::cout << std::endl;
	}
}
void releaseMatrix(char** M, size_t len)
{
	for (size_t i = 0; i < len; i++)
	{
		delete[] M[i];
	}
	delete[] M;
}
size_t countWords(char* str, size_t n)
{
	size_t count = 0;
	bool inWord = false;
	for (size_t i = 0; i < n; i++)
	{
		if ((str[i] >= 'a'&&str[i] <= 'z') || (str[i] >= 'A'&&str[i] <= 'Z'))
		{
			if (inWord == false)
			{
				count++;
				inWord = true;
			}
		}
		else inWord = false;
	}
	return count;
}
size_t* fillArr(char* str, size_t n, size_t len)
{
	size_t currCount = 0;
	size_t* arr = new size_t[len]; // creating an arr that will hold the length of the words
	size_t j = 0;
	for (size_t i = 0; i < n; i++)
	{
		if ((str[i] >= 'a'&&str[i] <= 'z') || (str[i] >= 'A'&&str[i] <= 'Z'))
		{
			while (((str[i] >= 'a'&&str[i] <= 'z') || (str[i] >= 'A'&&str[i] <= 'Z')) && i <= n - 1)
			{
				currCount++;
				i++;
			}
			arr[j] = currCount;
			j++;
			currCount = 0;
		}
	}
	return arr;
}
char** words(char* str, size_t n, size_t* arr, size_t len)
{
	char** words = new char*[len];
	for (size_t i = 0; i < len; i++)
	{
		words[i] = new char[arr[i] + 1];
	}
	size_t j = 0;
	size_t k = 0;
	for (size_t i = 0; i < n; i++)
	{
		if ((str[i] >= 'a'&&str[i] <= 'z') || (str[i] >= 'A'&&str[i] <= 'Z'))
		{
			while (((str[i] >= 'a'&&str[i] <= 'z') || (str[i] >= 'A'&&str[i] <= 'Z')) && i <= n - 1)
			{
				words[j][k] = str[i];
				i++;
				k++;
			}
			j++;
			k = 0;
		}
	}
	for (size_t i = 0; i < len; i++) words[i][arr[i]] = '\0'; //at the end of every word in the matrix - '\0'
	return words;
}
void bubbleSort(char** words, size_t n)
{
	while (true)
	{
		bool swapped = false;
		for (size_t i = 0; i < n - 1; i++)
		{
			if (myStrcmp(words[i], words[i + 1]) == 1)
			{
				std::swap(words[i], words[i + 1]);
				swapped = true;
			}
		}
		if (!swapped) break;
	}
}
void delReps(char** wordsMatrix, size_t& numWords)
{   // all left  to do is to delete the repeated words
	for (size_t i = 0; i < numWords; i++)
	{
		char* curr = wordsMatrix[i];
		for (size_t j = i; j < numWords - 1; j++)
		{
			if (myStrcmp(curr, wordsMatrix[j + 1]) == 0)
			{
				delete[] wordsMatrix[j + 1];
				for (size_t k = j + 1; k < numWords - 1; k++)
				{
					wordsMatrix[k] = wordsMatrix[k + 1];
				}
				numWords--;
				j--;
			}
		}
	}
}
int main()
{
	char str[] = { "program: Write this program, without using string, and any other STL libraries except <iostream>." };
	size_t n = sizeof(str) / sizeof(str[0]);

	size_t numWords = countWords(str, n);

	// filling an arr with the len of the counted words
	size_t* arr = fillArr(str, n, numWords);

	// making a matrix from the words with the exact len
	char** wordsMatrix = words(str, n, arr, numWords);

	// sorting
	bubbleSort(wordsMatrix, numWords);

	// delete the repeated words
	delReps(wordsMatrix, numWords);

	printMatrix(wordsMatrix, numWords);

	releaseMatrix(wordsMatrix, numWords);
	delete[] arr;
	return 0;
}
