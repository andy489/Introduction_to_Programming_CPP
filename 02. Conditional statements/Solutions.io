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
