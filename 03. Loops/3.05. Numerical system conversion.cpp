// github.com/andy489

#include <iostream>
#include <string>
typedef long long ll;

void reverse(std::string& str){
    int len = (int)str.length(), i;
    for (i = 0; i < len / 2; ++i)
        std::swap(str[i], str[len - i - 1]);
}

std::string convNum(ll n, int m){
    std::string zero = "0";
    if (n == 0)
        return zero;
    std::string num("");
    bool isNegative = false;
    if (n < 0) {
        isNegative = true;
        n=-n;
    }

    int i = 0;

    while (n){
        int rem = n % m;
        if (rem <= 9)
            num += rem + '0';
        else
            num += (char)(rem)+'7';
        n /= m;
    }
    if (isNegative)
        num += '-';
    reverse(num);
    return num;
}

int main(){
    ll n;
    std::cin >> n;
    std::cout << "Decimal: " << n
              << "\nBinary: " << convNum(n, 2)
              << "\nOct: " << convNum(n, 8)
              << "\nHex: " << convNum(n, 16) << std::endl;
    return 0;
}
