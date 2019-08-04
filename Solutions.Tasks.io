//Task 1.01
#include <iostream>
void swap(int& a, int& b)
{
	int temp = a;
	a = b;
	b = temp;
}
int main()
{
	int a, b;
	std::cin >> a >> b;
	std::cout << a << ", " << b << "\n";
	swap(a, b);
	std::cout << a << ", " << b << "\n";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 1.02
#include <iostream>
#include <cmath>
double medianLen(double a, double b, double c)
{
	double median = (1.0 / 2)*sqrt(2 * pow(c, 2) + 2 * pow(b, 2) - pow(a, 2));
	return median;
}
int main()
{
	double a, b, c;
	std::cin >> a >> b >> c;

	double m_A = medianLen(a, b, c);
	double m_B = medianLen(b, c, a);
	double m_C = medianLen(c, a, b);

	double m_a = medianLen(m_A, m_B, m_C);
	double m_b = medianLen(m_B, m_C, m_A);
	double m_c = medianLen(m_C, m_A, m_B);

	std::cout << m_a << "\n" << m_b << "\n" << m_c << "\n";
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 1.03
#include <iostream> 
int main()
{
	size_t age;
	std::cin >> age;
	size_t months = age * 12;
	size_t weeks = (size_t)(age * 52.177457);
	size_t days = (size_t)(age * 365.242199);
	size_t hours = days * 24;
	size_t minutes = hours * 60;
	size_t seconds = minutes * 60;
	std::cout << seconds << " seconds\n" << days << " days\n"
		<< weeks << " weeks\n" << months << " months";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 1.04
#include <iostream> 
#include <cmath>
int main()
{
	double a, b, c;
	std::cin >> a >> b >> c;
	double s = (a + b + c) / 2; // semiperimeter
	double area = sqrt(s*(s - a)*(s - b)*(s - c)); // Heron's formula

	std::cout << "Area of triangle is: " << area;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 1.05
#include <iostream> 
int main()
{
	double a, d;
	size_t n;
	std::cin >> a >> d >> n;
	double sum = a * n + (size_t)(((n - 1)*n) / 2)*d;
	std::cout << "Sum of first " << n
		<< " elements of the arithmetic progression with starting element "
		<< a << " and difference " << d << " is: " << sum;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 1.06
#include <iostream> 
int main()
{
	double priceWhiskey;
	std::cin >> priceWhiskey;
	double quantityBeer, quantityWine, quantityBrandy, quantityWhiskey;
	std::cin >> quantityBeer >> quantityWine >> quantityBrandy >> quantityWhiskey;
	
	double priceBrandy = priceWhiskey / 2;
	double priceWine = priceBrandy - (40.0 / 100)*priceBrandy;
	double priceBeer = priceBrandy - (80.0 / 100)*priceBrandy;
	
	double totalPriceWhiskey = quantityWhiskey * priceWhiskey;
	double totalPriceBrandy = quantityBrandy * priceBrandy;
	double totalPriceWine = quantityWine * priceWine;
	double totalPriceBeer = quantityBeer * priceBeer;

	double bill = totalPriceWhiskey + totalPriceBrandy + totalPriceWine + totalPriceBeer;

	std::cout.setf(std::ios::fixed);
	std::cout.precision(2);
	std::cout << bill;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 2.01
#include <iostream>

int main()
{
	double width, length, height, astroHeight;
	std::cin >> width >> length >> height >> astroHeight;

	double shipVolume = width * length * height;
	double astroRoom = 2 * 2 * (astroHeight + 0.4);

	size_t astroCount = (size_t)(shipVolume / astroRoom);

	if (astroCount >= 3 && astroCount < 10) std::cout << "The spacecraft holds " << astroCount << " astronauts.";	
	else if (astroCount < 3) std::cout << "The spacecraft is too small.";	
	else std::cout << "The spacecraft is too big.";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 2.02
#include <iostream>
#include <cmath>
size_t firstCriteria(double a, double b, double c)
{
	bool x = (a <= 0) || (b <= 0) || (c <= 0) ||
		(a + b <= c) || (a + c <= b) || (b + c <= a);
	if (x) return 0;
	else if ((a == b) && (b == c))return 3; // equilateral
	else if ((a == b) || (b == c) || (c == a)) return 2; // isoscles
	else return 1; // scalene
}
size_t secondCriteria(double a, double b, double c)
{
	if (a > c) std::swap(a, c);
	if (a > b) std::swap(a, b); // Now the smallest element is the first one
	if (b > c) std::swap(b, c);

	double exp = a * a + b * b - c * c;

	bool x = (a <= 0) || (b <= 0) || (c <= 0) || (a + b <= c);
	if (x) return 0;
	else if (exp > 0) return 1; // acute
	else if (exp == 0) return 2; // right-angled
	else return 3; // obtuse
}
int main()
{
	double a, b, c;
	std::cin >> a >> b >> c;
	switch (firstCriteria(a, b, c))
	{
	case 0:
		std::cout << "Sides " << a << ' ' << b << ' ' << c << " cannot form a";
		break;
	case 1:
		std::cout << "Scalene";
		break;
	case 2:
		std::cout << "Isosceles";
		break;
	case 3:
		std::cout << "Equilateral";
		break;
	default:
		break;
	}
	std::cout << ' ';
	switch (secondCriteria(a, b, c))
	{
	case 0:
		break;
	case 1:
		std::cout << "acute ";
		break;
	case 2:
		std::cout << "right-angled ";
		break;
	case 3:
		std::cout << "obtuse ";
		break;
	default:
		break;
	}
	std::cout << "triangle.";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 2.03
#include <iostream>
int main()
{
	size_t year;
	std::cin >> year;
	if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0))
		std::cout << year << " is a leap year";
	else std::cout << year << " is not a leap year";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
// Task 2.04
#include <iostream>

int main()
{
	double change;
	std::cin >> change;

	size_t coins = change * 100;
	size_t count(0);
	while (coins > 0)
	{ // 2.00; 1.00; 0.50; 0.20; 0.10; 0.05; 0.02; 0.01
		if (coins >= 200){coins -= 200;count++;}
		else if (coins >= 100){coins -= 100;count++;}
		else if (coins >= 50){coins -= 50;count++;}
		else if (coins >= 20){coins -= 20;count++;}
		else if (coins >= 10){coins -= 10;count++;}
		else if (coins >= 5){coins -= 5;count++;}
		else if (coins >= 2){coins -= 2;count++;}
		else if (coins >= 1){coins -= 1;count++;}
	}
	std::cout << count;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 2.05 
#include <iostream>
#include <cmath>
int main()
{
	double x, y, k(0);
	std::cin >> x >> y;
	if (x*y == 0)
	{
		if (x == y) std::cout << "Point P(" << x << ',' << y << ") matches point O(0,0).";
		else
		{
			if (x > 0) std::cout << "Point P(" << x << ',' << y << ") lies on the abscissa.";
			else std::cout << "Point P(" << x << ',' << y << ") lies on the ordinate.";
		}
	}
	else
	{
		if (x*y > 0)
		{
			if (x > 0) k = 1;
			else k = 3;
		}
		else
		{
			if (x > 0) k = 4;
			else k = 2;
		}
	}
	if (k != 0)
	{
		std::cout << "Point P(" << x << ',' << y << ") is located in " << k << " quadrant";
	}
	if (abs(x) < 0.5 && abs(y) < 0.5)
		std::cout << "\n~inside the given unit square.";
	else if ((abs(x) == 0.5 && abs(y) <= 0.5) || (abs(y) == 0.5 && abs(x) <= 0.5))
		std::cout << "\n~on the perimeter of the given unit square.";
	else std::cout << "\n~outside the given unit square.";

	if ((x - 0.5)*(x - 0.5) + (y - 0.5)*(y - 0.5) < 1 * 1)
		std::cout << "\n~inside the given unit circle.";
	else if ((x - 0.5)*(x - 0.5) + (y - 0.5)*(y - 0.5) == 1 * 1)
		std::cout << "\n~on the perimeter of the given unit circle.";
	else std::cout << "\n~outside the given unit circle.";

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 2.06
#include <iostream> 
#include <string>
void printRoman(size_t number)
{
	size_t num[] = { 1,4,5,9,10,40,50,90,100,400,500,900,1000 };
	std::string sym[] = { "I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"};
	size_t i = 12;
	while (number > 0)
	{
		size_t div = number / num[i];
		number = number % num[i];
		while (div)
		{
			std::cout << sym[i];
			div--;
		}
		i--;
	}
}
int main()
{
	size_t num;
	std::cin >> num;
	printRoman(num);
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 2.07
#include <iostream>
#include <string>
std::string oneThroughNineteen(size_t number)
{
	switch (number)
	{
	case 1: return "one";
	case 2: return "two";
	case 3: return "three";
	case 4: return "four";
	case 5: return "five";
	case 6: return "six";
	case 7: return "seven";
	case 8: return "eight";
	case 9: return "nine";
	case 10: return "ten";
	case 11: return "eleven";
	case 12: return "twelve";
	case 13: return "thirteen";
	case 14: return "fourteen";
	case 15: return "fifteen";
	case 16: return "sixteen";
	case 17: return "seventeen";
	case 18: return "eighteen";
	case 19: return "nineteen";
	}
}
std::string tens(size_t number)
{
	switch (number)
	{
	case 2: return "twenty";
	case 3: return "thirty";
	case 4: return "forty";
	case 5: return "fifty";
	case 6: return "sixty";
	case 7: return "seventy";
	case 8: return "eighty";
	case 9: return "ninety";
	}
}
int main()
{
	std::cout << "Enter a number [0-999]: ";
	size_t num;
	std::cin >> num;
	size_t lastDigit = num % 10;
	size_t lastTwoDigits = num % 100;
	size_t midDigit = lastTwoDigits / 10;
	size_t firstDigit = num / 100;
	if (num == 0)
	{
		std::cout << "zero";
		return 0;
	}
	if (num > 999) std::cout << "Number " << num << " not in [0-999].";
	else
	{
		if (firstDigit) std::cout << oneThroughNineteen(firstDigit) << " hundred ";
		if (lastTwoDigits > 0 && lastTwoDigits / 20 == 0) std::cout << oneThroughNineteen(lastTwoDigits);
		else if (lastTwoDigits % 10 == 0) std::cout << tens(midDigit);
		else std::cout << tens(midDigit) << ' ' << oneThroughNineteen(lastDigit);
	}

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
// Task 2.08
#include <iostream>
double fx(double a, double b, double c, double x)
{ // f(x)=ax^2+bx+c
	return a * x*x + b * x + c;
}
double der1(double a, double b, double x)
{ // firt derivative
	return 2 * a*x + b;
}
int main()
{
	double a, b, c, p, q;
	std::cin >> a >> b >> c >> p >> q;
	double max, min;

	double d = -b / (2 * a);
	double val1 = fx(a, b, c, d);
	double val2 = fx(a, b, c, p);
	double val3 = fx(a, b, c, q);

	if (val1>val2)
	{
		max = val1;
		min = val2;
	}
	else
	{
		max = val2;
		min = val1;
	}
	if (val3>max) max = val3;	
	if (val3<min) min = val3;

	std::cout.setf(std::ios::fixed);
	std::cout.precision(2);
	std::cout << "Max = " << max << "\nMin = " << min << '\n';
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 2.09
#include <iostream>
#include <iomanip>

int main()
{
	size_t hExam, mExam, hArr, mArr;
	std::cin >> hExam >> mExam >> hArr >> mArr;

	size_t totalMinExam = hExam * 60 + mExam;
	size_t totalMinArr = hArr * 60 + mArr;

	int diff = totalMinExam - totalMinArr;

	if (diff < 0)
	{
		std::cout << "Late" << std::endl;
		if (abs(diff) < 60) std::cout << -diff << " minutes after the start" << std::endl;
		else
		{
			std::cout << -diff / 60 << ':';
			std::cout << std::setw(2) << std::setfill('0') << -diff % 60 << " hours after the start";
		}
	}
	else if (totalMinExam - totalMinArr <= 30)
	{
		std::cout << "On time" << std::endl;
		if (diff == 0) return 0;
		std::cout << diff << " minutes before the start";
	}
	else if (diff > 0)
	{
		std::cout << "Early" << std::endl;
		if (diff >= 60)
		{
			std::cout << diff / 60 << ':';
			std::cout << std::setw(2) << std::setfill('0') << diff % 60 << " hours before the start";

		}
		else std::cout << diff << " minutes before the start" << std::endl;
	}
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 2.10
#include <iostream>
#include <cmath>
#include <string>

int main()
{
	std::string year;
	std::cin >> year;

	size_t p, h;
	std::cin >> p >> h;
	double inSofia = (48 - h) * 3 / 4.0;
	double inHomeTown = h;
	double other = p * 2 / 3.0;
	double sum = inSofia + inHomeTown + other;
	if (year == "leap") sum += (15 * sum / 100.0);	
	std::cout << floor(sum) << std::endl;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 2.11
#include <iostream>
#include <string>
using namespace std;

void swap(string& card1, string& card2)
{
	string temp = card1;
	card1 = card2;
	card2 = temp;
}
size_t getRank(string card)
{
	size_t rank;
	if (card[2] != '\0') rank = (card[1] - '0') * 10 + (card[2] - '0');
	else rank = card[1] - '0';
	return rank;
}
void sort2(string& card1, string& card2)
{
	size_t rank1 = getRank(card1);
	size_t rank2 = getRank(card2);
	if (rank1 < rank2) swap(card1, card2);
}
void sort3(string& card1, string& card2, string& card3)
{
	sort2(card2, card3);
	sort2(card1, card2);
	sort2(card2, card3);
}
void sort5(string& card1, string& card2, string& card3, string& card4, string& card5)
{
	sort3(card3, card4, card5);
	sort3(card1, card2, card3);
	sort3(card3, card4, card5);
	sort3(card2, card3, card4);
	sort3(card3, card4, card5);
}
int main()
{
	string card1, card2, card3, card4, card5;
	cin >> card1 >> card2 >> card3 >> card4 >> card5;

	size_t rank1, rank2, rank3, rank4, rank5;
	char suit1, suit2, suit3, suit4, suit5;

	sort5(card1, card2, card3, card4, card5);
	cout << '\n' << card1 << ' ' << card2 << ' ' << card3 << ' ' << card4 << ' ' << card5 << '\n';

	rank1 = getRank(card1);
	rank2 = getRank(card2);
	rank3 = getRank(card3);
	rank4 = getRank(card4);
	rank5 = getRank(card5);

	suit1 = card1[0];
	suit2 = card2[0];
	suit3 = card3[0];
	suit4 = card4[0];
	suit5 = card5[0];

	bool sameSuit = suit1 == suit2 && suit2 == suit3 && suit3 == suit4 && suit4 == suit5;
	bool royalFlush = rank1 == 14 && rank2 == 13 && rank3 == 12 && rank4 == 11 && rank5 == 10;
	bool consecutive = rank1 == rank2 + 1 && rank2 == rank3 + 1 && rank3 == rank4 + 1 && rank4 == rank5 + 1;
	bool fourOfKind = (rank1 == rank2 && rank2 == rank3 && rank3 == rank4) || 
		(rank2 == rank3 && rank3 == rank4 && rank4 == rank5);
	bool fullHouse = ((rank1 == rank2 && rank2 == rank3) && rank4 == rank5) || 
		(rank1 == rank2 && (rank3 == rank4 && rank4 == rank5));
	bool flush = suit1 == suit2 && suit2 == suit3 && suit3 == suit4 && suit4 == suit5;
	bool threeOfKind = (rank1 == rank2 && rank2 == rank3) || (rank2 == rank3 && rank3 == rank4) || 
		(rank3 == rank4 && rank4 == rank5);
	bool twoPair = (rank1 == rank2 && rank3 == rank4) || (rank2 == rank3 && rank4 == rank5);
	bool pair = rank1 == rank2 || rank2 == rank3 || rank3 == rank4 || rank4 == rank5;

	if (sameSuit && royalFlush) cout << "royal flush";
	else if (sameSuit && consecutive) cout << "straight flush";
	else if (fourOfKind) cout << "four of a kind";
	else if (flush) cout << "flush";
	else if (consecutive) cout << "Straight";
	else if (threeOfKind) cout << "three of a kind";
	else if (twoPair) cout << "two pair";
	else if (pair) cout << "pair";
	else cout << "high card";
	cout << '\n';
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.01
#include <iostream>
int main() {
	for (int i = 1; i <= 100; i++)
	{
		if (i % 15 == 0)std::cout << "Fizz Buzz\n";
		else if (i % 3 == 0)std::cout << "Fizz\n";
		else if (i % 5 == 0)std::cout << "Buzz\n";
		else std::cout << i << std::endl;		
	}
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.02
#include <iostream>
long long absVal(long long n)
{
	return n < 0 ? -n : n;
}
int main()
{
	long long n;
	std::cin >> n;
	size_t count(0), sum(0);
	long long num = absVal(n);
	while (num != 0)
	{
		sum += num % 10;
		num /= 10;
		count++;
	}
	std::cout.setf(std::ios::fixed);
	std::cout.precision(2);
	std::cout << sum / (double)count;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.03 
#include <iostream>
#include <cmath>
size_t numLen1(long long num)
{ // first way using log10 function
	size_t len = size_t(floor(log10(abs(num)))) + 1;
	return len;
}
size_t numLen2(long long n)
{ // second way with counting
	size_t len = 0;
	while (n != 0)
	{
		n /= 10;
		len++;
	}
	return len;
}
long long revNum(long long n)
{
	long long r = 0;
	size_t len = numLen1(n);
	while (len != 0)
	{
		r += (long long)((n % 10)*pow(10, len - 1));
		n /= 10;
		len--;
	}
	return r;
}
int digitPos1(long long num, int k)
{ // first way (without reverting the number)
	int len = numLen2(num);
	num = abs(num);
	int endCycle = len - k;
	int digit = -1;
	if (k > len || k < 1) return -1;
	for (int i = len - 1; i >= endCycle; i--)
	{
		digit = (size_t)(num / pow(10, i));
		long long denom = (long long)(pow(10, len - 1));
		num = num % denom;
		len--;
	}
	return digit;
}
int digitPos2(long long num, int k)
{ // second way with reverting the number
	size_t len = numLen2(num);
	long long rev = revNum(num);
	num = abs(rev);
	int digit = -1;
	if (k > (int)len || k < 1)return digit;
	size_t i(0);
	while (i != k)
	{
		digit = num % 10;
		num /= 10;
		i++;
	}
	return digit;
}
int main()
{
	long long n;
	std::cin >> n;
	for (size_t i = 1; i <= numLen1(n); i++) std::cout << digitPos1(n, i) << ' ' << digitPos2(n, i) << std::endl;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.04
#include <iostream>
double sqrt_x(double x, double eps)
{ // Babylonian method
	double s = x;
	while ((s - x / s) > eps) s = (s + x / s) / 2;
	return s;
}
int main()
{
	std::cout << sqrt_x(2, 0.000001) << std::endl;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.05
#include <iostream>
#include <cmath>
#include <string>
void swap(char& a, char& b)
{
	char temp = a;
	a = b;
	b = temp;
}
void reverse(std::string& str)
{
	size_t len = str.length();
	for (size_t i = 0; i < len / 2; i++)
		swap(str[i], str[len - i - 1]);
}
std::string convNum(long long n, size_t m)
{
	std::string zero = "0";
	if (n == 0) return zero;
	std::string num("");
	bool isNegative = false;
	if (n < 0) isNegative = true;
	n = abs(n);
	
	size_t i = 0;
	while (n != 0)
	{
		int rem = n % m;
		if (rem <= 9) num += rem + '0';
		else num += (char)(rem)+'7';
		n /= m;
	}
	if (isNegative) num += '-';
	reverse(num);
	return num;
}
int main()
{
	long long n;
	std::cin >> n;
	std::cout << "Decimal: " << n
		<< "\nBinary: " << convNum(n, 2)
		<< "\nOct: " << convNum(n, 8)
		<< "\nHex: " << convNum(n, 16) << std::endl;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
// Task 3.06 & 3.07 & 3.08 & 3.09
#include <iostream>
#include <cmath>
bool isPrime(size_t n)
{ //3.06
	bool isPrime = true;
	for (size_t i = 2; i <= sqrt(n); i++)
		if (n%i == 0) isPrime = false;
	return isPrime;
}
void printAllPrimesToNum(size_t n)
{ //3.07
	std::cout << 1;
	for (size_t i = 2; i <= n; i++)
		if (isPrime(i)) std::cout << ", " << i;
	std::cout << std::endl;
}
void factoringNum(size_t n)
{ //3.08
	for (size_t i = 2; i <= n; i++)
	{
		if (isPrime(i) && n%i == 0)
		{
			if (i == n) std::cout << i;
			else std::cout << i << '.';
			n /= i;
			i = 1;
		}
	}
	std::cout << std::endl;
}
bool sumOfTwoPrimes(size_t n, size_t& j)
{ //3.09
	for (size_t i = 2; i <= sqrt(n); i++)
	{
		if (isPrime(i) && isPrime(n - i))
		{
			j = i;
			return true;
		}
	}
	return false;
}
int main()
{
	size_t n;
	std::cin >> n;
	if (isPrime(n)) std::cout <<n<< " is prime\n";
	else std::cout << n<<" is compose\n";
	printAllPrimesToNum(n);
	factoringNum(n);
	size_t j;
	if (sumOfTwoPrimes(n, j)) std::cout << j << '+' << n - j << '=' << n << '\n';
	else std::cout << n << " cannot be epressed as sum of two primes\n";

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.10 & 3.11 && 3.12
#include <iostream>
size_t numLen(size_t n)
{
	size_t len = 0;
	while (n != 0)
	{
		n /= 10;
		len++;
	}
	return len;
}
void printSpaces(size_t n)
{
	for (size_t i = 1; i <= n; i++)
	{
		std::cout << ' ';
	}
}
void printSquare(size_t n)
{ // 3.10
	size_t k = 1;
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++)
		{
			std::cout << k;
			printSpaces(numLen(n*n) - numLen(k) + 1);
			k++;
		}
		std::cout << std::endl;
	}
}
void printFloydTriangle(size_t n)
{ // 3.11
	size_t k = 1;
	for (size_t i = 1; i <= n; i++)
	{
		for (size_t j = 1; j <= i; j++)
		{
			std::cout << k;
			printSpaces(numLen(n*(n + 1) / 2) - numLen(k) + 1);
			k++;
		}
		std::cout << std::endl;
	}
}
size_t sumOfNthRowOfFloydTriangle(size_t n)
{ /*On the Nth row we have n numbers and the last one is n(n+1)/2 (sum of num from 1 to n).
  Now taking back the other n-1, the only thing left is to sum them.*/
	size_t sum(0);
	for (size_t i = 0; i < n; i++)
	{
		sum += n * (n + 1) / 2 - i;
	}
	//or simply: sum = n * (n*n + 1) / 2;
	return sum;
}
void printSequence(size_t n)
{ // 3.12
	for (size_t i = 1; i <= n; i++)
	{
		if (i!=n)
		{
			std::cout << sumOfNthRowOfFloydTriangle(i) << ", ";
			continue;
		}
		std::cout << sumOfNthRowOfFloydTriangle(i);
	}
	std::cout << std::endl;
}

int main()
{
	size_t n;
	std::cin >> n;
	std::cout << "Square of numbers:\n";
	printSquare(n);
	std::cout << "\nFloyd triangle:\n";
	printFloydTriangle(n);
	std::cout << "\nSum of numbers on the n-th row of the Floyd's triangle is:\n";
	std::cout << sumOfNthRowOfFloydTriangle(n) << '\n';
	std::cout << "\nFirst " << n << " terms of the sequence are:\n";
	printSequence(n);
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.13 first way
#include <iostream>
size_t getRow(size_t n)
{ // just count the rows, and when you meet the number, return the row
	size_t row(0), k(1);
	for (row = 1; row <= n; row++)
	{
		for (size_t j = 1; j <= row; j++)
		{
			if (k == n)
			{
				goto end;
			}
			k++;
		}
	}
	end:return row;
}
size_t getCol(size_t n)
{ /* having already found the row and knowing that every n-th row starts
with n(n-1)/2+1 and ends with n(n+1)/2, just count the columns and when you
meet the number (and that surely will happen), just return the column and you're done*/
	size_t col(1);
	size_t r = getRow(n);
	for (size_t j = r * (r - 1) / 2 + 1; j <= r * (r + 1) / 2; j++)
	{
		if (j == n)
		{
			break;
		}
		col++;
	}
	return col;
}
int main()
{
	size_t n;
	std::cin >> n;
	std::cout << "Number " << n << " lies in row " << getRow(n) << ", column " << getCol(n) << " of the Floyd's triangle.\n";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.13 second way
#include <iostream>
#include <cmath>
size_t getRow(size_t n)
{ /*knowing the n-th row ends with n*(n+1)/2, we can make quadratic equation and solve it to get row number for given number k.
  So, n*(n+1)/2=k, or n*n+n-2*k=0 and D=1+8*k.*/
	size_t D = 1 + 8 * n;
	size_t row = (size_t)(ceil((-1 + sqrt(D)) / 2));
	return row;
}
size_t getCol(size_t n)
{
	size_t r = getRow(n);
	size_t col = n - r * (r - 1) / 2; //n minus last number form the upper row
	return col;
}
int main()
{
	size_t n;
	std::cin >> n;
	std::cout << "Number " << n << " lies in row " << getRow(n) << ", column " << getCol(n) << " of the Floyd's triangle.\n";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.14
#include <iostream>
void printChar(char a, size_t n)
{
	for (size_t i = 0; i < n; i++)
	{
		std::cout << a;
	}
}
void printChristmasTree(size_t n)
{
	if (n % 2 == 0) std::cout << "error";
	else
	{
		for (size_t i = 1; i <= n / 2 + 1; i++)
		{
			printChar(' ', n / 2 - i + 1);
			printChar('*', 2 * i - 1);
			std::cout << std::endl;
		}
		printChar(' ', n / 2);
		std::cout << '*';
	}
}
int main()
{
	size_t n;
	std::cin >> n;
	printChristmasTree(n);
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 3.15
#include <iostream>
void printChar(char a, size_t n)
{
	for (size_t i = 0; i < n; i++)
	{
		std::cout << a;
	}
}
void printHeart(size_t n)
{
	if (n % 2 == 0) std::cout << "error";
	else
	{
		for (size_t i = 1; i <= n; i += 2)
		{
			printChar(' ', (n - i) / 2);
			printChar('*', i);
			printChar(' ', n - i + 1);
			printChar('*', i);
			std::cout << std::endl;
		}
		for (size_t i = 1; i <= n; i++)
		{
			printChar(' ', i);
			printChar('*', 2 * (n - i) + 1);
			std::cout << std::endl;
		}
	}
}
int main()
{
	size_t n;
	std::cin >> n;
	printHeart(n);
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
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
//Task 4.14 & 4.15
#include <iostream>
#include <vector>
#include <algorithm>
double median(double* arr, size_t n)
{ //Task 4.14
	double median;
	if (n % 2 == 0) median = (arr[n / 2 - 1] + arr[n / 2]) / 2.0;
	else median = arr[n / 2];
	return median;
}
std::vector<double> modes(double* arr, size_t n)
{ //Task 4.15 - brute force method without sorting data
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
//Task 4.15 second way - sorting the data
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
//Task 4.16
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
//Task 4.17
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
//Task 4.18 
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
//Task 4.19 first way
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
//Task 4.19 second way
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
//Task 4.20
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
//Task 4.21
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
//Task 4.22
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
//Task 4.23
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
//Task 4.24
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
//Task 4.25 & 4.26 & 4.27
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
{ // Task 4.24
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
{ // Task 4.25
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
{ // Task 4.26
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
-------------------------------------------------------------------------------------------------------------------------------
//Task 5.01
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
//Task 5.02
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
//Task 5.03
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
//Task 5.04
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
//Task 5.05
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
//Task 5.06
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
//Task 5.07
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
//Task 5.08
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
//Task 5.09
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
//Task 5.10


-------------------------------------------------------------------------------------------------------------------------------
//Task 5.11
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
//Task 6.01
#include <iostream>
size_t strLen(char* text)
{	
	size_t len;
	for ( len= 0; text[len] != '\0'; len++){}
	return len;
}
void revert(char* text)
{
	size_t len = strLen(text);
	for (size_t i = 0; i < len; i++)
	{
		bool isCapital = text[i] >= 'A' && text[i] <= 'Z';
		bool isLowercase = text[i] >= 'a' && text[i] <= 'z';
		text[i] += isCapital * 32 + isLowercase * (-32);
	}
}
int main()
{
	char text[10] = "asd&ASD";
	std::cout << text << std::endl;
	revert(text);
	std::cout << text << std::endl;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 6.02
#include <iostream> 
size_t strLen(const char* text)
{
	size_t len;
	for (len = 0; text[len] != '\0'; len++) {}
	return len;
}
int subString(const char* subStr, const char* str)
{
	size_t lenSubStr = strLen(subStr);
	size_t lenStr = strLen(str);
	if (lenSubStr > lenStr) return -1;

	for (size_t i = 0; i <= lenStr - lenSubStr; i++) {
		size_t j;
		/* For current index i, check for pattern match */
		for (j = 0; j < lenSubStr; j++)
			if (str[i + j] != subStr[j])
				break;
		if (j == lenSubStr)
			return i;
	}
	return -1;
}
int main()
{
	const char* s1 = "hub";
	const char* s2 = "www.github.com";
	int res = subString(s1, s2);
	if (res == -1) std::cout << "Not present";
	else std::cout << "Present at index " << res;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 6.03
#include <iostream>
int countWords(char* text)
{
	for (size_t i = 0; text[i] != '\0'; i++)
	{
		int count = 0;
		bool inWord = false;
		for (size_t i = 0; text[i] != '\0'; i++)
		{
			if (text[i] != '\t'&&text[i] != '\n'&&text[i] != ' ')
			{
				if (!inWord) count++;				
				inWord = true;
			}
			else inWord = false;
		}
		return count;
	}
	return-1;
}
int main()
{
	char text[20] = " git\thub\n ";
	std::cout << countWords(text) << std::endl;
	return 0;
}

-------------------------------------------------------------------------------------------------------------------------------
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




-------------------------------------------------------------------------------------------------------------------------------
//Task 7.
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
//Task 7.
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
//Task 7.
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
//Task 7.
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
//Task 7.
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
//Task 8.01
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
//Task 8.02
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
//Task 8.03
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
-------------------------------------------------------------------------------------------------------------------------------
