//Task 3.16
#include <iostream>
#include <string>
int main()
{
	size_t guess = 512;
	size_t nextIncr = 512;
	size_t countQuestion(1);
	std::string answer;
	while (nextIncr != 1 || answer != "that's the number!")
	{
		std::cout << countQuestion << ". Is your number bigger than " << guess << " ?\n";
		std::getline(std::cin, answer);
		nextIncr /= 2;
		countQuestion++;
		if (answer == "yes")
		{
			guess += nextIncr;
		}
		else if (answer == "no")
		{
			guess -= nextIncr;
		}
		else if (answer == "that's the number")
		{
			std::cout << "the number written on the sheet is: " << guess << "\n";
			return 0;
		}
	}
	return 0;
} //extra question answer: 10; The program will always quess the number in no more than 10 guesses, because 2^10=1024>1000.
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.17
#include <iostream>
double myAbs(double a)
{
	return a < 0 ? -a : a;
}
double calc(double a, double b,	double eps, long end)
{
	double xk1 = a;
	double xk2 = b;
	double xk = 0;
	for (long k = 3; myAbs(xk1 - xk2) >= eps; k++)
	{
		xk = (1.0/5) * (xk1 + xk1 / xk2);
		xk2 = xk1;
		xk1 = xk;
		if (k > end) return -1;		
	}
	return xk;
}
int main()
{
	std::cout << calc(2, 3, 0.001, 100);
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.18
#include <iostream>
double myAbs(double a) { return a > 0 ? a : -a; }
double calcNepierConst(double x, double eps)
{
	double x1(1), S(1);
	size_t i(0);
	while (myAbs(x1) >= eps)
	{
		i++;
		x1 *= x / i; // building collectible
		S += x1; // adding collectible to the sum "S"
	}
	return S;
}
int main()
{
	double x, eps;
	std::cin >> x >> eps;

	std::cout << calcNepierConst(x, eps) << std::endl;
	//for finding aproximation of e, just put x=1, eps=0.00001
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.19
#include <iostream>
#include <cmath>
int main()
{
	size_t n = 1;
	while (true)
	{
		size_t curri, currj;
		size_t count(0);
		for (size_t i = 1; i <= std::pow(n, 1.0 / 3); i++)
		{
			for (size_t j = 1; j <= std::pow(n, 1.0 / 3); j++)
			{
				if (pow(i, 3) + pow(j, 3) == n)
				{
					if (count == 0)
					{
						curri = i; currj = j;
					}
					count++;
					if (count == 3)
					{
					        std::cout << "The smallest number,\n";
					        std::cout << "expressible as the sum of two cubes in two different ways is:\n";
					        std::cout << n <<"\n";						
					        std::cout << n <<"="<<curri<<"^{3}+"<<currj<<"^{3}="<<j<<"^{3}+"<<i<<"^{3}\n";
					        return 0;
					}
				}
			}
		}
		n++;
	}
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
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
