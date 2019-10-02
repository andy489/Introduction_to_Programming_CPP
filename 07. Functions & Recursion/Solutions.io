//Task 7.01
#include <iostream>
#include <cmath>
int abs(int a)
{
	return a > 0 ? a : -a;
}
int min(int a, int b)
{
	return (a + b - abs(a - b)) / 2;
}
int min(int a, int b, int c)
{
	return min(min(a, b), min(b, c));
}
bool isPrime(int a)
{
	int num = abs(a);
	for (int i = 2; i <=sqrt(num); i++)
		if (a%i == 0)
			return false;
	return true;
}
bool func(int a, int b, int c)
{
	return isPrime(min(a, b, c));
}
int main()
{
	int a, b, c;
	std::cin >> a >> b >> c;

	func(a, b, c) ? std::cout << "smallest number is prime" : std::cout << "smallest number is not prime";

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 7.02
#include <iostream>
bool digitCheck(char a)
{
	if (a >= '0' && a <= '9') return true;
	return false;
}
bool letterCheck(char a)
{
	if ((a >= 'a' && a <= 'z') || (a >= 'A' && a <= 'Z'))return true;
	return false;
}
bool digitOrLetterCheck(char a)
{
	if (letterCheck(a) || digitCheck(a))return true;
	return false;
}
int main()
{
	char a;
	std::cin >> a;
	digitOrLetterCheck(a) ? std::cout << "Character is a digit or a letter" :
		std::cout << "Character is neiter digit nor letter";
	return 0;
}

-------------------------------------------------------------------------------------------------------------------------------
//Task 7.03
#include <iostream>
#include <cmath>
double getDistance(double x1, double y1, double x2, double y2)
{
	return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
}
int main()
{
	double x1, y1, x2, y2;
	std::cin >> x1 >> y1 >> x2 >> y2;
	std::cout.setf(std::ios::fixed);
	std::cout.precision(2);
	std::cout << getDistance(x1, y1, x2, y2);
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 7.04
#include <iostream>
bool collinear(double x1, double y1, double x2, double y2, double x3, double y3)
{   //if the area of the triangle is 0 then the three point are collinear
	double a = x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2);
	// we skip multiplication with 0.5 
	if (a == 0) return true;
	else return false;
}
int main()
{
	double x1 = 2.0, x2 = 2.0, x3 = 2.0, y1 = 5.0, y2 = 8.0, y3 = 10.5;
	collinear(x1, y1, x2, y2, x3, y3)?std::cout<<"collinear":std::cout<<"not collinear";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 7.05
#include <iostream>
#include <cmath>
double vectorLen(double x, double y, double z)
{   
	return sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));
}
int main()
{
	double x, y, z;
	std::cin >> x >> y >> z;
	std::cout << vectorLen(x, y, z);
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 7.06
#include <iostream>
double karPow(double x, int n)
{ // Karatsuba algorithm
	if (n == 0)		return 1;
	if (n == 1)		return x;
	if (n > 0)
	{
		if (n % 2 == 0) return karPow(x, n / 2)*karPow(x, n / 2);
		else return x * karPow(x, n - 1);
	}
	else return 1 / karPow(x, abs(n));	
}
int main()
{
	std::cout << karPow(3, -2) << std::endl;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 7.07
#include <iostream>
#include <cmath>
size_t fib1(size_t n)
{ // first way - using recursion
	if (n == 0) return 0;
	if (n == 1) return 1;
	else return fib1(n - 1) + fib1(n - 2);
}
size_t fib2(size_t n)
{ // second way - solving the characteristical polynomial of the sequence
	double root1 = (1 + sqrt(5)) / 2;
	return (size_t)((pow(root1, n) - 1 / pow(-root1, n))/sqrt(5));
}
size_t fib3(size_t n)
{ // third way - cycling
	size_t f1(0), f2(1), f3;
	if (n == 0)	return f1;
	for (size_t i = 2; i <= n; i++)
	{
		f3 = f2 + f1;
		f1 = f2;
		f2 = f3;
	}
	return f2;
}
int main()
{
	size_t n;
	std::cin >> n;
	std::cout << fib1(n) << std::endl;
	std::cout << fib2(n) << std::endl;
	std::cout << fib3(n) << std::endl;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 7.08
#include <iostream>
#include <cmath>
int tribonacci1(int n)
{   // first way - using recursion
	if (n == 0)return 0;
	if (n == 1 || n == 2) return 1;
	else return tribonacci1(n - 1) + tribonacci1(n - 2) + tribonacci1(n - 3);
}
int tribonacci2(int n)
{   // second way - solving the characteristical polynomial of the sequence
	double var1 = 1 / 3.0*pow(19 + 3 * sqrt(33), 1 / 3.0);
	double var2 = 1 / 3.0*pow(19 - 3 * sqrt(33), 1 / 3.0);
	double var3 = pow(586 + 102 * sqrt(33), 1 / 3.0);
	double var4 = pow(586 + 102 * sqrt(33), 2 / 3.0);
	double var5 = pow(586 + 102 * sqrt(33), 1 / 3.0);
	return (int)((3 * pow(var1 + var2 + 1 / 3.0, n)*(var3)) / (var4 + 4 - 2 * var5) + 0.5);
}
int tribonacci3(int n)
{   // third way - cycling
	size_t tri0(0), tri1(1), tri2(1),tri3;
	if (n == 0)	return tri0;
	if (n == 1)	return tri1;
	if (n == 2)	return tri2;
	for (int i = 3; i <= n; i++)
	{
		tri3 = tri2 + tri1 + tri0;
		tri0 = tri1;
		tri1 = tri2;
		tri2 = tri3;
	}
	return tri2;
}
int main()
{
	int n;
	std::cin >> n;
	for (int i = 0; i < n; i++)	std::cout << tribonacci1(i) << ' ';
	std::cout << std::endl;
	for (int i = 0; i < n; i++)	std::cout << tribonacci2(i) << ' ';
	std::cout << std::endl;
	for (int i = 0; i < n; i++)	std::cout << tribonacci3(i) << ' ';
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 7.09
#include <iostream>
#include <cmath>
size_t seq1(size_t n)
{ // first way - using recursion
	if (n == 0) return 0;
	if (n == 1) return 1;
	else return (size_t)(5 * seq1(n - 1) - 6 * seq1(n - 2) + pow(6, n - 2));
}
size_t seq2(size_t n)
{ // second way - solving the characteristical polynomial of the sequence
	size_t result = (size_t)(-3.0 / 4 * pow(2, n) + 2.0 / 3 * pow(3, n) + 1.0 / 12 * pow(6, n));
	return result;
}
size_t seq3(size_t n)
{ // third way - cycling
	size_t a0(0), a1(1), a2;
	if (n == 0)	return a0;
	for (size_t i = 2; i <= n; i++)
	{
		a2 = (size_t)(5 * a1 - 6 * a0 + pow(6, i-2));
		a0 = a1;
		a1 = a2;
	}
	return a1;
}
int main()
{
	size_t n;
	std::cin >> n;
	std::cout << seq1(n) << std::endl;
	std::cout << seq2(n) << std::endl;
	std::cout << seq3(n) << std::endl;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 7.10
#include <iostream>
int factorial(int n)
{
	if (n > 0) return n * factorial(n - 1);
	else return 1;
}
int main()
{
	int n;
	std::cin >> n;
	std::cout << factorial(n);
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 7.11
#include <iostream>
long long factorial(size_t m)
{ // recursive function for calculating m!
	if (m == 0)return 1;
	else return m * factorial(m - 1);
}
long long binom1(size_t n, size_t k)
{ // first way: recursive function for direct calculation of n choose k (0<=k<=n)
	if (k == 0 || k == n) return 1;
	else return binom1(n-1, k) + binom1(n - 1, k - 1);
}
long long binom2(size_t n, size_t k)
{ // second way using factorial function and formula for n choose k (0<=k<=n)
	long long prod(1);
	for (size_t i = k + 1; i <= n; i++) prod *= i;
	long long binom = prod / factorial(n - k);
	return binom;
}
int main()
{
	size_t n, k;
	std::cin >> n >> k;
	std::cout << binom1(n, k) << std::endl;
	std::cout << binom2(n, k) << std::endl;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 7.12
#include <iostream>
#include <cmath>
#define k 5
long long binom(int m, size_t l)
{ // function which calculates m choose l
	if (m < l) return 0;
	if (m < 0) return 0;
	if (l == 0 || l == m) return 1;
	else return binom(m - 1, l) + binom(m - 1, l - 1);
}
long solSys1(size_t n)
{ // first combinatorial way
	long B = binom(k + (n - 10 - 21) - 1, k - 1);

	long C1 = binom(k + (n - 10 - 21) - 10 - 1, k - 1);
	long C2 = binom(k + (n - 10 - 21) - 20 - 1, k - 1);
	long C3 = binom(k + (n - 10 - 21) - 30 - 1, k - 1);

	long C1C2 = binom(k + ((n - 10 - 21) - 10 - 20) - 1, k - 1);
	long C2C3 = binom(k + ((n - 10 - 21) - 20 - 30) - 1, k - 1);
	long C3C1 = binom(k + ((n - 10 - 21) - 30 - 10) - 1, k - 1);

	long C1C2C3 = binom(k + ((n - 10 - 21) - 10 - 20 - 30) - 1, k - 1);

	long numSol = B - (C1 + C2 + C3) + (C1C2 + C2C3 + C3C1) - C1C2C3;
	return numSol;
}
long solSys2(size_t n)
{ // second counting with cycles way
	size_t count(0);

	for (size_t x1 = 0; x1 < 10; x1++)
		for (size_t x2 = 10; x2 < 30; x2++)
			for (size_t x3 = 0; x3 <= n; x3++)
				for (size_t x4 = 21; x4 < n; x4++)
					for (size_t x5 = 0; x5 < 30; x5++)
						if (x1 + x2 + x3 + x4 + x5 == n)
							count++;
	return count;
}
int main()
{
	size_t n;
	std::cin >> n;
	std::cout << solSys1(n) << std::endl;
	std::cout << solSys2(n) << std::endl;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 7.13
#include <iostream>
int GCD1(int a, int b)
{   // first way
	while (b != 0)
	{
		int temp = b;
		b = a % b;
		a = temp;
	}
	return a;
}
int GCD2(int a, int b)
{   // second way
	while (a != b)
	{
		if (a > b) a -= b;
		else b -= a;
	}
	return a;
}
int GCD3(int a, int b)
{   // third way
	if (b == 0) return a;
	else return GCD3(b, a%b);
}
int main()
{
	int a, b;
	std::cin >> a >> b;
	std::cout << GCD1(a, b) << std::endl;
	std::cout << GCD2(a, b) << std::endl;
	std::cout << GCD3(a, b) << std::endl;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 7.13 
int brute_force_gcd(int a, int b)
{
  // We'll assume that a > b
  int g = 0;
  for (int d = 1; (long long)d * d <= b; d++)
  {
    if (b % d == 0)
    {
      // If d divides b, there are two divisors to check
      // d and b/d
      if (a % d == 0)
      {
        g = max(g, a);
      }
      if (a % (b / d) == 0)
      {
        g = max(g, b/d);
      }
    }
  }
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 7.14 
#include <iostream> 
// returns value of poly[0]x(n-1) + poly[1]x(n-2) + .. + poly[n-1] 
int horner1(int poly[], int n, int x)
{       //iterative way
	int result = poly[0];  // Initialize result 

	// Evaluate value of polynomial using Horner's method 
	for (int i = 1; i < n; i++)
		result = result * x + poly[i];

	return result;
}

int horner2(int* poly, int k, int x)
{
	if (k == 1) return poly[k - 1];
	return poly[k - 1] + (x* (horner2(poly, k - 1, x)));
}

int main()
{
	// Let us evaluate value of 2x3 + 3x + 1 for x = 2 
	int poly[] = { 2, 0, 3, 1 };
	int x = 2;
	int n = sizeof(poly) / sizeof(poly[0]);
	std::cout << "Value of polynomial is " << horner1(poly, n, x) << " iteratively\n";
	std::cout << "Value of polynomial is " << horner2(poly, n, x) << " using recursion\n";
	return 0;
}
