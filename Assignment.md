## Task 1 - Divisible by 45
Your task is to write a program which finds all the numbers, which are divisible by 45, inside a specified range. 
#### Input 
Exactly **2** lines, each containing a single integer number – with an arbitrary length, but no more than **100** digits.<br>   
The first line contains the start of the range (inclusive) **S** <br> 
The second line contains the end of the range (exclusive) **E** <br> 
#### Output 
One or more lines, with a single integer number each, representing the numbers divisible by 45 in the given range, in ascending order (i.e. start from the smallest number divisible by 45 in the range and print each of them on a separate line). 
#### Restrictions 
The range will be such that total numbers divisible by 45 will be no more than **100**<br> 
The number of digits in the numbers specifying the range will NOT exceed **100** <br> 
**0 < S < E - 1**<br>  
The total running time of your program should be no more than **0.1s**<br> 
The total memory allowed for use by your program is **5MB** <br> 
#### Example Input/Output
Example Input|Expected Output
---|---
1<br>100|45<br>90 
1<br>90|45
450000000000000000000000000000000000000013<br>450000000000000000000000000000000000000100|450000000000000000000000000000000000000045<br>450000000000000000000000000000000000000090 

## Solution
- BigInt.h

```cpp
#pragma once
#include <iostream>
#include<string>
#include<sstream>
#include<cmath>
#include <algorithm>

class BigInt
{
protected:
	std::string digits;
public:
	BigInt() : digits("0") {}

	BigInt(std::string digits) : digits(trimLeadingZeroes(digits)) {}

	BigInt(int number) : digits(intToString(number)) {}

	std::string getDigits() const
	{
		return this->digits;
	}

	BigInt& operator+=(const BigInt & other) 
	{
		*this = *this + other;
		return *this;
	}

	BigInt operator+(const BigInt & other) const 
	{
		int maxTotalDigits = 1 + std::max(this->digits.size(), other.digits.size());

		std::string thisDigits = getPaddedWithZeroes(this->digits, maxTotalDigits);
		std::string otherDigits = getPaddedWithZeroes(other.digits, maxTotalDigits);

		std::string resultDigits(maxTotalDigits, '0');

		int carry = 0;
		for (int i = resultDigits.size() - 1; i >= 0; i--) 
		{
			int thisDigit = thisDigits[i] - '0';
			int otherDigit = otherDigits[i] - '0';

			int sum = thisDigit + otherDigit + carry;
			carry = sum / 10;
			int sumDigit = sum - carry * 10;

			resultDigits[i] = sumDigit + '0';
		}

		return BigInt(resultDigits);
	}

	friend std::ostream& operator<<(std::ostream& stream, const BigInt &number);

	bool operator<(const BigInt& other) const 
	{
		std::string thisStr = this->digits;
		std::string otherStr = other.digits;

		if (thisStr.size() < otherStr.size()) 
		{
			thisStr = getPaddedWithZeroes(thisStr, otherStr.size());
		}
		else if (thisStr.size() > otherStr.size()) 
		{
			otherStr = getPaddedWithZeroes(otherStr, thisStr.size());
		}

		return thisStr < otherStr;
	}

private:
	static std::string trimLeadingZeroes(std::string number) 
	{
		std::string resultDigitsTrimmed;
		for (size_t i = 0; i < number.size(); i++) 
		{
			if (number[i] != '0') {
				resultDigitsTrimmed = number.substr(i);
				break;
			}
		}

		return resultDigitsTrimmed.empty() ? "0" : resultDigitsTrimmed;
	}


	static std::string intToString(int number) 
	{
		std::ostringstream str;
		str << number;
		return str.str();
	}

	static std::string getPaddedWithZeroes(std::string s, size_t widthNeeded) 
	{
		if (s.size() < widthNeeded) 
		{
			return std::string(widthNeeded - s.size(), '0') + s;
		}
		else 
		{
			return s;
		}
	}
};

inline std::ostream& operator<<(std::ostream& stream, const BigInt &number) 
{
	stream << number.digits;
	return stream;
}
```
- BigInt.cpp

