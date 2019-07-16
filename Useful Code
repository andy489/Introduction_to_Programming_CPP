• REGULAR EXPRESSIONS (RegEx)

// Example 1:
#include <iostream> 
#include <regex> 

int main()
{
	std::string s1 = "http//www.github.com/"; // target string
	std::regex s2("(.+)(www.)[a-zA-Z0-9]+(.com/)(.*)"); // searched string
	//(.+) -> At least one non-eps (eps - the empty char) symbol of any kind;
	//(.*) -> Character/s of any kind (even eps);
	//[a-zA-Z0-9]+ Specify the desired characters we want to search (at least one of them -> +; else -> *)
	if (regex_match(s1, s2))
		std::cout << "String 'a' matches regular expression 'b' \n";
	if (regex_match(s1.begin(), s1.end(), s2))
		std::cout << "String 'a' matches with regular expression 'b' in the range from 0 to string end\n";

	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
• CONTROL OF THE INPUT DATA

#include <iostream>

/* Function that reads from cin until it gets an integer in
the required range and also handles invalid characters.*/

int inputNum(int lowerBound, int upperBound) 
{
	int n;
	while (true)
	{
		std::cout << "Input a number: "; std::cin >> n;
		if (std::cin.fail())
		{
			std::cin.clear();
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
		}
		else if ((n >= lowerBound) && (n <= upperBound)) break;
	}
	return n;
}

int main()
{
	int n = inputNum(0, 9);
	std::cout << "Correct number: " << n;

	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
• INTERESTING WAY OF FINDING THE MAX AND MIN FROM TWO INTEGERS

#include <iostream>
#include <cmath>

int main()
{
	int a, b;
	std::cin >> a >> b;
	int max = (a + b + abs(a - b)) / 2;
	int min = (a + b - abs(a - b)) / 2;
	std::cout << "Max: " << max << "\nMin: " << min;
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
