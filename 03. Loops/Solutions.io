//Task 3.20 first way
#include <iostream>
double myPower(double a, unsigned n)
{
	if (n == 0)	return 1;
	if (n == 1)	return a;
	if (n % 2 == 0)
	{
		double result = myPower(a, n / 2);
		return result * result;
	}
	else return a * myPower(a, n - 1);
}
int main()
{
	int n;
	std::cin >> n;
	unsigned countZeros(0);
	int i = 1;
	while (n / i >= 1)
	{
		countZeros += (int)(n / myPower(5, i));
		/* Since there are many more numbers that are even
		than are multiplies of 5, we need to count all the 5's
		in the prime factorization (10 also includes 5 in it
		so we will not worry about it) */
		i++;
	}
	std::cout << countZeros;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.20 second way
#include <iostream> 
int findTrailingZeros(int n)
{   // Keep dividing n by powers of 5 and update count 
	int count = 0;
	for (int i = 5; n / i >= 1; i *= 5) count += n / i;
	return count;
}
int main()
{
	int n;
	std::cin >> n;
	std::cout << findTrailingZeros(n);
	return 0;
}
