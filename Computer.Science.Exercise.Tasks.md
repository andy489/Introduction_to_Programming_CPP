**Задача 1.** (*ЛАБИРИНТ*) Дадена е правоъгълна символна матрица <img src="https://latex.codecogs.com/svg.latex?\Large&space;A"> с размери <img src="https://latex.codecogs.com/svg.latex?\Large&space;N">x<img src="https://latex.codecogs.com/svg.latex?\Large&space;M">, която представлява „лабиринт“. Лабиринта се състои единствено от символите <img src="https://latex.codecogs.com/svg.latex?\Large&space;*">,$ и празната клетка.
- <img src="https://latex.codecogs.com/svg.latex?\Large&space;*"> е лава, през която не може да се премине и върху която не може да се стъпи;
- $ е съкровище;
- празната клетка е проходим път.

В лабиринта може да се движим само на север, на изток, на юг и на запад (забранено е диагонално движение като например североизток). Да се напише функция, която:

а) проверява дали от дадена стартова позиция в лабиринта, с координати <img src="https://latex.codecogs.com/svg.latex?\Large&space;(x,y)">, може да се достигне до съкровище;

б) намира броя на всички съкровища, до които може да се достигне от дадена стартова позиция с координати <img src="https://latex.codecogs.com/svg.latex?\Large&space;(x,y)">.
 
Пример: На фигурата по-долу съществува път до съкровище от позиция с координати **(4,1)**, но не и от позиция с координати **(0,0)**. Също така, броя на съкровищата, до които може да се достигне от позиция с координати **(4,1)** е **3**, а от позиция с координати **(2,0)** е **1**.

<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">|$|<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">|<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">| |
---- | ---- | ---- | ---- | ---- |
<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">| |**$**| | |
**$**|<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">|<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">|<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">| |
<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">| | | | |
| | |<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">|<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">|**$**|

*автор: Трифон Трифонов*

***Решение:***

**а)**
```cpp
#include <iostream>

const int MAX = 100;

char labyrinth[MAX][MAX] = {
	"*$** ",
	"* $  ",
	"$*** ",
	"*    ",
	"  **$"
};

const int WIDTH = 5;
const int HEIGHT = 5;

void printPoint(char const* text, int x, int y)
{
	std::cout << text << " (" << x << ',' << y << ")\n";
}
void printLabyrinth()
{
	for (int i = 0; i < HEIGHT; i++)
	{
		std::cout << labyrinth[i] << std::endl;
	}
}
bool findTreasure(int x, int y)
{
	printPoint("We try to step at", x, y);
	if (x < 0 || y < 0 || x >= HEIGHT || y >= WIDTH || labyrinth[x][y] == '*')
	{
		printPoint("We cannot step at", x, y);
		return false;
	}
	if (labyrinth[x][y] == '"')
	{
		printPoint("We have already been at", x, y);
		return false;
	}
	if (labyrinth[x][y] == '$')
	{
		printPoint("We found treasure at", x, y);
		return true;
	}
	// 0 <= x < HEIGHT && 0 <= WIDTH && labyrinth[x][y] == ' '
	printPoint("We step at", x, y);
	labyrinth[x][y] = '"';
	//north
	if (findTreasure(x - 1, y))
	{
		printPoint("The journey goes through", x - 1, y);
		return true;
	}
	//east
	if (findTreasure(x, y + 1))
	{
		printPoint("The journey goes through", x, y + 1);
		return true;
	}
	//south
	if (findTreasure(x + 1, y))
	{
		printPoint("The journey goes through", x + 1, y);
		return true;
	}
	//west
	if (findTreasure(x, y - 1))
	{
		printPoint("The journey goes through", x, y - 1);
		return true;
	}
	printPoint("We are stepping back from", x, y);
	labyrinth[x][y] = 'X';
	return false;
}
int main()
{
	printLabyrinth();
	std::cout << findTreasure(4, 1) << std::endl;
	printLabyrinth();
	return 0;
}
```
**б)**
```cpp
#include <iostream>

const int MAX = 100;

char labyrinth[MAX][MAX] = {
	"*$** ",
	"* $  ",
	"$*** ",
	"*    ",
	"  **$"
};

const int WIDTH = 5;
const int HEIGHT = 5;

void printPoint(char const* text, int x, int y)
{
	std::cout << text << " (" << x << ',' << y << ")\n";
}
void printLabyrinth()
{
	for (int i = 0; i < HEIGHT; i++)
	{
		std::cout << labyrinth[i] << std::endl;
	}
}
int findAllTreasures(int x, int y)
{
	printPoint("We try to step at", x, y);
	if (x < 0 || y < 0 || x >= HEIGHT || y >= WIDTH || labyrinth[x][y] == '*')
	{
		printPoint("We cannot step at", x, y);
		return 0;
	}
	if (labyrinth[x][y] == '"')
	{
		printPoint("We have already been at", x, y);
		return 0;
	}
	int foundTreasures = 0;
	if (labyrinth[x][y] == '$')
	{
		printPoint("We found treasure at", x, y);
		foundTreasures = 1;
	}
	// 0 <= x < HEIGHT && 0 <= y < WIDTH && labyrinth[x][y] == ' '
	printPoint("We step at", x, y);
	labyrinth[x][y] = '"';
	foundTreasures += findAllTreasures(x - 1, y);//north	
	foundTreasures += findAllTreasures(x, y + 1);//east
	foundTreasures += findAllTreasures(x + 1, y);//south
	foundTreasures += findAllTreasures(x, y - 1);//west
	printPoint("We stepping back from", x, y);
	labyrinth[x][y] = 'X';
	return foundTreasures;
}
int main()
{
	printLabyrinth();
	std::cout << findAllTreasures(4, 1) << std::endl;
	printLabyrinth();
	return 0;
}
```
**Задача 2.** (*ВАРИАЦИИ*) Да се образуват всички <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> - мерни вектори с компоненти 0 и 1.

