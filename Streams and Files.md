### Пример 1
*извличане на типове данни от стринг*
```cpp
#include <iostream>
#include <sstream>

int main(){
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

int main(){
	std::string word = "hello";
	std::istringstream istr(word);
	
	int number;
	istr >> number ? std::cout << "true": std::cout << "false";

	return 0;
}
```
### Пример 3
*Извличане докато*
```cpp
#include <iostream>
#include <sstream>

int main(){
	std::string str = "3 4 14 5 text 6";
	std::istringstream istr(str);
	
	int number;

	while (istr>>number){
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

int main(){
	std::string line; std::getline(std::cin, line);
	std::istringstream lineStream(line);

	std::vector<int> digits;
	char currentNumber;

	while (lineStream >> currentNumber){
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

int main(){
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
### Пример 6

Примерен вход|Очакван изход
-|-
3<br>3.1415 2.7182 9.8|3.1415<br>2.7182<br>9.8

```cpp
#include <iostream>
#include <sstream>
#include <string>
int main(){
	size_t numbersCount;
	std::cin >> numbersCount;
	std::cin.ignore();

	std::string input;
	getline(std::cin, input);

	std::istringstream istr(input);

	float number = 0.0f;
	for (size_t i = 0; i < numbersCount; i++){
		istr >> number;
		std::cout << number << std::endl;
	}

	return 0;
}
```
### Пример 7
```cpp
#include <iostream>
#include <fstream>

int main(){
	std::ifstream input;
	input.open("input.txt");
	int a, b;
	input >> a >> b;
	input.close();

	std::ofstream output;
	output.open("output.txt");

	output << a + b << std::endl;
	output.close();

	return 0;
}
```
### Пример 8
```cpp
#include <iostream>
#include <fstream>

int main(){
	std::ifstream input;
	// NOTE: the file input.txt should exist in the directory where
	// the binary file is created and run!
	input.open("input.txt");
	
	// IMPORTANT: always make an error check
	if (!input.is_open()){
		std::cerr << "input.txt file could not be found" << std::endl;
	}

	int a, b;
	input >> a >> b;

	std::ofstream output;
	output.open("output.txt",std::ofstream::app);

	output << a + b << std::endl;
	output.close();

	return 0;
}
```
