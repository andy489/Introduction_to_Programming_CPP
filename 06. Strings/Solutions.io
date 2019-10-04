//Task 6.01
#include <iostream>
size_t myStrlen(const char* str)
{
	size_t len;
	for (len = 0; str[len] != '\0'; len++) {}
	return len;
}
int myStrcmp(const char* str1, const char* str2)
{
	while (*str1 && (*str1 == *str2))
	{
		str1++;
		str2++;
	}
	return *(const unsigned char*)str1 - *(const unsigned char*)str2;
}
const char*  myStrcat(const char *source, const char *destination)
{
	size_t resLen = myStrlen(source) + myStrlen(destination) + 1;
	char *result = (char*)malloc(resLen);
	size_t ptr(0), temp(0);

	while (source[temp] != '\0') result[ptr++] = source[temp++];
	temp = 0;
	while (destination[temp] != '\0') result[ptr++] = destination[temp++];

	result[resLen - 1] = '\0';
	return result;
}
char*  myStrcpy(char *dest, const char *src)
{
	if (dest == nullptr) return nullptr;
	char* ptr = dest;
	while ((*dest++ = *src++) != '\0')
		*dest = '\0';
	return ptr;
}
int main()
{
	const char* str1 = "test string";
	const char* str2 = "second string";
	std::cout << myStrlen(str1) << std::endl;

	std::cout << myStrcmp(str1, str2) << std::endl;

	const char* str3 = "these strings ";
	const char* str4 = "are concatenated";
	const char* res = myStrcat(str3, str4);
	std::cout << res << std::endl;

	std::cout << myStrlen(res) << std::endl;

	delete[] myStrcat(str3, str4);

	char destination[] = "some longer text";
	char* copyStr = myStrcpy(destination, str1);

	std::cout << copyStr << std::endl;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 6.02
#include <iostream>
#include <string>

int main()
{
	std::string sentence,word;
	std::getline(std::cin,sentence); 
	std::cin >> word;
	size_t wordLen = word.length();
	size_t foundIndex = sentence.find(word);

	while (foundIndex != std::string::npos) // std::string::npos == -1;
	{
		std::cout << word << " found at " << foundIndex << std::endl;
		foundIndex = sentence.find(word, foundIndex + wordLen);
	}

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 6.03
#include <iostream>
#include <cstring>
char*  myStrcat(char *source, char *destination)
{
	size_t resLen = strlen(source) + strlen(destination) + 1;
	char *result = (char*)malloc(resLen);
	size_t ptr(0), temp(0);

	while (source[temp] != '\0') result[ptr++] = source[temp++];
	temp = 0;
	while (destination[temp] != '\0') result[ptr++] = destination[temp++];

	result[resLen - 1] = '\0';
	return result;
}
int main()
{
	char str1[100];
	std::cout << "Enter a string: ";
	std::cin.get(str1, 100);
	//std::cout << "You entered: " << str1 << std::endl;
	std::cin.ignore(); // cut the input stream

	char str2[100];
	std::cout << "Enter another string: ";
	std::cin.get(str2, 100);
	//std::cout << "You entered: " << str2 << std::endl;
	size_t len1 = strlen(str1);
	size_t len2 = strlen(str2);
	std::cout << len1 << ' ' << len2 << std::endl;
	char* str3 = new char[len1 + len2 + 1];
	str3 = myStrcat(str1, str2);
	std::cout << str3 << std::endl;
	delete[] str3;

	std::swap(str1[0], str2[0]);
	std::cout << str1 << ' ' << str2<<std::endl;

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 6.04 iterative
#include <iostream>
#include <cstring>
bool isPalindrome(const char* str)
{
	size_t len = strlen(str);
	for (size_t i = 0; i < len / 2; i++)
		if (str[i] != str[len - i - 1])	return false;
	return true;
}
int main()
{
	const char* str = "civic";
	//isPalindrome1(str) ? std::cout << "palindrome" : std::cout << "not palindrome";
	std::cout << isPalindrome(str);
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 6.04 recursive
#include <iostream>
#include <string>

bool palindrome(const std::string& word, int start, int end)
{
	if (start >= end) return true;
	else if (word[start] != word[end]) return false;
	return palindrome(word, start + 1, end - 1);
}

int main()
{
	std::string word; std::cin >> word; size_t length = word.length();
	palindrome(word,0,length-1) ? std::cout << "palindrome\n" : std::cout << "not palindrome\n";
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 6.05
#include <iostream>
size_t strLen(char* text)
{	
	size_t len;
	for ( len= 0; text[len] != '\0'; len++){}
	return len;
}
void revert(char* text)
{
	size_t len = strLen(text);
	for (size_t i = 0; i < len; i++)
	{
		bool isCapital = text[i] >= 'A' && text[i] <= 'Z';
		bool isLowercase = text[i] >= 'a' && text[i] <= 'z';
		text[i] += isCapital * 32 + isLowercase * (-32);
	}
}
int main()
{
	char text[10] = "asd&ASD";
	std::cout << text << std::endl;
	revert(text);
	std::cout << text << std::endl;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 6.06
#include <iostream> 
size_t strLen(const char* text)
{
	size_t len;
	for (len = 0; text[len] != '\0'; len++) {}
	return len;
}
int subString(const char* subStr, const char* str)
{
	size_t lenSubStr = strLen(subStr);
	size_t lenStr = strLen(str);
	if (lenSubStr > lenStr) return -1;

	for (size_t i = 0; i <= lenStr - lenSubStr; i++) {
		size_t j;
		/* For current index i, check for pattern match */
		for (j = 0; j < lenSubStr; j++)
			if (str[i + j] != subStr[j])
				break;
		if (j == lenSubStr)
			return i;
	}
	return -1;
}
int main()
{
	const char* s1 = "hub";
	const char* s2 = "www.github.com";
	int res = subString(s1, s2);
	if (res == -1) std::cout << "Not present";
	else std::cout << "Present at index " << res;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 6.07
#include <iostream>
#include <string>

bool isLower(char a)
{
	return a >= 'a' && a <= 'z';
}
bool isUpper(char a)
{
	return a >= 'A' && a <= 'Z';
}

void titleCase(std::string& text)
{
	size_t length = text.length();

	bool prevSymbol = true;

	for (size_t i = 0; i < length; i++)
	{
		char c = text[i];
		if (!(isLower(c) || isUpper(c)))
		{
			prevSymbol = true;
		}
		else if (prevSymbol)
		{
			prevSymbol = false;
			if (isLower(c))
			{
				text[i] -= ' ';
			}
		}
	}
}

int main()
{
	std::string text;
	getline(std::cin, text);

	titleCase(text); std::cout << text << '\n';

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 6.08
#include <iostream>
#include <string>

void replaceAll(std::string& text, const std::string& search, const std::string& replace)
{
	size_t searchLen(search.size()), repLen(replace.size());
	if (!search.empty())
	{
		size_t start(0);
		for (start; (start = text.find(search, start)) != std::string::npos; start += repLen)
		{
			text.replace(start, searchLen, replace);
		}
	}
}

int main()
{
	std::string text; getline(std::cin, text);
	std::string search; getline(std::cin, search);
	std::string replace; getline(std::cin, replace);

	replaceAll(text, search, replace);
	std::cout << text << '\n';

	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 6.09
#include <iostream>
int countWords(char* text)
{
	for (size_t i = 0; text[i] != '\0'; i++)
	{
		int count = 0;
		bool inWord = false;
		for (size_t i = 0; text[i] != '\0'; i++)
		{
			if (text[i] != '\t'&&text[i] != '\n'&&text[i] != ' ')
			{
				if (!inWord) count++;				
				inWord = true;
			}
			else inWord = false;
		}
		return count;
	}
	return-1;
}
int main()
{
	char text[] = " git\thub\n ";
	std::cout << countWords(text) << std::endl;
	return 0;
}
-------------------------------------------------------------------------------------------------------------------------------
//Task 6.10
#include <iostream>
#include <cstring>
void printHisto(int* histo)
{
	for (size_t i = 0; i < 26; i++)
	{
		if (histo[i] > 0)
		{
			std::cout << char(97 + i) << " - " << histo[i] << std::endl;
		}
	}
}
void printHisto(const char* str)
{
	int* histo = new int[26];
	memset(histo, 0, 26 * sizeof(histo[0]));
	size_t len = strlen(str);

	for (size_t i = 0; i < len; i++)
		if (str[i] >= 'a'&&str[i] <= 'z') histo[(int)str[i] - 97]++;

	printHisto(histo);
	delete[] histo;
}
int main()
{
	const char* str = "randomness";
	printHisto(str);
	return 0;
}
