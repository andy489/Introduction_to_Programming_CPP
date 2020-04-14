// github.com/andy489

#include <iostream>
#include <string>

std::string oneThroughNineteen(size_t number){
    switch (number){
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

std::string tens(size_t number){
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

int main(){
    std::cout << "Enter a number [0-999]: ";
    size_t num;
    std::cin >> num;
    size_t lastDigit = num % 10;
    size_t lastTwoDigits = num % 100;
    size_t midDigit = lastTwoDigits / 10;
    size_t firstDigit = num / 100;
    if (num == 0){
        std::cout << "zero";
        return 0;
    }
    if (num > 999)
        std::cout << "Number " << num << " not in [0-999].";
    else{
        if (firstDigit)
            std::cout << oneThroughNineteen(firstDigit) << " hundred ";
        if (lastTwoDigits > 0 && lastTwoDigits / 20 == 0)
            std::cout << oneThroughNineteen(lastTwoDigits);
        else if (lastTwoDigits % 10 == 0)
            std::cout << tens(midDigit);
        else
            std::cout << tens(midDigit) << ' ' << oneThroughNineteen(lastDigit);
    }
    return 0;
}