Например, при <img src="https://latex.codecogs.com/svg.latex?\Large&space;n=3"> всички 3-мерни вектори с компоненти 0 и 1 са:
- (0,0,0)
- (0,0,1)
- (0,1,0)
- (0,1,1)
- (1,0,0)
- (1,0,1)
- (1,1,0)
- (1,1,1)

Задачата да се реши по два начина:

а) с помощта на бинарни оператори и представянето на всяко число в двоична бройна система;

б) без да се използват бинарни оператори.

***Решение:***

За решаването на тази задача трябва да се образуват всички вариации (*комбинации с повторения*) на числата 0 и 1 от <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-ти клас. За целта ще използваме операцията **събиране на вектори по модул 2**. В подточка а) това събиране може да се улесни с помощта на побитовия оператор &, но в подточка б) не може да се използва подобрн оператор. За нея ще трябва да се имплементира програма, която замества работата на оператора.

**Дефиниция**. Нека <img src="https://latex.codecogs.com/svg.latex?\Large&space;a=(a_1,a_2,...,a_n)"> e произволен <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-мерен вектор с компоненти 0 и 1. **Сумата по модул 2** на вектора <img src="https://latex.codecogs.com/svg.latex?\Large&space;a"> с <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-мерния единичен вектор <img src="https://latex.codecogs.com/svg.latex?\Large&space;e=(0,0,...,0,1)"> е вектор <img src="https://latex.codecogs.com/svg.latex?\Large&space;a'=(a_1',a_2',...,a_n')">, чиито компоненти се образуват съгласно следните правила:
- ако <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_n=0">, то 
  - <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_i'=a_i,i-1,2,...,n-1"> 
  - <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_n'=1">.
- ако <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_n=a_{n-1}=...=a_{m+1}=1,a_m=0,1\le{m}<n">, то 
  - <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_i'=a_i,i=1,...,m-1">
  - <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_m'=1">
  - <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_i'=0,i=m+1,...,n">
