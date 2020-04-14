// github.com/andy489

#include <iostream>

int main() {
    double priceWhiskey;
    std::cin >> priceWhiskey;
    double quantityBeer, quantityWine, quantityBrandy, quantityWhiskey;
    std::cin >> quantityBeer >> quantityWine >> quantityBrandy >> quantityWhiskey;

    double priceBrandy = priceWhiskey / 2,
            priceWine = priceBrandy - (40.0 / 100) * priceBrandy,
            priceBeer = priceBrandy - (80.0 / 100) * priceBrandy,

            totalPriceWhiskey = quantityWhiskey * priceWhiskey,
            totalPriceBrandy = quantityBrandy * priceBrandy,
            totalPriceWine = quantityWine * priceWine,
            totalPriceBeer = quantityBeer * priceBeer,

            bill = totalPriceWhiskey + totalPriceBrandy + totalPriceWine + totalPriceBeer;

    std::cout.setf(std::ios::fixed);
    std::cout.precision(2);
    std::cout << bill;
    return 0;
}
