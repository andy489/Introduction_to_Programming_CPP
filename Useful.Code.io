• Memory leak tets

// include libraries on top ot rpogram
#define _CRTDBG_MAP_ALLOC   // required
#include <stdlib.h>         // to enable MSVC++
#include <crtdbg.h>         // memory leak detection

_CrtDumpMemoryLeaks(); // before end of program i.e. return 0;

// start debugging with f10 and when you reach "return 0" you will be notified if there is a memory leak

--------------------------------------------------------------------------------------------------------------------------------
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
• MAX AND MIN FROM TWO INTEGERS

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
• CONSOLE COLOR

#include <iostream>
#include <windows.h>
int main()
{
	for (int i = 0; i < 256; i++)
	{
		SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), i);
		std::cout << "Text color in use = " << i << "\n";
	}
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
• CONSOLE COLOR 2

#include <iostream>
int main()
{
	system("color A"); // sets the color of the text in red

	std::cout << "You can change the color of text in the console\n";
	std::cout << "For more info try \"system(color G)\"\n";

	system("color G"); // color info

	system("color fc"); // produces light red on bright white
	
	return 0;
}
