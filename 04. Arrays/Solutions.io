//Task 4.01 & 4.02
#include <iostream>
void printArr(size_t arrLen, int* arr)
{ // Task 4.01
	for (size_t i = 0; i < arrLen; i++)
		std::cout << arr[i] << ' ';
	std::cout << std::endl;
}
void reverseArr(size_t n, int* arr)
{ // Task 4.02
	for (size_t i = 0; i < n/2; i++)
	{
		std::swap(arr[i], arr[n - i - 1]);
	}
}

int main()
{
	int arr[6] = { -3,4,58,12,-4,9 };
	size_t arrLen = sizeof(arr) / sizeof(arr[0]);
	printArr(arrLen, arr);

	reverseArr(arrLen, arr);
	printArr(arrLen, arr);

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.03 & 4.04 & 4.05 & 4.06
#include <iostream>
#include <limits>
void fillArr(size_t n, int* arr)
{
	for (size_t i = 0; i < n; i++)
	{
		int num;
		std::cin >> num;
		arr[i] = num;
	}
}
void printArrReverse(size_t n, int* arr)
{ //Task 4.03
	std::cout << "Elements in reverse order: ";
	for (size_t i = 0; i < n; i++)
	{
		std::cout << arr[n - i - 1] << ' ';
	}
	std::cout << std::endl;
}
void printEvenElements(size_t n, int* arr)
{ //Task 4.04
	std::cout << "Even elements: ";
	for (size_t i = 0; i < n; i++)
		if (arr[i] % 2 == 0) std::cout << arr[i] << ' ';
	std::cout << std::endl;
}
void printAllLessThanAverage(size_t n, int* arr)
{ //Task 4.05
	int sum(0);
	for (size_t i = 0; i < n; i++)
	{
		sum += arr[i];
	}
	double average = (double)sum / n;
	std::cout << "Less than average elements: ";
	for (size_t i = 0; i < n; i++)
	{
		if (arr[i] < average)
		{
			std::cout << arr[i] << ' ';
		}
	}
	std::cout << std::endl;
}
int minMaxElement(size_t n, int* arr, int& max)
{ // Task 4.06
	int minEl = std::numeric_limits<int>::max();
	int maxEl = std::numeric_limits<int>::min();
	for (size_t i = 0; i < n; i++)
	{
		if (arr[i] > maxEl) maxEl = arr[i];
		if (arr[i] < minEl) minEl = arr[i];
	}
	max = maxEl;
	return minEl;
}
int main()
{
	size_t n;
	std::cin >> n;
	int* arr = new int[n];
	fillArr(n, arr);

	printArrReverse(n, arr);
	printEvenElements(n, arr);
	printAllLessThanAverage(n, arr);

	int maxEl;
	std::cout << "Max element: " << maxEl << ". Min element " << minMaxElement(n, arr, maxEl) << ".\n";

	delete[] arr;

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.07
#include <iostream>
void copy(double* firstArr, double* secondArr, size_t firstArrLen)
{
	for (size_t i = 0; i < firstArrLen; i++)
		secondArr[i] = firstArr[i];

}
int main()
{
	double firstArr[6] = { -3,4,58,12,-4,9 };
	const size_t s = sizeof(firstArr) / sizeof(firstArr[0]);
	const size_t secondArrLen = 2 * s;
	double secondArr[secondArrLen];

	copy(firstArr, secondArr, s);

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.08
#include <iostream>
int* inputArr(size_t n)
{
	int* arr = new int[n];
	for (size_t i = 0; i < n; i++)	
		std::cin >> arr[i];	
	return arr;
}
int findSumDoubleOdd(int* arr, size_t n)
{
	int sum = 0;
	for (size_t i = 0; i < n; i++)
	{
		if (arr[i] % 2 == 0)
		{
			if ((arr[i] / 2) % 2 != 0) sum += arr[i];			
		}
	}
	return sum;
}
int main()
{
	size_t n;
	std::cin >> n;
	int* arr = inputArr(n);
	std::cout<<findSumDoubleOdd(arr, n);
	delete[] arr;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.09
#include <iostream>
bool checkTwoConsqZeroes(int* arr, size_t n)
{
	for (size_t i = 0; i < n - 1; i++)
	{
		if (arr[i] == 0)
		{
			if (arr[i + 1] == 0)
			{
				return true;
			}
		}
	}
	return false;
}
int main()
{
	int arr[] = { -3,2,-45,21,0,4,5,0,0,3,32,-4,0,3 };
	size_t len = sizeof(arr) / sizeof(arr[len]);

	bool check = checkTwoConsqZeroes(arr, len);
	if (check) std::cout << "Yes\n";
	else std::cout << "No\n";

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.10
#include <iostream>
size_t countSeq1_in_Seq2(int* arr1, int* arr2, size_t len1, size_t len2)
{
	size_t count = 0;
	if (len2 < len1) return count;
	else
	{
		for (size_t i = 0; i < len2 - len1+1; i++)
		{
			if (arr2[i] == arr1[0])
			{
				for (size_t j = 1; j < len1; j++)
				{
					if (arr2[i + j] == arr1[j])
					{
						if (j == len1 - 1)
						{
							count++;
							i += j;
							break;
						}						
					}
					else break;					
				}
			}
		}
	}
	return count;
}
int main()
{
	int arr1[] = { 1,2 };
	size_t len1 = sizeof(arr1) / sizeof(arr1[0]);
	int arr2[] = { 0,1,2,3,0,1,2,3,4,3,2,1,2,3,1,2,1,2 };
	size_t len2 = sizeof(arr2) / sizeof(arr2[0]);

	std::cout << countSeq1_in_Seq2(arr1, arr2, len1, len2) << std::endl;

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.11
#include <iostream>
size_t findTrain(int* vec, size_t n, size_t& begin)
{
	size_t maxCount = 0;
	size_t maxBegin = 0;
	for (size_t i = 0; i < n; i++)
	{
		size_t begin = i;
		size_t currCount = 1;
		for (size_t j = begin + 1; j < n; j++)
		{
			if (vec[j] == vec[begin])
			{
				currCount++;
			}
			else
			{
				i += currCount - 1;
				break;
			}
		}
		if (currCount > maxCount)
		{
			maxCount = currCount;
			maxBegin = begin;
		}
	}
	begin = maxBegin;
	return maxCount;
}
int main()
{
	int vec[] = { 1,2,3,4,4,4,4,-3,-6,8,8,8,9,0,0,0,-12,7,7 };
	size_t len = sizeof(vec) / sizeof(vec[0]);

	size_t begin;
	size_t lenTrain = findTrain(vec, len, begin);

	std::cout << "Begining of train at: " << begin << "\n";
	std::cout << "Train length: " << lenTrain << "\n";

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.12
#include <iostream>
bool isArrSymetric(char* arr, size_t len)
{
	for (size_t i = 0; i < (size_t)(len / 2); i++)
	{
		if (arr[i] != arr[len - i - 1])
		{
			return false;
		}
	}
	return true;
}
int main()
{
	char arr[] = { 1,2,4,5,4,2,1 };
	size_t len = sizeof(arr) / sizeof(arr[0]);

	isArrSymetric(arr, len) ? std::cout << "array is symetric\n" :
		std::cout << "array is not symetric\n";

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.13
#include <iostream>
void bubbleSort(int* arr, size_t n)
{ //first way
	while (true)
	{
		bool swapped = false;
		for (size_t i = 0; i < n - 1; i++)
		{
			if (arr[i] > arr[i + 1]) // if descending "<"
			{
				std::swap(arr[i], arr[i + 1]);
				swapped = true;
			}
		}
		if (!swapped) break;		
	}
}
void selectionSort(int* arr, size_t n)
{ //second way
	for (size_t i = 0; i < n - 1; i++)
	{
		size_t min = i;
		for (size_t j = i + 1; j < n; j++)
			if (arr[j] < arr[min]) // if descending ">"
				min = j;
		std::swap(arr[i], arr[min]);
	}
}
void printArr(int* arr, size_t n)
{
	for (size_t i = 0; i < n; i++)	
		std::cout << arr[i] << ' ';	
	std::cout << std::endl;
}
int main()
{
	int arr[15] = { -3,10,1,6,11,2,-2,5,4,8,-1,9,7,0,3 };
	size_t arrLen = sizeof(arr) / sizeof(arr[0]);	
	printArr(arr, arrLen);
	bubbleSort(arr, arrLen);
	//selectionSort(arr, arrLen);
	printArr(arr, arrLen);
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.14
#include <iostream>
int main()
{
	unsigned n;
	std::cin >> n;
	int* arr = new int[n];
	for (unsigned i = 0; i < n; i++)
	{
		std::cin >> arr[i];
	}
	int newArrLen = n * n;
	int* carProdArr = new int[newArrLen];
	int k(0);
	for (unsigned i = 0; i < n; i++)
	{
		for (unsigned j = 0; j < n; j++)
		{
			carProdArr[k] = arr[i] * arr[j];
			k++;
		}
	}
	for (unsigned i = 0; i < newArrLen; i++)
	{
		std::cout << carProdArr[i] << ' ';
	}
	delete[] arr;
	delete[] carProdArr;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.15
#include <iostream>
#include <climits>
int myAbs(int a)
{
	return a > 0 ? a : -a;
}
void bubbleSort(int* arr, unsigned arrLen)
{
	while (true)
	{
		bool swapped = false;
		for (unsigned index = 0; index < arrLen - 1; index++)
		{
			if (arr[index] > arr[index + 1])
			{
				std::swap(arr[index], arr[index + 1]);
				swapped = true;
			}
		}
		if (!swapped) break;
	}
}
int findMinAbsVal(int* arr, unsigned n)
{
	int minAbs = INT_MAX;
	for (unsigned i = 0; i < n - 1; i++)
	{
		if (arr[i] - arr[i + 1] == 0)
		{
			return 0;
		}
		else if (myAbs(arr[i] - arr[i + 1]) < minAbs)
		{
			minAbs = myAbs(arr[i] - arr[i + 1]);
		}
	}
	return minAbs;
}
int main()
{
	unsigned n;
	std::cin >> n;
	if (n==1)
	{
		std::cout << 0;
		return 0;
	}
	int* arr = new int[n];
	for (unsigned i = 0; i < n; i++)
	{
		std::cin >> arr[i];
	}
	bubbleSort(arr, n);
	std::cout << findMinAbsVal(arr, n);
	delete[] arr;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.16 & 4.17
#include <iostream>
#include <vector>
#include <algorithm>
double median(double* arr, size_t n)
{ //Task 4.16
	double median;
	if (n % 2 == 0) median = (arr[n / 2 - 1] + arr[n / 2]) / 2.0;
	else median = arr[n / 2];
	return median;
}
std::vector<double> modes(double* arr, size_t n)
{ //Task 4.17 - brute force method without sorting data
	std::vector<double>modes;
	size_t maxCount(0);
	double maxCountEl;
	for (size_t i = 0; i < n; i++)
	{
		size_t currCount(0); double currEl(0.0);
		currEl = arr[i];
		for (size_t j = 0; j < n; j++)
			if (currEl == arr[j]) currCount++;
		if (currCount >= maxCount)
		{
			if (currCount == maxCount)
			{
				if (std::find(modes.begin(), modes.end(), currEl) != modes.end()) continue;
				else modes.push_back(currEl);
			}
			else
			{
				modes.clear();
				modes.push_back(currEl);
				maxCount = currCount;
				maxCountEl = arr[i];
			}
		}
	}
	return modes;
}
int main()
{
	double arr[5] = { 1,2,3,5,1};
	size_t arrLen = sizeof(arr) / sizeof(arr[0]);

	std::cout << "Median of the statistical order is: " << median(arr, arrLen)
		<< ";\n";
	std::vector<double> newModes = modes(arr, arrLen);

	if (newModes.size() == 1) std::cout << "Mode of the statistical order is : " << newModes[0] << '.';
	else if (newModes.size() < arrLen)
	{
		std::cout << "Modes of the statistical order are : ";
		for (size_t i = 0; i < newModes.size(); i++)
		{
			if (i == newModes.size() - 1)
			{
				std::cout << newModes[i];
				break;
			}
			std::cout << newModes[i] << ", ";
		}
		std::cout << '.';
	}
	else std::cout << "The statistical order has no modes.";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.17 second way - sorting the data
#include <iostream>
void bubbleSort(double* arr, size_t n)
{
	while (true)
	{
		bool swapped = false;
		for (size_t i = 0; i < n - 1; i++)
		{
			if (arr[i] > arr[i + 1])
			{
				std::swap(arr[i], arr[i + 1]);
				swapped = true;
			}
		}
		if (!swapped) break;
	}
}
void modes(double* arr, size_t n)
{
	double* modes = new double[n]; // maximum n-1 modes (if n modes, then no mode)
	size_t indexModes = 0;
	bubbleSort(arr, n); // sorting the aray
	size_t maxCount(0), currCount(0);
	double maxCountEl, currCountEl;

	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = i; j < n; j++)
		{
			if (arr[i] == arr[j])
			{
				currCountEl = arr[i];
				currCount++;
			}
			else break;
		}
		if (currCount >= maxCount)
		{
			maxCountEl = currCountEl;
			if (currCount > maxCount)
			{
				indexModes = 0;
				maxCount = currCount;				
				modes[indexModes] = maxCountEl;
				indexModes++;
			}
			else
			{
				modes[indexModes] = maxCountEl;
				indexModes++;
			}
		}
		i = i + currCount-1;
		currCount = 0;
	}
	for (size_t i = 0; i < indexModes; i++)
	{
		std::cout << modes[i] << ' ';
	}
	delete[] modes;
}
int main()
{
	double arr[6] = { 2,-3,4.5,6,4.5,2 };
	size_t arrLen = sizeof(arr) / sizeof(arr[0]);
	modes(arr, arrLen);
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.18
#include <iostream>
void fillArr(size_t n, int* arr)
{
	for (size_t i = 0; i < n; i++)
	{
		int num;
		std::cin >> num;
		arr[i] = num;
	}
}
bool hacksawNums(int a0, int a1, int a2, size_t rem)
{
	if (rem == 1)
	{
		if (a0<a1&&a1>a2)
		{
			return true;
		}
	}
	else
	{
		if (a0 > a1&&a1 < a2)
		{
			return true;
		}
	}
	return false;
}
bool isHacksaw(size_t n, int* arr)
{
	if (n == 1) return true;
	else if (n == 2)
	{
		if (arr[0] != arr[1]) return true;
	}
	else
	{
		bool firstTypeCheck = hacksawNums(arr[0], arr[1], arr[2], 0);
		bool secondTypeCheck = hacksawNums(arr[0], arr[1], arr[2], 1);
		if (firstTypeCheck)
		{
			for (size_t i = 1; i < n - 1; i++)
			{
				if (hacksawNums(arr[i - 1], arr[i], arr[i + 1], (i + 1) % 2))
				{
					if (i == n - 2)
					{
						return true;
					}
					continue;
				}
			}
		}
		if (secondTypeCheck)
		{
			for (size_t i = 1; i < n - 1; i++)
			{
				if (hacksawNums(arr[i - 1], arr[i], arr[i + 1], i % 2))
				{
					if (i == n - 2)
					{
						return true;
					}
					continue;
				}
			}
		}
	}
	return false;
}
int main()
{
	size_t n;
	std::cin >> n;
	int* arr = new int[n];
	fillArr(n, arr);

	if (isHacksaw(n, arr))
	{
		std::cout << "Hacksaw sequence: YES";
	}
	else
	{
		std::cout << "Hacksaw sequence: NO";;
	}
	delete[] arr;

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.19
#include <iostream>
size_t myStrLen(const char* str)
{
	size_t len;
	for (len = 0; str[len] != '\0'; len++) {}
	return len;
}
bool isDigit(const char symbol)
{
	return (symbol >= '0' && symbol <= '9');
}
bool checkDate(const char* text)
{
	size_t len = myStrLen(text);
	if (len != 5) return false;
	if (!isDigit(text[0]) || !isDigit(text[1])) return false;
	if (text[2] != '.') return false;
	if (!isDigit(text[3]) || !isDigit(text[4])) return false;

	size_t days = (text[0] - '0') * 10 + text[1] - '0';
	size_t months = ((text[3] - '0') * 10 + text[4] - '0');
	if (months < 1 || months>12) return false;
	size_t maxDaysPerMonth[] =
	{
		0,
		31, 29, 31, 30, 31, 30,
		31, 31, 30, 31, 30, 31
	};
	return days <= maxDaysPerMonth[months];
}
int main()
{
	const char* str1 = "22.12";
	const char* str2 = "31.02";
		
	std::cout << checkDate(str1)<<std::endl;
	std::cout << checkDate(str2) << std::endl;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.20 
#include <iostream> 
int binarySearch1(int arr[], int l, int r, int x)
{/* A iterative binary search function. It returns location of x
 in given array arr[l..r] if present, otherwise -1. First way */
	while (l <= r) 
	{
		int m = l + (r - l) / 2;
		if (arr[m] == x) return m; // Check if x is present at mid 
		if (arr[m] < x) l = m + 1; // If x greater, ignore left half 
		else r = m - 1; // If x is smaller, ignore right half 
	}
	return -1; // if we reach here, then element was not present
}
int binarySearch2(int arr[], int l, int r, int x)
{ //Second way, with recursion
	if (r >= l)
	{
		int mid = l + (r - l) / 2;
		if (arr[mid] == x) return mid; // If the element is present at the middle itself 
		// If element is smaller than mid, then it can only be present in left subarray
		if (arr[mid] > x) return binarySearch(arr, l, mid - 1, x);
		// Else the element can only be present in right subarray 
		return binarySearch(arr, mid + 1, r, x);
	}	
	return -1; // We reach here when element is not present in array 
}
int main()
{
	int arr[] = { 4, -3, 8, 2, 19 };
	int x = 8;
	size_t n = sizeof(arr) / sizeof(arr[0]);
	int result = binarySearch1(arr, 0, n - 1, x);
	//int result = binarySearch2(arr, 0, n - 1, x);
	(result == -1) ? std::cout << "Element is not present in array"
		: std::cout << "Element is present at index " << result;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.21 first way
#include <iostream>
size_t indexLongestIncreasingSubsequence(int* arr, size_t arrLen, size_t& len)
{
	size_t currCount(0), currIndex, maxCount(0), maxIndex(0);
	for (size_t i = 0; i < arrLen; i++)
	{
		currIndex = i;
		for (size_t j = i; j < arrLen; j++)
		{
			if (arrLen - i <= maxCount) goto end; // optimization
			if (arr[j] < arr[j + 1]) currCount++;
			else
			{
				i = j;
				break;
			}
		}
		if (currCount > maxCount)
		{
			maxCount = currCount;
			maxIndex = currIndex;
		}
		currIndex = 0;
		currCount = 0;
	}
end:len = maxCount;
	return maxIndex;
}
void print(int* arr, size_t s, size_t e)
{
	for (size_t i = s; i <= s + e; i++)
		std::cout << arr[i] << ' ';
	std::cout << std::endl;
}
int main()
{
	int arr[] = { 1,2,3,1,2,3,4,5,1,2,3,4};
	size_t arrLen = sizeof(arr) / sizeof(arr[0]);

	size_t end;
	size_t start = indexLongestIncreasingSubsequence(arr, arrLen, end);
	std::cout << "The longest increasing subsequence is: ";
	print(arr, start, end);
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.21 second way
#include <iostream>
struct Range
{
	const int *begin, *end;
	int len() const
	{
		return end - begin;
	}
};
Range longestSeq(const int* first, const int* last)
{
	Range r{ nullptr,nullptr }, t;
	while (first < last)
	{
		t.begin = first;
		while (++first != last)
			if (*(first - 1) > *first) break;
		t.end = first;
		if (r.len() < t.len()) r = t;
	}
	return r;
}
int main()
{
	int a[] = { 8, 19, 3, 5, 7, 4, 8, 9, 19 ,-5 ,3 };
	size_t n = sizeof(a) / sizeof(a[0]);
	for (auto r = longestSeq(a, a + n); r.begin != r.end; ++r.begin)
		std::cout << *r.begin << ' ';
	std::cout << std::endl;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.22
#include <iostream>
void printArr(int* arr, int length)
{
	for (int i = 0; i < length; i++)
		std::cout << arr[i] << ' ';
	std::cout << std::endl;
}
void printAllAdditives(int* arr, size_t arrLen, int targetSum)
{
	int* additives = new int[arrLen];
	for (size_t i = 0; i < arrLen; i++)
	{
		for (size_t k = 0; k < arrLen - i; k++)
		{
			int currentIndex = 0;
			int currentSum = targetSum;
			for (size_t j = i; j < arrLen; j++)
			{
				if (currentSum - arr[j] >= 0)
				{
					additives[currentIndex] = arr[j];
					currentIndex++;
					currentSum -= arr[j];
				}
				/* This is the first iteration of the j loop and arr[j] is part of a potential combination;*/
				if (j == i && currentIndex == 1) j += k;				
				/* there's no point in going further if arr[j] is not part of a combination*/
				else if (j == i)
				{
					k = arrLen;
					break;
				}
			}
			if (currentSum == 0)
			{
				printArr(additives, currentIndex);
			}
		}
	}
	delete[] additives;
}
int main()
{
	int arr[] = { 2,8,-6,9,7,3,5,-9,-4,7,6,2,11 };
	size_t arrLen = sizeof(arr) / sizeof(arr[0]);

	printAllAdditives(arr, arrLen, 22);

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.23
#include <iostream>
size_t* checkNums(long num1, long num2, size_t& commonDigitsLength)
{
	size_t* commonDigits = new size_t[10];
	size_t currentIndex = 0;

	for (long currentNum1 = num1; currentNum1 != 0; currentNum1 /= 10)
	{
		size_t digit1 = currentNum1 % 10;

		bool isDigitAlreadyAdded = false;
		for (size_t i = 0; i < currentIndex; i++)
		{
			if (commonDigits[i] == digit1)
			{
				isDigitAlreadyAdded = true;
				break;
			}
		}
		if (isDigitAlreadyAdded) continue;
		for (long currentNum2 = num2; currentNum2 != 0; currentNum2 /= 10)
		{
			long digit2 = currentNum2 % 10;
			if (digit1 == digit2)
			{
				commonDigits[currentIndex] = digit1;
				currentIndex++;
				break;
			}
		}
	}
	commonDigitsLength = currentIndex;
	return commonDigits;
}
int main()
{
	size_t len;
	size_t* arr = checkNums(12345690, 3456780, len);
	for (size_t i = 0; i < len; i++)
		std::cout << arr[len - i - 1] << ' ';
	delete[] arr;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.24
#include <iostream>
bool isSubset(int arr1[], size_t n1, int arr2[], size_t n2)
{
	if (n2 > n1) return false;	
	else
	{
		for (size_t i = 0; i < n2; i++)
		{
			bool contains = false;
			for (size_t j = 0; j < n1; j++)
				if (arr2[i] == arr1[j]) contains = true;
			if (contains) continue;
			else return false;
		}
		return true;
	}
}
int main()
{
	int arr1[] = { 1,2,3,4,5,6 };
	size_t len1 = sizeof(arr1) / sizeof(arr1[0]);
	int arr2[] = { 5,1,2 };
	size_t len2 = sizeof(arr2) / sizeof(arr2[0]);
	bool subset = isSubset(arr1, len1, arr2, len2);
	if (subset) std::cout << "is subset";
	else std::cout << "is not subset";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.25 
#include <iostream> 
unsigned partition(int* arr, unsigned start, unsigned end)
{
	int pivot = arr[end]; // pick rightmost element as pivot from the array
	/* elements less than pivot will be pushed to the left of pIndex
	   elements more than pivot will be pushed to the right of pIndex
	   equal elements can go either way */
	unsigned pIndex = start;
	/* each time we finds an element less than or equal to pivot, pIndex
	  is incremented and that element would be placed before the pivot. */
	for (unsigned i = start; i < end; i++)
	{
		if (arr[i] <= pivot)
		{
			std::swap(arr[i], arr[pIndex]);
			pIndex++;
		}
	}
	std::swap(arr[pIndex], arr[end]); // swap pIndex with Pivot	
	return pIndex; // return pIndex (index of pivot element)
}
void quickSort(int* arr, int start, int end)
{
	if (start >= end) return; // base condition		
	unsigned pivot = partition(arr, start, end); // rearrange the elements across pivot	
	// recursion on sub-array containing elements that are less than pivot
	quickSort(arr, start, pivot - 1);
	// recursion on sub-array containing elements that are more than pivot
	quickSort(arr, pivot + 1, end);
}
int* inputData(int& len)
{
	std::cin >> len;
	int* arr = new int[len];
	for (int i = 0; i < len; i++) std::cin >> arr[i];
	return arr;
}
int main()
{
	int n;
	int* arr = inputData(n);
	quickSort(arr, 0, n - 1);

	// for (int i = 0; i < n; i++) std::cout << arr[i] << ' ';
	int* res = new int[n];
	int indx(0), size(0);
	unsigned maxCount(0);
	static int i = 0;
	for (i; i < n; i++)
	{
		unsigned currCount(0);
		int currEl = arr[i];
		for (int j = i; j < n; j++)
		{
			if (arr[j] == arr[i])
			{
				currCount++;
				if (currCount == maxCount)
				{
					size++;
					res[indx++] = arr[j];
				}
				else if (currCount > maxCount)
				{
					indx = 0; size = 1;
					res[indx++] = arr[j];
					maxCount = currCount;
				}
			}
			else
			{
				i += currCount - 1;
				break;
			}
			if (j == n - 1)
			{
				goto END;
			}
		}
	}
END:
	for (int i = 0; i < size; i++)
	{
		std::cout << res[i] << ' ';
	}
	delete[] arr;
	delete[] res;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.25 second way using <vector> and <algorithm>
#include <iostream> 
#include <vector>
#include <algorithm>
int main()
{
	int n;
	std::vector<int> arr;
	std::cin >> n;
	for (int i = 0; i < n; i++)
	{
		int el;
		std::cin >> el;
		arr.push_back(el);
	}
	sort(arr.begin(),arr.end());
	std::vector<int> res;
	unsigned maxCount(0);
	static int i = 0;
	for (i; i < n; i++)
	{
		unsigned currCount(0);
		for (int j = i; j < n; j++)
		{
			if (arr[j] == arr[i])
			{
				currCount++;
				if (currCount == maxCount) res.push_back(arr[j]);				
				else if (currCount > maxCount)
				{
					res.clear();
					res.push_back(arr[j]);
					maxCount = currCount;
				}
			}
			else
			{
				i += currCount - 1;
				break;
			}
			if (j == n - 1)	goto END;			
		}
	}
END:
	unsigned SIZE = res.size();
	for (unsigned i = 0; i < SIZE; i++) std::cout << res[i] << ' ';
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.26
#include <iostream>
void printArr(int* arr, size_t len)
{
	for (size_t i = 0; i < len; i++) std::cout << arr[i] << ' ';
	std::cout << std::endl;
}
int* newSortedSequence(int* arr1, size_t arrLen1, int* arr2, size_t arrLen2)
{
	size_t arrLen3 = arrLen1 + arrLen2;
	int* arr3 = new int[arrLen3];
	size_t indx1(0), indx2(0), indx3(0);

	while (indx1 < arrLen1 && indx2 < arrLen2)
	{ // will cycle until one of the two sequences ends
		if (arr1[indx1] > arr2[indx2])
		{
			arr3[indx3] = arr2[indx2];
			indx2++;
			indx3++;
		}
		else
		{
			arr3[indx3] = arr1[indx1];
			indx1++;
			indx3++;
		}
	}
	for (indx1; indx1 < arrLen1; indx1++)
	{ // will enter here if the second sequence ends first
		arr3[indx3] = arr1[indx1];
		indx3++;
	}
	for (indx2; indx2 < arrLen2; indx2++)
	{ // will enter here if the first sequence ends first
		arr3[indx3] = arr2[indx2];
		indx3++;
	}
	return arr3;
}
int main()
{
	int arr1[] = { 1,7,13,17 };
	int arr2[] = { 3,9 };
	size_t arrLen1, arrLen2;

	arrLen1 = sizeof(arr1) / sizeof(arr1[0]);
	arrLen2 = sizeof(arr2) / sizeof(arr2[0]);

	printArr(arr1, arrLen1);
	printArr(arr2, arrLen2);

	int* arr3 = newSortedSequence(arr1, arrLen1, arr2, arrLen2);
	printArr(arr3, arrLen1 + arrLen2);

	delete[] arr3;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.27
#include <iostream>
size_t countPrimeDivisors(size_t n)
{
	size_t count(0), i(2);
	while (n != 1)
	{
		if (n%i == 0)
		{
			n /= i;
			count++;
			i = 1;
		}
		i++;
	}
	return count;
}
size_t* divisors(size_t n, size_t count, bool& checkKorslet)
{
	size_t num = n;
	size_t* primeDiv = new size_t[count];

	size_t i = 2;
	size_t j = 0;

	while (n != 1)
	{
		if (n%i == 0)
		{
			n /= i;
			primeDiv[j] = i;
			i = 1;
			j++;
		}
		i++;
	}
	bool squareFree = true;
	for (size_t i = 0; i < count - 1; i++)
	{
		if (primeDiv[i] == primeDiv[i + 1])
		{
			squareFree = false;
			break;
		}
	}
	checkKorslet = true;
	for (size_t i = 0; i < count; i++)
	{
		if ((num - 1) % (primeDiv[i] - 1) != 0)
		{
			checkKorslet = false;
		}
	}
	return primeDiv;
}
int main()
{
	size_t n;
	std::cin >> n;

	size_t count = countPrimeDivisors(n);

	bool checkKorslet;

	size_t* arr = divisors(n, count, checkKorslet);

	if (count > 1 && checkKorslet)
	{
		std::cout << "Number " << n << " = ";
		for (size_t i = 0; i < count; i++)
		{
			if (i != count - 1) std::cout << arr[i] << ".";
			else std::cout << arr[i];
		}
		std::cout << " is a Carmichael's number!";
	}
	else
	{
		std::cout << "Number " << n << " = ";
		for (size_t i = 0; i < count; i++)
		{
			if (i != count - 1) std::cout << arr[i] << ".";
			else std::cout << arr[i];
		}
		std::cout << " is not a Carmichael's number.";
	}
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.28 & 4.29 & 4.30
#include <iostream>
#include <cmath>
double* definePoly(char& symbol, char& coef, int& k)
{
	std::cout << "deg(" << symbol << "(x)) = ";
	std::cin >> k;
	symbol++;
	double* a = new double[k + 1];
	for (int i = k; i >= 0; i--)
	{
		std::cout << coef << "_{" << i << "} = ";
		std::cin >> a[i];
	}
	coef++;
	return a;
}
void printPoly(int n, double* P, char& symbol)
{
	symbol--;
	std::cout << symbol << "(x)=";
	for (int i = n; i >= 0; i--)
	{
		if (P[i] != 0)
		{
			if (P[i] > 0)
			{
				std::cout << '+';
			}
			std::cout.setf(std::ios::fixed);
			std::cout.precision(2);
			std::cout << P[i] << ".x^{" << i << "}";
		}
	}
	std::cout << "\n";
	symbol++;
}
double* sumPoly(double* a, int n, double* b, int m, char& symbol)
{ 	// Task 4.27
	symbol++;
	double* c = new double[(n + m + abs(n - m)) / 2 + 1];
	if (n > m)
	{
		for (int i = 0; i <= m; i++) c[i] = a[i] + b[i];
		for (int i = m + 1; i <= n; i++) c[i] = a[i];
	}
	else if (n < m)
	{
		for (int i = 0; i <= n; i++) c[i] = a[i] + b[i];
		for (int i = n + 1; i <= m; i++) c[i] = b[i];
	}
	else for (int i = 0; i <= n; i++)c[i] = a[i] + b[i];
	return c;
}
double* prodPoly(double* a, int n, double* b, int m, char& symbol)
{ 	// Task 4.28
	symbol++;
	double* d = new double[n + m + 1];
	for (int p = 0; p <= n + m; p++)
	{
		d[p] = 0;
		for (int i = 0; i <= n; i++)
			for (int j = 0; j <= m; j++)
				if (i + j == p) d[p] = d[p] + a[i] * b[j];
	}
	return d;
}
double* powPoly(double* a, int n, int m, char& symbol)
{ 	// Task 4.29
	symbol++;
	if (m == 0)
	{
		double* powPoly = new double[1];
		powPoly[0] = 1;
		return powPoly;
	}
	else if (m == 1)
	{
		double* powPoly = new double[n + 1];
		for (int i = 0; i < n + 1; i++)
		{
			powPoly[i] = a[i];
		}
		return powPoly;
	}
	else
	{
		double* tempPoly = new double[m*n + 1];
		for (int i = m * n; i > 0; i--)
		{
			tempPoly[i] = 0;
		}
		tempPoly[0] = 1;

		double* powPoly = nullptr;

		for (int i = 0; i < m; i++)
		{
			powPoly = prodPoly(tempPoly, m*n + 1, a, n, symbol);
			delete[] tempPoly;
			tempPoly = powPoly;
		}
		return powPoly;
	}
}
int main()
{
	int n;
	int m;
	char symbol('P'), coef('a');

	double* firstPoly = definePoly(symbol, coef, n);
	printPoly(n, firstPoly, symbol);

	double* secondPoly = definePoly(symbol, coef, m);
	printPoly(m, secondPoly, symbol);

	double* sum = sumPoly(firstPoly, n, secondPoly, m, symbol);
	std::cout << "Sum:\n";
	printPoly((n + m + abs(n - m)) / 2, sum, symbol);

	double* prod = prodPoly(firstPoly, n, secondPoly, m, symbol);
	std::cout << "Product:\n";
	printPoly(n + m, prod, symbol);

	size_t k;
	std::cout << "Enter power:\n";
	std::cin >> k;

	double* pow = powPoly(firstPoly, n, k, symbol);
	std::cout << "Power:\n";
	printPoly(n*k, pow, symbol);

	delete[] firstPoly;
	delete[] secondPoly;
	delete[] sum;
	delete[] prod;
	delete[] pow;

	return 0;
}
