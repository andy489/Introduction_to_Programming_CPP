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

*Решение:*

```cpp
#include <iostream>
int main()
{
	unsigned n;
	std::cout << "n = ";
	std::cin >> n;

	unsigned* arr = new unsigned[n];
	unsigned sum = 0;
	unsigned count = 0;

	for (size_t i = 0; i < n; i++)
	{
		std::cout << "a[" << i << "] = ";
		std::cin >> arr[i];

		if (sum == arr[i]) count++;		
		sum += arr[i];
	}

	std::cout << "Answer: " << count << '\n';

	unsigned bonusCount = 0;
	size_t i = 1;
	for (i; i < n; i++)
	{
		int curr = arr[i];
		for (int j = i - 1; j >= 0; j--)
		{
			curr -= arr[j];
			if (curr == 0)
			{
				bonusCount++;
				break;
			}
			else if (curr < 0) break;			
		}
	}
	std::cout << "Bonus answer: " << bonusCount << '\n';
	delete[] arr;
	return 0;
}
```
**Задача 3.** От клавиатурата се въвежда естествено число <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">, следвано от други 2x<img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> на брой дробни числа (представени чрез тип *double*) <img src="https://latex.codecogs.com/svg.latex?\Large&space;x_0,y_0,x_1,y_1,...,x_{n-1},y_{n-1}">. Двойките <img src="https://latex.codecogs.com/svg.latex?\Large&space;(x_i,y_i)"> са декартови координати на точки в евклидовата равнина. Да се напише програма, която намира и извежда на стандартния изход лицето на квадрат с възможно най-малка площ, чиито страни са успоредни на координатните оси и който съдържа всочло въведени точки.

*Пример:* за редицата от точки (0,0),(-1,0),(2,1) програмата ще изведе 9.

*Решение:* 

**Анализ на задачата:**

За да открием лицето на квадрата с възможно най-малка площ отговарящ на исканото условие е необходимо да намерим двете най-отдалечени точки спрямо абсцисата и ординатата. За целта ще съхраняваме всички подадени *x* и *y* в масив. На четните позиции в масива ще бъдат координатите върху абсцисата, а на нечетните - координатите върху ординатата на съответната точка. Най голямата дистанция по абсцисата ще е разликата между *max_x* и *min_x* и аналогично за *y*. По-голямата от двете стойности е минималната страна на квадрата.

```cpp
#include <iostream>
#include <limits>

double myAbs(double a) { return a > 0 ? a : -a; }

int main()
{
	unsigned n;
	std::cout << "n = ";
	std::cin >> n;

	double* arr = new double[2 * n];
	unsigned c = 0;

	for (size_t i = 0; i < n; i++)
	{
		double x, y;
		std::cout << "x" << i << " = ";
		std::cin >> x;
		std::cout << "y" << i << " = ";
		std::cin >> y;

		arr[c] = x;
		arr[c + 1] = y;
		c += 2;
	}

	double min_x = DBL_MAX;	double max_x = DBL_MIN;
	double min_y = DBL_MAX;	double max_y = DBL_MIN;

	for (size_t i = 0; i < 2 * n; i += 2)
	{
		if (arr[i] < min_x) min_x = arr[i];
		if (arr[i] > max_x) max_x = arr[i];
	}
	for (size_t i = 1; i < 2 * n; i += 2)
	{
		if (arr[i] < min_y) min_y = arr[i];
		if (arr[i] > max_y) max_y = arr[i];
	}

	double diff_x = max_x - min_x;
	double diff_y = max_y - min_y;

	double sideCoverSquare = (diff_x + diff_y + myAbs(diff_x - diff_y)) / 2;

	double areaSquare = sideCoverSquare * sideCoverSquare;

	std::cout.setf(std::ios::fixed);
	std::cout.precision(4);
	std::cout << "Min area of covering square is: " << areaSquare;

	delete[] arr;
	return 0;
}
```

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
  
  *Решение:*
  
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
 
## Трето контролно по Увод в програмирането

*СУ  „Климент Охридски“, ФМИ, спец. Информатика, 17.12.2016 г. Вариант А*

