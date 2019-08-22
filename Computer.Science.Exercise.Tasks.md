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

За решаването на тази задача трябва да се образуват всички вариации на числата 0 и 1 от <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-ти клас. За целта ще използваме операцията **събиране на вектори по модул 2**. В подточка а) това събиране може да се улесни с помощта на побитовия оператор &, но в подточка б) не може да се използва подобрн оператор. За нея ще трябва да се имплементира програма, която замества работата на оператора.

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
void bin(size_t n,size_t k)
{
	unsigned i;
	std::cout << '(';
	for (i = 1 << k-1; i > 0; i = i / 2)
	{
		(n & i) ? std::cout << "1" : std::cout << "0";
		if (i != 1) std::cout << ',';		
	}
	std::cout << ')';
}

int main()
{
	size_t n;
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
		if (i != n - 1)	std::cout << ',';		
	}
	std::cout << ")\n";
	}
int main()
{
	size_t n, m;
	std::cout << "n = ";
	std::cin >> n;
	int a[30];
	for (size_t i = 0; i < n; i++) a[i] = 0;	
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
			while (a[m] == 1) m--;			
			a[m] = 1;
			for (size_t i = m + 1; i < n; i++) a[i] = 0;			
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
void printArr(size_t* a, size_t n)
{
	std::cout << '(';
	for (size_t i = 1; i <= n; i++)
	{
		std::cout << a[i];
		if (i != n) std::cout << ',';
	}
	std::cout << ")\n";
}
int main()
{
	size_t n, m, k;
	std::cout << "n = ";
	std::cin >> n;
	std::cout << "k = ";
	std::cin >> k;
	size_t a[30];
	for (size_t i = 1; i <= n; i++) a[i] = 0;
	printArr(a, n);
	for (size_t i = 1; i <= pow(k, n) - 1; i++)
	{
		if (a[n] < k - 1)
		{
			a[n] = a[n] + 1;
			printArr(a, n);
		}
		else
		{
			m = n;
			while (a[m] == k - 1) m --;			
			a[m] = a[m] + 1;
			for (size_t i = m + 1; i <= n; i++) a[i] = 0;
			printArr(a, n);
		}
	}
	return 0;
}
```
Задачата може да се обобщи още повече като се разшири функционолността ѝ по следния начин: Да се образуват всички <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-мерни вектори с компоненти <img src="https://latex.codecogs.com/svg.latex?\Large&space;v_1,v_2,...,v_k">, където <img src="https://latex.codecogs.com/svg.latex?\Large&space;k"> и <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> са дадени естествени числа, <img src="https://latex.codecogs.com/svg.latex?\Large&space;v_1,v_2,...,v_k"> са различни елементи.

За да реализираме и тази програма, трябва да съобразим, че в предишната задача, редицата <img src="https://latex.codecogs.com/svg.latex?\Large&space;a[1],a[2],...,a[n]"> е една вариация с повторение на елементите <img src="https://latex.codecogs.com/svg.latex?\Large&space;0,1,...,k-1">. Тогава редицата <img src="https://latex.codecogs.com/svg.latex?\Large&space;a[1]+1,a[2]+1,...,a[n]+1"> е една вариация с повторение на елементите <img src="https://latex.codecogs.com/svg.latex?\Large&space;1,2,...,k">, които са индекси на редицата <img src="https://latex.codecogs.com/svg.latex?\Large&space;v_1,v_2,...,v_k">.

Ще е необходимо да променим фунцкията за печатане на конзолата като <img src="https://latex.codecogs.com/svg.latex?\Large&space;std::cout<<a[i];"> се замени с <img src="https://latex.codecogs.com/svg.latex?\Large&space;std::cout<<v[a[i]+1];">, както и редицата <img src="https://latex.codecogs.com/svg.latex?\Large&space;v_1,v_2,...,v_k"> да се въведе в главната програма.

```cpp
#include <iostream>
#include <cmath>
#include <string>
template<typename T>
void printArr(size_t* a, size_t n, T * v)
{
	std::cout << '(';
	for (size_t i = 1; i <= n; i++)
	{
		std::cout << v[a[i] + 1];
		if (i != n) std::cout << ',';
	}
	std::cout << ")\n";
}
int main()
{
	size_t n, m, k;
	std::cout << "n = ";
	std::cin >> n;
	/*std::cout << "k = ";
	std::cin >> k;*/
	k = 3;
	size_t a[30];
	/*char* v = new char[k+1];
	for (int i = 1; i <= k; i++)
	{
		v[i] = (char)(96 + i);
	}*/
	std::string* v = new std::string[k + 1];
	v[1] = "tik"; v[2] = "tak"; v[3] = "toe";
	for (size_t i = 1; i <= n; i++) a[i] = 0;
	printArr(a, n, v);
	for (size_t i = 1; i <= pow(k, n) - 1; i++)
	{
		if (a[n] < k - 1)
		{
			a[n] = a[n] + 1;
			printArr(a, n, v);
		}
		else
		{
			m = n;
			while (a[m] == k - 1)m --;
			a[m] = a[m] + 1;
			for (size_t i = m + 1; i <= n; i++)	a[i] = 0;			
			printArr(a, n, v);
		}
	}
	delete[] v;
	return 0;
}
```

**Вариации без повторения**

**Дефиниция**. Ако <img src="https://latex.codecogs.com/svg.latex?\Large&space;v_1,v_2,...,v_k"> са <img src="https://latex.codecogs.com/svg.latex?\Large&space;k"> на брой различни елементи <img src="https://latex.codecogs.com/svg.latex?\Large&space;(k\ge{1}),n"> е произволно естествено число <img src="https://latex.codecogs.com/svg.latex?\Large&space;n\le{k}">, всяка редица от точно <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> елемента от дадените, като всеки елемент може да участва не повече от веднъж, се нарича **вариация без повторения от дадените k елемента от n-ти клас.**

**Пример**: Нека <img src="https://latex.codecogs.com/svg.latex?\Large&space;k=3,v_1=0,v_2=1,v_3=2">, а <img src="https://latex.codecogs.com/svg.latex?\Large&space;n=2">.

Следните редици <img src="https://latex.codecogs.com/svg.latex?\Large&space;(0,1),(0,2),(1,0),(1,2),(2,0),(2,1)"> са вариациите без повторения на елементите <img src="https://latex.codecogs.com/svg.latex?\Large&space;v_1,v_2"> и <img src="https://latex.codecogs.com/svg.latex?\Large&space;v_3"> от втори клас.

**Задача 3.** (*ВАРИАЦИИ БЕЗ ПОВТОРЕНИЯ*) Нека <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> и <img src="https://latex.codecogs.com/svg.latex?\Large&space;k"> са дадени естествени числа <img src="https://latex.codecogs.com/svg.latex?\Large&space;(n\le{k})">. Да се напише програма, която намира всички вариации без повторение от елементите <img src="https://latex.codecogs.com/svg.latex?\Large&space;0,1,...,k-1"> от <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-ти клас.

За решаването на тази задача е необходимо в предходната задача с вариациите да се извършат следните промени:
- а) да се провери дали <img src="https://latex.codecogs.com/svg.latex?\Large&space;(n\le{k})">;
- б) да се изведат само онези <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-орки, които се състоят от различни елементи. За целта ще използваме булевата функция *bool diff()*, Която проверява дали редицата от <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> естествени числа <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_1,a_2,...,а_n"> се състои от различни елементи.

***Решение:***

```cpp
#include <iostream>
#include <cmath>
void printArr(size_t* a, size_t n)
{
	std::cout << '(';
	for (size_t i = 1; i <= n; i++)
	{
		std::cout << a[i];
		if (i != n)	std::cout << ',';
	}
	std::cout << ")\n";
}
bool diff(size_t* a, int n)
{
	for (int i = 1; i <= n; i++)
	{
		int curr = a[i];
		for (int j = i + 1; j <= n; j++) if (a[i] == a[j]) return false;		
	}
	return true;
}
int main()
{
	size_t n, m, k;
	std::cout << "n = ";
	std::cin >> n;
	std::cout << "k = ";
	std::cin >> k;
	size_t a[30];
	if (n <= k)
	{
		for (size_t i = 1; i <= n; i++) a[i] = 0;
		for (size_t i = 1; i <= pow(k, n) - 1; i++)
		{
			if (a[n] < k - 1)
			{
				a[n] = a[n] + 1;
				if (diff(a, n))	printArr(a, n);
			}
			else
			{
				m = n;
				while (a[m] == k - 1) m--;
				a[m] = a[m] + 1;
				for (size_t i = m + 1; i <= n; i++) a[i] = 0;
				if (diff(a, n))	printArr(a, n);
			}
		}
	}
	return 0;
}
```
**Пермутации от k елемента**

Вариациите без повторение от <img src="https://latex.codecogs.com/svg.latex?\Large&space;k"> елемента от <img src="https://latex.codecogs.com/svg.latex?\Large&space;k">-ти клас ще наричаме **пермутации от k елемента** , т.е. това са такива редици от по <img src="https://latex.codecogs.com/svg.latex?\Large&space;k"> елемента, във всяка от които влизат всички елементи. Редицицте се различават само по местата на елементите.

**Комбинации от k елемента от n-ти клас**

**Дефиниция.** Ако <img src="https://latex.codecogs.com/svg.latex?\Large&space;v_1,v_2,...,v_k"> са <img src="https://latex.codecogs.com/svg.latex?\Large&space;k">  на брой различни елементи <img src="https://latex.codecogs.com/svg.latex?\Large&space;(k\ge{1})">, а <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> е дадено естествено число <img src="https://latex.codecogs.com/svg.latex?\Large&space;(n\le{k})">, всяка редица от точно <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> елемента от дадените, като всеки елемент може да участва не повече от веднъж и мястото на елемента в редицата не е от значение, се нарича **комбинация от k-елемента от n-ти клас**.

*Пример:* Ако <img src="https://latex.codecogs.com/svg.latex?\Large&space;k=4,v_1=1,v_2=2,v_3=3,v_4=4">, а <img src="https://latex.codecogs.com/svg.latex?\Large&space;n=2">, всички комбинации от тези елементи от 2-ри клас се получават от вариациите с повторение от 1,2,3 и 4 от 2-ри клас

(1,1) (2,1) (3,1) (4,1)

***(1,2)*** (2,2) (3,2) (4,2)

***(1,3)*** ***(2,3)*** (3,3) (4,3)

***(1,4)*** ***(2,4)*** ***(3,4)*** (4,4)

се изберат редиците с растящи стойности например. Означени са удебелено и наклонено (Редиците (1,2) и (2,1);(1,4) и (4,1) и т.н. са еквивалентни).

**Задача 4.** (*КОМБИНАЦИИ*) Да се напише програма, която намира всички комбинации от елементите <img src="https://latex.codecogs.com/svg.latex?\Large&space;0,1,...,k-1"> от <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-ти клас <img src="https://latex.codecogs.com/svg.latex?\Large&space;n\le{k}">.

***Решение:***

Трябва да бъдат генерирани всички вариации с повторение от елементите <img src="https://latex.codecogs.com/svg.latex?\Large&space;0,1,...,k-1"> и се изведат онези, които образуват например строго монотонно растящи редици.

За целта може да се използва функцията *bool mon()*, която установява дали дадена редица от цели числа е строго монотонно растяща.

```cpp
bool mon(size_t* a, int n)
{
	for (int i = 1; i <= n; i++)
	{
		int curr = a[i];
		for (int j = i + 1; j <= n; j++) if (a[i] >= a[j]) return false;
	}
	return true;
```
**Задача 5.** (*КОМБИНАТОРНИ АЛГОРИТМИ*) Да се напише програма, която намира всички <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-цифрени естествени числа (<img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> е дадено естествено число).

***Решение:***

Ще използваме алгоритъма за генериране на всички <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">-мерни вектори от елементите <img src="https://latex.codecogs.com/svg.latex?\Large&space;0,1,2...,9">, като първата компонента на векторите трябва да е различна от 0.


***Решение:***

