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