**Задача 1.** Наблюдаваме приближаваща колона от индианци откъм предния ѝ край. За един индианец казваме, че е „видим“, ако всички индианци пред него са по-ниски от него (т.е. пред него няма по-висок или равен по ръст индианец, който да го закрива изцяло). Да се напише функция *visibleIndians*, която приема масив от цели числа, съдържащ височините на индианците в реда, в който са подредени в колоната, и втъща като резултат броя на видимите индианци.
 
 *Пример:*  Ако масивът е {**150**,**163**,158,**180**,173}, видимите индианци са 3 на брой.
 
 *Решение:*
 
 ```cpp
#include <iostream>
#include <time.h>
#define MAX 100

struct Indian
{
	unsigned height;
}indians[MAX + 1]; /* Масив от индианци*/
unsigned n;    /*Брой елементи в масива*/

void initSeq() { n = 0; }  /*Инициализиране на редицата от индианци*/

void insertIndian(unsigned height) /*Добавя нов индианец*/
{
	indians[n].height = height;
	n++;
}
void seqPrint() /*Извежда списък с редицата от индианци*/
{
	unsigned i;
	for (i = 0; i < n; i++)
	{
		std::cout << "Indian " << i << " with height " << indians[i].height << '\n';
	}
}

unsigned visibleIndians(Indian* indians, unsigned n)
{
	unsigned visible = 0;
	unsigned maxHeight = 0; /*за максимална височина може да сложим всяко число под 140 (в нашия случай)*/

	for (size_t i = 0; i < n; i++)
	{
		if (indians[i].height > maxHeight)
		{
			maxHeight = indians[i].height;
			visible++;
		}
	}
	return visible;
}

void randomSequenceIndians(unsigned n)
{
	for (size_t i = 0; i < n; i++)
	{
		insertIndian(140 + rand() % 41); /*Индианците са с височини от 140 до 180*/
	}
}
int main()
{
	srand(unsigned(time(0)));

	randomSequenceIndians(25);
	seqPrint();

	std::cout << "Visible indians: " << visibleIndians(indians, n);

	return 0;
}
 ```
 **Задача 2.** Казваме, че един масив от цели неотрицателни числа е „балансиран“, ако сумата на елементите в първата му половина е равна на сумата на елементите във втората му половина. Да се напише функция *isBalanced*, която по подаден масив с елементи от тип *unsigned int* връща булева стойност, указваща дали масивът е балансиран. Да се демонстрира използването на функцията *isBalanced*  в кратка *main* функция.
 
*Примери:* Масивът {5,10,4,1,7,3,9} е балансиран, а масивът {5,10,4,1,7,6,9} не е.

*Решение:*

```cpp
#include <iostream>
bool isBalanced(unsigned int*arr, unsigned int n)
{
	unsigned int leftSum(0), rightSum(0);
	for (unsigned int i = 0; i < n / 2; i++)
	{
		leftSum += arr[i];
		rightSum += arr[n - i - 1];
	}
	if (leftSum == rightSum) return true;
	return false;
}
int main()
{
	unsigned int a[] = { 5,10,4,1,7,3,9 };
	unsigned int len_a = sizeof(a) / sizeof(a[0]);

	unsigned int b[] = { 5,10,4,1,7,9 };
	unsigned int len_b = sizeof(b) / sizeof(b[0]);

	isBalanced(a, len_a) ? std::cout << "balanced\n" : std::cout << "is not balanced\n";
	isBalanced(b, len_b) ? std::cout << "balanced\n" : std::cout << "not balanced\n";

	return 0;
}
```
**Задача 3.** Да се напише функция *maxOccurs*, която получава като аргумент символен низ и връща броя на срещанията на най-срещаната буква в низа. Ако в низа няма нито една буква, функцията да връща 0. Функцията не трябва да прави разлика между главни и малки букви, т.е. прибавят се към една и съща бройка.

*Пример:* *maxOccurs("OnomatOpoeia")* <img src="https://latex.codecogs.com/svg.latex?\Large&space;\rigtharrow"> 4 (буквата 'О' се среща 4 пъти).

```cpp
#include <iostream>
bool isUppercaseLetter(char ch)
{
	if (ch >= 'A'&& ch <= 'Z') return true;
	return false;
}
bool isLowercaseLetter(char ch)
{
	if (ch >= 'a'&& ch <= 'z') return true;
	return false;
}
unsigned maxCount(unsigned* arr, unsigned n)
{
	unsigned max = 0;
	for (size_t i = 0; i < n; i++) if (arr[i]>max) max = arr[i];		
	return max;
}
unsigned maxOccurs(char* txt, unsigned int len)
{
	unsigned alphabet[26];
	memset(alphabet, 0, sizeof(alphabet)); 
	for (size_t i = 0; i < len; i++)
	{
		char curr = txt[i];
		if (isUppercaseLetter(curr)) alphabet[(int)txt[i] - 65]++;		
		else if (isLowercaseLetter(curr)) alphabet[(int)txt[i] - 97]++;		
	}
	return maxCount(alphabet, 26);
}
int main()
{
	char txt[] = { "OnomatOpoeia" };
	unsigned int len = sizeof(txt) / sizeof(txt[0]);
	std::cout<<maxOccurs(txt, len);
	return 0;
}
```
**Задача 4.** Да се напише функция *oneBit*, която получава като аргументи две цели числа без знак и връща булева стойност, указваща дали техният двоичен запис се различава точно в един бит.

*Примери:* *oneBit(4,5)* <img src="https://latex.codecogs.com/svg.latex?\Large&space;\rigtharrow"> *false*