- ако <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_1=a_2=...=a_n=1">, то 
  - <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_1'=a_2'=...=a_n'=0">

**а)**

```cpp
#include <iostream>
#include <cmath>
void bin(unsigned n,unsigned k)
{
	unsigned i;
	std::cout << '(';
	for (i = 1 << k-1; i > 0; i = i / 2)
	{
		(n & i) ? std::cout << "1" : std::cout << "0";
		if (i != 1)
		{
			std::cout << ',';
		}
	}
	std::cout << ')';
}

int main()
{
	unsigned n;
	std::cin >> n;
	for (size_t i = 0; i < pow(2,n); i++)
	{
		bin(i,n);
		std::cout << std::endl;
	}
	return 0;
}
```

**б)**

```cpp
#include <iostream>
#include <cmath>
void printArr(int* a, size_t n)
{
	std::cout << '(';
	for (size_t i = 0; i < n; i++)
	{
		std::cout << a[i];
		if (i != n - 1)
		{
			std::cout << ',';
		}
	}
	std::cout << ')';
	std::cout << std::endl;
}
int main()
{
	size_t n, m;
	std::cout << "n = ";
	std::cin >> n;

	int a[30];

	for (size_t i = 0; i < n; i++)
	{
		a[i] = 0;
	}
	for (size_t i = 0; i < pow(2, n); i++)
	{
		if (a[n] == 0)
		{
			a[n] = 1;
			printArr(a, n);
		}
		else
		{
			m = n;
			while (a[m] == 1)
			{
				m = m - 1;
			}
			a[m] = 1;
			for (size_t i = m + 1; i < n; i++)
			{
				a[i] = 0;
			}
			printArr(a, n);
		}
	}
	return 0;
}
```

***Нека се опитаме да обобщим по-горната задача, като я зададем по следния начин:***

Да се напише програма, която генерира всички <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-мерни вектори с компоненти числата <img src="https://latex.codecogs.com/svg.latex?\Large&space;0,1,...,k-1">, където <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> и <img src="https://latex.codecogs.com/svg.latex?\Large&space;k"> са дадени естествени числа.

За целта ще направим обобщение на операцията събиране по модул 2, като определим операцията **събиране по модул <img src="https://latex.codecogs.com/svg.latex?\Large&space;k">**.

**Дефиниция**. Нека <img src="https://latex.codecogs.com/svg.latex?\Large&space;a=(a_1,a_2,...,a_n)"> е произволен <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-мерен вектор с компоненти <img src="https://latex.codecogs.com/svg.latex?\Large&space;0,1,...,k-1">, a <img src="https://latex.codecogs.com/svg.latex?\Large&space;e=(0,...,0,1)"> е единичния <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-мерен вектор. **Сумата по модул <img src="https://latex.codecogs.com/svg.latex?\Large&space;k">** на вектора <img src="https://latex.codecogs.com/svg.latex?\Large&space;a"> с вектор <img src="https://latex.codecogs.com/svg.latex?\Large&space;e"> е векторът <img src="https://latex.codecogs.com/svg.latex?\Large&space;a'=(a_1',a_2',...,a_n')">, чиито компоненти се образуват съгласно следните правила:

- ако <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_n<k-1">, то 
  - <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_i'=a_i,i-1,2,...,n-1"> 
  - <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_n'=a_n+1">.
- ако <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_n=a_{n-1}=...=a_{m+1}=k-1,a_m<k-1,1\le{m}<n">, то 
  - <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_i'=a_i,i=1,...,m-1">
  - <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_m'=a_m+1">
  - <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_i'=0,i=m+1,...,n">
- ако <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_1=a_2=...=a_n=k-1">, то 
  - <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_1'=a_2'=...=a_n'=0">

