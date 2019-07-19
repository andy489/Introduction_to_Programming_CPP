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
//Task 1.03
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
//Task 1.04
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
//Task 1.5
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
//Task 2.02
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
// Task 2.03
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
//Task 2.04 
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
//Task 2.05
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
//Task 2.06
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
// Task 2.07
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
//Task 2.08.
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
//Task 2.09
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
//Task 2.10
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
//Task 3.05 & 3.06
#include <iostream>
#include <cmath>

bool isPrime(size_t n)
{
	bool isPrime = true;
	for (size_t i = 2; i <= sqrt(n); i++)
		if (n%i == 0) isPrime = false;
	return isPrime;
}
int main()
{
	size_t n;
	std::cin >> n;
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
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 4.01
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
//Task 7.02 
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
//Task 7.03 
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
//Task 7.04
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
//Task 7.05
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