```cpp
#include "BigInt.h"

size_t findSumOfDigitsUtil(std::string number)
{	/* utility function to find sum of digits*/
	size_t len = number.length();
	size_t sum(0);
	for (size_t i = 0; i < len; i++)
	{
		sum += number[i] - '0';
	}
	return sum;
}

bool isMultipleOf9(int num)
{   /* function that checks whether a given number is multiply of 9 */
	if (num == 0 || num == 9) return true; // base
	if (num < 9)    return false;
	// if the number is greater than 9
	return isMultipleOf9((int)(num >> 3) - (int)(num & 7)); //recur
}

bool isMultipleOf5(std::string num)
{
	size_t len = num.length();
	size_t lastDigit = num[len - 1];
	if (lastDigit == '0' || lastDigit == '5')
	{
		return true;
	}
	return false;
}

int main()
{
	std::string S, E;
	std::cin >> S >> E;

	BigInt A(S); BigInt B(E);
	
	/*size_t sumDigits1 = findSumOfDigitsUtil(A.getDigits());
	size_t sumDigits2 = findSumOfDigitsUtil(B.getDigits());

	std::cout << sumDigits1 << '\n';
	std::cout << sumDigits2 << '\n';;

	isMultipleOf9(sumDigits1) ? std::cout << "yes\n" : std::cout << "no\n";
	isMultipleOf9(sumDigits2) ? std::cout << "yes\n" : std::cout << "no\n";*/

	
	for (BigInt i(S); i < B; i += 1)
	{
		if (isMultipleOf9(findSumOfDigitsUtil(i.getDigits()))&& isMultipleOf5(i.getDigits()))
		{
			std::cout << i << '\n';
		}
	}
	
	return 0;
}
```

## Task 2 – Near Cities
You are given information about towns. Each town has a name and a position represented by a point in 2 dimensional Euclidean space (i.e. the “normal” 2D space you are used to). 

Write a program, which, given the names and coordinates of a set of towns, finds the two closest towns (the two towns with the smallest distance between them). 
#### Input 
On the first line of the standard input, there will be the number of towns – **N**<br> 
On each of the next lines, there will be the **name**, the **first coordinate** and the **second coordinate** of a town (i.e. **name x y**), separated by single spaces.<br>
#### Output 
Write a single line containing the names of the two closest towns, separated by a single "**-**" sign. The names should be printed in order of appearance in the input. Also, if there are multiple pairs of towns with the same distance between each other, print the one that appears first in the input. For example, if the input has the towns **Sofia, Burgas, Pernik**, entered in that order, and if the distances between all of them are the same (i.e. they form an equilateral triangle), then the output should be **Sofia-Burgas** (NOT Burgas-Sofia, NOT Sofia-Pernik). 
#### Restrictions 
**1 < N < 100**, The name of each town will be a sequence of English letters (**a-z, A-Z**), no 2 towns will have the same name or same coordinates. <br>
Coordinates will be input as integer numbers (but calculations should be done in floating-point). <br>
The total running time of your program should be no more than **0.1s** <br>
The total memory allowed for use by your program is **5MB** <br>
#### Example Input/Output
Example Input|Expected Output 
---|---
3<br> Sofia 0 0<br>Burgas 350 0 <br>Pernik 0 -5|Sofia-Pernik 
3<br>A -1 -1<br>B -4 -1<br>C -3 -2|B-C 
4<br>A 1 1<br>B 2 1<br>C 2 2<br>D 1 2|A-B 
 
