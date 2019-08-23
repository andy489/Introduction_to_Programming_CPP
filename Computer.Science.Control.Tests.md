## Първо контролно по Увод в програмирането
*СУ  „Климент Охридски“, ФМИ, спец. Компютърни науки, 9.11.2018 г. Вариант Б*

**Задача 1.** Да се напише логически израз, който проверява дали е вярно, че даден символ **c1** е малка латинска буква, даден символ **c2** е главна латинска буква и **c1** е по-близо до края на азбуката отколкото **c2**.

*Пример:* За **c1**='t' и **c2**='D' резултатът е *true*.

*Пример:* За **c1**='Y' и **c2**='G' резултатът е *false*.

*Решение:*

```cpp
#include <iostream>
int main()
{
	char c1, c2;
	std::cout << "c1 = ";
	std::cin >> c1;
	std::cout << "c2 = ";
	std::cin >> c2;

	bool logicStatement = ('a' <= c1 && c1 <= 'z'&&'A' <= c2 && c2 <= 'Z' && 'z' - c1 < 'Z' - c2);
	logicStatement ? std::cout << "true" : std::cout << "false";

	return 0;
}
```
**Задача 2.** От клавиатурата се въвежда естествено число <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">, следвано от други <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> на брой естествени числа <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_0,a_1,a_2,...,a_{n-1}">. Да се напише програма, която извежда на стандартния изход колко на брой от елементите <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_i(0\le{i}<n)"> на редицата е изпълнено, че <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_i=a_0+a_1+...+a_{i-1}">.

*Пример:* за редицата **0**,1,**1**,5,**7**, програмата ще изведе 3 (съответните елементи са с **bold** шрифт).

*Бонус*: да се намери колко са на брой елементите <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_i">, за които е изпълнено, че <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_i=a_j+...+a_{i-1}"> за <img src="https://latex.codecogs.com/svg.latex?\Large&space;j<i-1">.