```cpp
#include <iostream>
#include <cmath>
void printArr(int* a, size_t n)
{
	std::cout << '(';
	for (size_t i = 1; i <= n; i++)
	{
		std::cout << a[i];
		if (i != n)
		{
			std::cout << ',';
		}
	}
	std::cout << ')';
	std::cout << std::endl;
}
int main()
{
	int n, m, k;
	std::cout << "n = ";
	std::cin >> n;
	std::cout << "k = ";
	std::cin >> k;
	int a[30];

	for (int i = 1; i <= n; i++)
	{
		a[i] = 0;
	}
	printArr(a, n);
	for (int i = 1; i <= pow(k, n) - 1; i++)
	{
		if (a[n] < k - 1)
		{
			a[n] = a[n] + 1;
			printArr(a, n);
		}
		else
		{
			m = n;
			while (a[m] == k - 1)
			{
				m = m - 1;
			}
			a[m] = a[m] + 1;
			for (int i = m + 1; i <= n; i++)
			{
				a[i] = 0;
			}
			printArr(a, n);
		}
	}
	return 0;
}
```
Задачата може да се обобщи още повече като се разшири функционолността и по следния начин: Да се образуват всички <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-мерни вектори с компоненти <img src="https://latex.codecogs.com/svg.latex?\Large&space;v_1,v_2,...,v_k">, където <img src="https://latex.codecogs.com/svg.latex?\Large&space;k"> и <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> са дадени естествени числа, <img src="https://latex.codecogs.com/svg.latex?\Large&space;v_1,v_2,...,v_k"> са различни елементи.

За да реализираме и тази програма, трябва да съобразим, че в предишната задача, редицата <img src="https://latex.codecogs.com/svg.latex?\Large&space;a[1],a[2],...,a[n]"> е една вариация с повторение на елементите <img src="https://latex.codecogs.com/svg.latex?\Large&space;0,1,...,k-1">. Тогава редицата <img src="https://latex.codecogs.com/svg.latex?\Large&space;a[1]+1,a[2]+1,...,a[n]+1"> е една вариация с повторение на елементите <img src="https://latex.codecogs.com/svg.latex?\Large&space;1,2,...,k">, които са индекси на редицата <img src="https://latex.codecogs.com/svg.latex?\Large&space;v_1,v_2,...,v_k">.

Ще е необходимо да променим фунцкията за печатане на конзолата като <img src="https://latex.codecogs.com/svg.latex?\Large&space;std::cout << a[i];"> се замени с <img src="https://latex.codecogs.com/svg.latex?\Large&space;std::cout<<v[a[i]+1];">, както и редицата <img src="https://latex.codecogs.com/svg.latex?\Large&space;v_1,v_2,...,v_k"> да се въведе в главната програма.

```cpp
#include <iostream>
#include <cmath>
#include <string>
template<typename T>
void printArr(int* a, size_t n, T * v)
{
	std::cout << '(';
	for (size_t i = 1; i <= n; i++)
	{
		std::cout << v[a[i] + 1];
		if (i != n)
		{
			std::cout << ',';
		}
	}
	std::cout << ')';
	std::cout << std::endl;
}
int main()
{
	int n, m, k;
	std::cout << "n = ";
	std::cin >> n;
	/*std::cout << "k = ";
	std::cin >> k;*/
	k = 3;
	int a[30];

	/*char* v = new char[k+1];
	for (int i = 1; i <= k; i++)
	{
		v[i] = (char)(96 + i);
	}*/

	std::string* v = new std::string[k + 1];
	v[1] = "tik";
	v[2] = "tak";
	v[3] = "toe";

	for (int i = 1; i <= n; i++)
	{
		a[i] = 0;
	}
	printArr(a, n, v);
	for (int i = 1; i <= pow(k, n) - 1; i++)
	{
		if (a[n] < k - 1)
		{
			a[n] = a[n] + 1;
			printArr(a, n, v);
		}
		else
		{
			m = n;
			while (a[m] == k - 1)
			{
				m = m - 1;
			}
			a[m] = a[m] + 1;
			for (int i = m + 1; i <= n; i++)
			{
				a[i] = 0;
			}
			printArr(a, n, v);
		}
	}
	delete[] v;
	return 0;
}
```
