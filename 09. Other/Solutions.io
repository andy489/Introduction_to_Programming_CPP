//Task 9.01
#include <iostream>
#include <ctime>
#include <string>
int main()
{
	struct std::tm a = { 0,0,0,22,11,88 }; /* December 22, 1988 */
	struct std::tm b = { 0,0,0,7,6,119 }; /* July 7, 2019 */
	std::time_t x = std::mktime(&a);
	std::time_t y = std::mktime(&b);
	if (x != (std::time_t)(-1) && y != (std::time_t)(-1))
	{
		double difference = std::difftime(y, x) / (60 * 60 * 24);
		char str1[26];
		asctime_s(str1, 26, &a); //ctime_s(str1, 26, &x);
		char str2[26];
		asctime_s(str2, 26, &b); //ctime_s(str1, 26, &y);
		std::cout << str1 << std::endl;
		std::cout << str2 << std::endl;
		std::cout << "difference = " << difference << " days" << std::endl;
	}
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 9.02
#include <iostream>
#include <cmath>
void allPossibleSubset(int arr[], size_t n)
{
	size_t count = (size_t)(pow(2, n));
	/* The outer for loop will run 2^n times to print all subset .
	   Here variable i will act as a binary counter */
	for (size_t i = 0; i < count; i++)
	{
		   /* The inner for loop will run n times , As the maximum number of elements a set can have is n
		   This loop will generate a subset */
		for (size_t j = 0; j < n; j++)
		{
			 /* This if condition will check if jth bit in binary representation of  i  is set or not
			 if the value of (i & (1 << j)) is greater than 0 , include arr[j] in the current subset
			 otherwise exclude arr[j] */
			if ((i & (1 << j)) > 0)
				std::cout << arr[j] << " ";
		}
		std::cout << "\n";
	}
}
int main()
{
	size_t n;
	std::cout << "Enter size of the set\n";
	std::cin >> n;

	int* arr = new int[n];
	std::cout << "Enter Elements of the set\n";
	for (size_t i = 0; i < n; i++)
		std::cin >> arr[i];
	allPossibleSubset(arr, n);
	delete[] arr;

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 9.03
#include <iostream>
bool isPowOf2(int n) // a)
{ // binary check (Leibniz 1679)
	return n && (!(n&(n - 1)));
}
bool isPowerOf(int n, int a)
{ // general algorithm for checking if a number (n) is power of another number (a)
	if (n > 1)
	{
		while (n % a == 0)
		{
			n /= a;
		}
	}
	return n == 1;
}
bool isPerfSquare(int n) // b)
{
	if (n < 0)
		return false;
	int root(round(sqrt(n)));
	return n == root * root;
}
bool isPerfCube(int n)
{
	int root(round(cbrt(n)));
	return n == root * root * root;
}
bool isFibonacci(int n) // c)
{ // n is Fibinacci if one of 5*n*n + 4 or 5*n*n - 4 or both is a perferct square 
	return isPerfSquare(5 * n*n + 4) || isPerfSquare(5 * n*n - 4);
}
int main()
{
	char text[] = { "Perhaps the most intriguing number pattern in mathematics is the Fibonacci sequence." };
	size_t len = sizeof(text) / sizeof(text[0]);

	for (int i = 0; i < len; i++)
	{
		if (isPowOf2(i) || isPerfSquare(i) || isFibonacci(i))
			std::cout << text[i] << ' ';
	}

	return 0;
}