## Второ контролно по Увод в програмирането

 *СУ  „Климент Охридски“, ФМИ, спец. Компютърни науки, 14.12.2018 г. Вариант Б*
 
 **Задача 1.** Да се напише програма, която въвежда от клавиатурата квадратна матрица 
 <img src="https://latex.codecogs.com/svg.latex?\Large&space;A_{NxN}(1\le{N}\le{20})"> от числа 
 *int*. Програмата да извежда броя на редовете на матрицата, 
 в които има поне три съседни последователни естествени числа.
 
 *Пример:* за следната матрица 4x4:
 
 *1*|*2*|*3*|7
 ---|---|---|---
 **-1**|**0**|**1**|**3** 
 **1**|**2**|**9**|**3**
 **9**|***4***|***5***|***6*** 
 
 програмата да извежда числото 2 (заради елементите *1,2,3* на първи ред и *4,5,6* на четвърти).
 
 *Решение:*
 
 ```cpp
#include <iostream>
int A[20][20];
void inputMatrix(unsigned n)
{
	for (unsigned rows = 0; rows < n; rows++)
	{
		for (unsigned cols = 0; cols < n; cols++)
		{
			std::cout << "A[" << rows << "][" << cols << "] = ";
			std::cin >> A[rows][cols];
		}
	}
}
void printMatrix(unsigned n)
{
	std::cout << "The matrix is:\n";
	for (size_t i = 0; i < n; i++)
	{
		for (size_t j = 0; j < n; j++) std::cout << A[i][j] << ' ';
		std::cout << std::endl;
	}
}
unsigned count(unsigned n)
{
	unsigned cnt = 0;
	for (unsigned r = 0; r < n; r++)
	{
		for (unsigned c = 0; c < n - 2; c++)
		{
			int first = A[r][c];
			int second = A[r][c + 1];
			int third = A[r][c + 2];
			if ((first == second - 1 && second == third - 1 && first > 0) ||
				(third == second - 1 && second == first - 1 && third > 0))
			{
				cnt++;
				break;
			}
		}
	}
	return cnt;
}
int main()
{
	unsigned n;
	std::cout << "Enter size of the matrix n (0<n<21): ";
	std::cin >> n;
	inputMatrix(n);
	printMatrix(n);
	std::cout << "Number of rows with at least 3 conseutive natural numbers is " << count(n);
	return 0;
}
 ```
  **Задача 2.** Да се дефинира функция *unsigned long countSums(...)* с подходящи по тип и брой параметри, 
  която да приема три масива с елементи от тип *long*. Функцията да намира броя на тройките от числа 
  <img src="https://latex.codecogs.com/svg.latex?\Large&space;(a,b,c)">, всяко от които е елемент съответно на първия, 
  втория и третия масив
  (не непременно намиращи се на един и същи индекс в трите масива), такива че едното от тях е сума на другите две.
  
  *Пример:* за масивите {1,5,3},{2,4},{6,3,0} функцията връща 3 (това са тройките (1,2,3),(5,2,3),(1,4,3)). 
  Като допълнение може да ги изведете на конзолата.
  
 *Решение:*
 
 ```cpp
 #include <iostream>
bool checkCondition(unsigned long a, unsigned long b, unsigned long c)
{  // функция, кочто проверява дали сбора на две от три числа е равен на третото
	if (a == b + c || b == c + a || c == a + b)
	{
		return true;
	}
	return false;
}
unsigned long countSums(long arr1[], size_t len1, long arr2[], size_t len2, long arr3[], size_t len3)
{
	unsigned long counter = 0;
	for (size_t i = 0; i < len1; i++)
	{
		for (size_t j = 0; j < len2; j++)
		{
			for (size_t k = 0; k < len3; k++)
			{
				if (checkCondition(arr1[i], arr2[j], arr3[k]))
				{
					counter++;
					std::cout << '(' << arr1[i] << ',' << arr2[j] << ',' << arr3[k]<<")\n"; 
				}
			}
		}
	}
	return counter;
}
int main()
{
	long arr1[] = { 1,5,3 };
	size_t len1 = sizeof(arr1) / sizeof(arr1[0]);
	long arr2[] = { 2,4 };
	size_t len2 = sizeof(arr2) / sizeof(arr2[0]);
	long arr3[] = { 6,4,3 };
	size_t len3 = sizeof(arr3) / sizeof(arr3[0]);

	std::cout<<countSums(arr1, len1, arr2, len2, arr3, len3);	
	return 0;
}
 ```
 
 **Задача 3.** Да се напише програма, която въвежда от стандартния вход 
 <img src="https://latex.codecogs.com/svg.latex?\Large&space;(N\le{20})"> символни низа, като приема че низовете не 
 съдържат интервали и нови редове и всеки от тях съдържа не повече от 50 символа.
 Програмата да замести всички главни латински букви в низовете със съответните им малки 
 букви и всички малки латински букви със съответните им главни, след което да конкатенира низовете в ред, 
 обратен на постъпването им. Резултатът да се изведе на стандартния изход.
 
 *Пример:* При въвеждане на низовете "abC", "Abc", "uvw" в този ред изведеният резултат трябва да бъде "UVWaBCABc".
  
 ```cpp
#include <iostream>
#include <cstring>

char finalText[1000];

void revert(char text[])
{
	size_t len = strlen(text);
	for (size_t i = 0; i < len; i++)
	{
		bool isCapital = text[i] >= 'A' && text[i] <= 'Z';
		bool isLowercase = text[i] >= 'a' && text[i] <= 'z';
		text[i] += isCapital * 32 + isLowercase * (-32);
	}
}

void rev(unsigned& n, unsigned& count)
{
	count++;
	char text[50];
	std::cout << "Enter string number " << count<<": ";
	std::cin >> text;	
	if (count != n)
	{
		rev(n, count);
	}
	revert(text);
	strcat_s(finalText, 1000, text);
}

int main()
{
	unsigned n, count(0);
	std::cout << "Enter the number of symbol arrays: ";
	std::cin >> n;
	
	rev(n, count);

	std::cout << finalText;

	return 0;
}
 ```