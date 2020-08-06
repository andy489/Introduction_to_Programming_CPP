• Memory leak tets

// include libraries on top ot rpogram
#define _CRTDBG_MAP_ALLOC   // required
#include <stdlib.h>         // to enable MSVC++
#include <crtdbg.h>         // memory leak detection

_CrtDumpMemoryLeaks(); // before end of program i.e. return 0;

// start debugging with f10 and when you reach "return 0" you will be notified if there is a memory leak

--------------------------------------------------------------------------------------------------------------------------------
• Swapping two numbers

#include <iostream>

int main() {
    int a = 5, b = 10;
    std::cout << "a=" << a << "\nb=" << b;

    b += a - (a = b);

    std::cout << "\n<<swap>>\na=" << a << "\nb=" << b;
    return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
• REGULAR EXPRESSIONS (RegEx)

// Example 1:
#include <iostream> 
#include <regex> 

int main(){
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

int inputNum(int lowerBound, int upperBound) {
	int n;
	while (true){
		std::cout << "Input a number: "; std::cin >> n;
		if (std::cin.fail()){
			std::cin.clear();
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
		}
		else if ((n >= lowerBound) && (n <= upperBound)) break;
	}
	return n;
}

int main(){
	int n = inputNum(0, 9);
	std::cout << "Correct number: " << n;

	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
• SPLITTING BY DELIMETER IN C++

#include <iostream>
#include <string>
#include <sstream>

int main() {
	using namespace std;
	istringstream input("some text here");

	string inputLine;
	getline(input, inputLine);
	cout << inputLine << endl;

	istringstream inputWithDots("some.text.here");

	string inputWithDotsLine;
	getline(inputWithDots, inputWithDotsLine, '.');
	cout << inputWithDotsLine << endl;


	getline(inputWithDots, inputWithDotsLine, '.');
	cout << inputWithDotsLine << endl;

	getline(inputWithDots, inputWithDotsLine, '.');
	cout << inputWithDotsLine << endl;

	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
• SPLITTING BY DELIMETER IN WHILE CYLCLE WITH ISTRINGSTREAM

#include <iostream>
#include <string>
#include <sstream>

int main(){
	using namespace std;
	istringstream istr("some.text.here");

	string word;
	getline(istr, word, '.');
	while (istr){		
		cout << word << endl;
		getline(istr, word, '.');
	} 
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
• SPLITTING BY MORE THAN ONE DELIMETER IN C++  first approach

#include <iostream>
#include <sstream>
#include <vector>

int main(){
	std::string inputString; getline(std::cin,inputString);
	std::istringstream stringStream(inputString);
	std::string line;

	std::vector<std::string>wordVector; wordVector.reserve(10);

	while (std::getline(stringStream, line)){
		size_t prev(0), pos;
		while ((pos = line.find_first_of(" ,.?!;", prev)) != std::string::npos){
			if (pos > prev)
				wordVector.push_back(line.substr(prev, pos - prev));
			prev = pos + 1;
		}
		if (prev < line.length())
			wordVector.push_back(line.substr(prev, std::string::npos));
	}

	for (auto i : wordVector){
		std::cout << i << '\n';
	}

	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
• SPLITTING BY MORE THAN ONE DELIMETER IN C++  second approach

#include <iostream>
#include <string>

void parse(const std::string& text){
	std::string delimiters(".,;!? ");
	char* next_token = nullptr;
	char* token = strtok_s(const_cast<char*>(text.c_str()), delimiters.c_str(), &next_token);

	while (token != nullptr){
		std::cout << token << '\n';
		token = strtok_s(nullptr, delimiters.c_str(), &next_token);
	}	
}

int main(){
	std::string text; getline(std::cin, text);	
	parse(text);
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
• MAX AND MIN FROM TWO INTEGERS

#include <iostream>
#include <cmath>

int main(){
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
int main(){
	for (int i = 0; i < 256; i++){
		SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), i);
		std::cout << "Text color in use = " << i << "\n";
	}
	return 0;
}
--------------------------------------------------------------------------------------------------------------------------------
• CONSOLE COLOR 2

#include <iostream>
int main(){
	system("color A"); // sets the color of the text in red

	std::cout << "You can change the color of text in the console\n";
	std::cout << "For more info try \"system(color G)\"\n";

	system("color G"); // color info

	system("color fc"); // produces light red on bright white
	
	return 0;
}
