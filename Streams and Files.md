### Пример 1
*извличане на типове данни от стринг*
```cpp
#include <iostream>
#include <sstream>

int main()
{
	std::string str = "10 -15 git";
	std::istringstream numbersStream(str);

	int num1, num2; std::string word;
	numbersStream >> num1 >> num2 >> word;
	int sum = num1 + num2;

	std::ostringstream stream;
	stream << "The sum is " << num1 + num2 << '\n' << word << '\n';
	std::cout << stream.str();
	
	return 0;
}
```
### Пример 2
*какво връща потока когато не може да се конвентира до желания тип*
```cpp
#include <iostream>
#include <sstream>

int main()
{
	std::string word = "hello";
	std::istringstream istr(word);
	
	int number;
	istr >> number ? std::cout << "true": std::cout << "false";

	return 0;
}
```
### Пример 3
*извличане докато*
```cpp
#include <iostream>
#include <sstream>

int main()
{
	std::string str = "3 4 14 5 text 6";
	std::istringstream istr(str);
	
	int number;

	while (istr>>number)
	{
		std::cout << "next number is: " << number << '\n';
	}

	return 0;
}
```
### Пример 4 
*пълнене на вектор с цифри на число*
```cpp
#include <iostream>
#include <sstream>
#include <vector>

int main()
{
	std::string line; std::getline(std::cin, line);
	std::istringstream lineStream(line);

	std::vector<int> digits;
	char currentNumber;

	while (lineStream >> currentNumber)
	{
		digits.push_back(currentNumber - '0');
	}

	for (auto i : digits)	std::cout << i << ' ';
	return 0;
}
```
### Пример 5
```cpp
#include <iostream>
#include <sstream>
#include <string>

int main()
{
	std::istringstream input("some text here");

	std::string inputLine;
	getline(input, inputLine);
	std::cout << inputLine << std::endl;

	std::istringstream inputWithDots("some.text.here");

	std::string inputWithDotsLine;
	getline(inputWithDots, inputWithDotsLine, '.');
	std::cout << inputWithDotsLine << std::endl;

	//the first getline has "consumed" part of the stream
	getline(inputWithDots, inputWithDotsLine, '.');
	std::cout << inputWithDotsLine << std::endl;

	getline(inputWithDots, inputWithDotsLine, '.');
	std::cout << inputWithDotsLine << std::endl;
	return 0;
}
```
