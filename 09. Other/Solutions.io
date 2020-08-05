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
