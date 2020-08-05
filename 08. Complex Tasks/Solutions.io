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
