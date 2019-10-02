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
#using namespace std;
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
