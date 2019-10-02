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