## Solution
```cpp
#include <iostream>
#include <cmath>
#include <string>
#include <vector>

struct Town
{
	std::string town;
	int x, y;
};

float getDistance(const Town& A, const Town& B)
{
	float distance = (float)sqrt((pow(A.x - B.x, 2) + pow(A.y - B.y, 2)));
	return distance;
}

void releaseVectorOfPointers(std::vector<Town*> &vec)
{
	size_t SIZE = vec.size();
	for (size_t i = 0; i < SIZE; i++)
	{
		delete vec[i];
	}
	vec.clear();
}

std::vector<Town*> readInput(size_t N)
{
	std::vector<Town*> cities;

	for (size_t i = 0; i < N; i++)
	{
		Town* city = new Town();
		std::cin >> city->town;
		std::cin >> city->x >> city->y;
		cities.push_back(city);
	}
	return cities;
}

void printMinDistance(const std::vector<Town*>& cities)
{
	Town *A = nullptr; Town *B = nullptr;
	float minDistance = FLT_MAX;
	size_t N = cities.size();
	for (size_t i = 0; i < N; i++)
	{
		for (size_t j = i + 1; j < N; j++)
		{
			float distance = getDistance(*cities[i], *cities[j]);
			if (distance < minDistance)
			{
				minDistance = distance;
				A = cities[i];
				B = cities[j];
			}
		}
	}
	std::cout << A->town << '-' << B->town << '\n';
}

int main()
{
	size_t N;
	std::cin >> N;
	std::vector<Town*> cities = readInput(N);
	printMinDistance(cities);	
	releaseVectorOfPointers(cities);
	return 0;
}
```
## Task 3 – Transmission
You are part of a SETI (*that thing that’s supposed to find aliens but never does*) team and you have just detected messages from a distant star system. The signal has been verified to indeed come from a star system, not from an Earth-orbiting satellite or any other sort of interference, and your team is certain the source is artificial. Your team wants to analyze the message, and for that they need to first identify the most-commonly encountered signals in the message. <br>
The message has been converted to a sequence of English words (containing characters **a-z** and digits **0-9**), separated by spaces. The message ends with a dot, preceded by a space **(" .")**. <br>
Your task is to write a program, which answers queries about the message in the form **occurrenceCount index** by finding all words which appear an **occurenceCount** number of times in the transmission, and printing out the word at position index in the lexicographical order of the (unique) words. If there are no words with that **occurenceCount**, print the dot character **(".")**. <br>
For example, if we have the message string:<br> 
**"chug a mug of mead and another mug mead chug another mug of mead warrior ."**<br> 
(*What? Nobody said the aliens can’t be from Skyrim…*) <br>
and type in **3 0**, the program should output **mead** – the words **mead** and **mug** each appear **3** times in the message, and ordered lexicographically they form the array **{"mead", "mug"}**, in which the element at the **0** index is the word **mead**.<br> 
If we instead type in **2 1**, the program should output **chug** – the words that appear **2** times in the message are chug and another. If we sort them lexicographically we get **{"another", "chug"}**, and index **1** in that array is **chug**.<br> 
If we instead type in **4 0**, the program should output **.** (a single dot character) – there is no word that appears **4** times in the text. <br>
Write a program which reads in a message in the above-mentioned format, and queries in the above-mentioned format, and prints out the results for those queries. <br>
#### Input 
The first line of the input will contain the message – a string containing English characters **a-z**, digits **0-9**, spaces, and ending with a space and a dot **(" .")**. Words in that string are considered sequences of characters and/or digits separated by spaces. <br>
The next line will contain a single integer **N** – the number of queries. <br>
Each of the following lines will contain two positive integer numbers, separated by a single space – the **occurrenceCount** and **index** values of the query. <br>
#### Output 
**N** lines, each containing a single word, representing the answers to the queries in the same order the queries were given. 
#### Restrictions 
**0 < N < 500;**<br>
The total number of words will be at most **1000**. Of those, no more than **50** will be unique. Each word will be at most **20** symbols. <br>
The total running time of your program should be no more than **0.05s** <br>
The total memory allowed for use by your program is **5MB** <br>
#### Example Input/Output
Example Input|Expected Output 
---|---
chug a mug of mead and another mug mead chug another mug of mead warrior .<br>2 <br>3 0 <br>2 1 <br>|mead <br>chug 
 
 #### Solution
 ```cpp
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

int containWord(std::string word, std::vector<std::pair<std::string, size_t>> words)
{
	size_t SIZE = words.size();
	for (size_t i = 0; i < SIZE; i++)
	{
		if (word == words[i].first)
		{
			return i;
		}
	}
	return -1;
}

void print(std::vector<std::pair<std::string, size_t>> words)
{
	size_t SIZE = words.size();
	for (size_t i = 0; i < SIZE; i++)
	{
		std::cout << words[i].first << ' ' << words[i].second << '\n';
	}
	std::cout << '\n';
}

//chug a mug of mead and another mug mead chug another mug of mead warrior . 
std::vector<std::pair<std::string, size_t>> getWords(const std::string& sentence)
{
	std::vector <std::pair<std::string, size_t>> words;
	size_t senLen = sentence.length();

	std::string word("");

	for (size_t i = 0; i < senLen; i++)
	{
		char currChar = sentence[i];
		if (currChar != ' ')
		{
			word += sentence[i];
		}
		else
		{
			if (sentence[i+1]=='.')
			{
				break;
			}
			if (word.length() != 0)
			{
				int pos = containWord(word, words);
				if (pos == -1)
				{
					std::pair<std::string, size_t> pair;
					pair.first = word; pair.second = 1;
					words.push_back(pair);
				}
				else
				{
					words[pos].second++;
				}
			}
			word = "";
		}
	}
	return words;
}

std::string searchForWordWithOccurancesAndIndex(size_t countOccurances, size_t index, const std::vector<std::pair<std::string, size_t>>& words)
{
	size_t SIZE = words.size();
	size_t count(0);
	for (size_t i = 0; i < SIZE; i++)
	{
		if (words[i].second == countOccurances)
		{
			if (count < index)
			{
				count++;
			}
			else
			{
				return words[i].first;
			}
		}
		else
		{
			count = 0;
		}
	}
	return ".";
}

int main()
{
	std::string sentence;
	std::getline(std::cin, sentence);

	std::vector<std::pair<std::string, size_t>> words = getWords(sentence);
	//print(words);

	sort(words.begin(), words.end());
	//print(words);

	size_t N;
	std::cin >> N;
	for (size_t i = 0; i < N; i++)
	{
		size_t countOccurances, index;
		std::cin >> countOccurances >> index;
		std::cout << searchForWordWithOccurancesAndIndex(countOccurances, index, words) << '\n';
	}

	return 0;
}
 ```
