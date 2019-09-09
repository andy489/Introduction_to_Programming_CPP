### Вариант А

**Задача 1.** Числа на Куадроначи ще наричаме всяка поредица от числа, в която първите четири числа могат да бъдат произволни, 
а всяко след четвъртото се получава като сбор от предходните четири. Напишете програма, която намира N-тото число на Куадроначи.
Като вход на програмата потребителят трябва да въведе първите 4 числа на Куадроначи и <img src="https://latex.codecogs.com/svg.latex?\Large&space;N"> – номерът на числото, което трябва да се
намери. Като изход програмата трябва да изведе N-тото число на Куадроначи. Приемаме, че числата са <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_1,a_2,...,a_n">. 

*Пример:*

вход|изход
---|---
1 2 3 4 6|19

*Решение:*

```cpp
#include <iostream>

typedef unsigned int uint;

int main()
{
	uint a1, a2, a3, a4;
	uint n;

	if (n < 4) return 0;

	std::cin >> a1 >> a2 >> a3 >> a4 >> n;

	do
	{
		int an = (a1 + a2 + a3 + a4);
		a1 = a2; a2 = a3; a3 = a4; a4 = an;
	} while (--n > 4);

	std::cout << a4;

	return 0;
}
```

**Задача 2.** Да се напише програма, която създава масив от тип int с 1000 елемента и въвежда от потребителя цяло число 
<img src="https://latex.codecogs.com/svg.latex?\Large&space;N">, такова че 
<img src="https://latex.codecogs.com/svg.latex?\Large&space;0\le{N}\le{1000}">. 
Програмата да въведе от потребителя <img src="https://latex.codecogs.com/svg.latex?\Large&space;N"> числа в масива и да 
провери дали

* Всеки елемент намиращ се на позиция с четен индекс се дели на 2;

* За елементите на нечетни позиции е изпълнено, че всеки елемент на позиция 
<img src="https://latex.codecogs.com/svg.latex?\Large&space;k"> 
се дели на <img src="https://latex.codecogs.com/svg.latex?\Large&space;k">.

Ако това е изпълнено, програмата да изведе YES, a в противен случай – NO. 

вход|изход
---|---
5<br> 2 2 6 8 10|YES
5<br> 3 4 12 4 5|YES

*Решение:*

```cpp
#include <iostream>

typedef unsigned int uint;

int main() 
{
	uint n = 0, cpos = 1;
	bool even = false;
	bool goodseq = true;
	std::cin >> n;
	do 
	{
		uint num;
		std::cin >> num;
		if ((even && num & 1) ||
			(cpos && num % cpos)) 
		{
			goodseq = false;
		}
		even = !even;
	} while (++cpos <= n && goodseq);

	std::cout << (goodseq ? "YES" : "NO");
	return 0;
}
```

**Задача 3.** Да се напише програма, която създава масив от тип int с 1000 елемента и въвежда от потребителя цяло число 
<img src="https://latex.codecogs.com/svg.latex?\Large&space;N">, такова че 
<img src="https://latex.codecogs.com/svg.latex?\Large&space;0\le{N}\le{1000}">. 
Програмата да въведе от потребителя <img src="https://latex.codecogs.com/svg.latex?\Large&space;N"> числа в масива и след това 
да премахне от него всички числа, които са по-малки от сумата на предхождащите ги в масива. 
Резултатът да се получи в същия масив. Премахването да се извърши като елементите вдясно от числата, 
които трябва да се изтрият се преместят с една позиция наляво. Например:

вход|изход
---|---
10 20 1 500 60|10 20 500 

*Решение:*

```cpp
#include <iostream>
#include <time.h>

int ary[1000];

/*
 given a sequence of 1000 numbers (we'll generate it)
 clear all elements of the sequence, so that
 are lower than the sum of the preciding elements
*/

int main() 
{
	srand(time(NULL));

	int sum = 0;
	int cnum = 0;

	int numcount = sizeof(ary) / sizeof(int);

	// generate numbers, so that the beginning of the sequence
	// has lower values, and the end - higher 

	for (int i = 0; i < numcount; i++) 
	{
		ary[i] = (rand() % 1000) * i / numcount;
	}

	do 
	{
		if (ary[cnum] < sum) 
		{
			for (int i = cnum; i < numcount - 1; i++) 
			{
				ary[i] = ary[i + 1];
			}
			numcount--;
			ary[numcount] = 0;
		}
		else 
		{
			sum += ary[cnum];
			cnum++;
		}
	} while (cnum < numcount);

	return 0;
}

```

### Вариант B

**Задача 1.** Числа на Трибоначи ще наричаме всяка поредица от числа, в която първите три числа могат да бъдат произволни, а всяко след третото се получава като сбор от предходните три. Напишете програма, която намира n-тото число на Трибоначи.
Като вход на програмата потребителят трябва да въведе първите 3 числа на Трибоначи и <img src="https://latex.codecogs.com/svg.latex?\Large&space;N"> – номерът на числото, което трябва да се намери. Като изход програмата трябва да изведе <img src="https://latex.codecogs.com/svg.latex?\Large&space;N">-тото число на Трибоначи. Приемаме, че числата са <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_1,a_2,...,a_n">. 

*Пример:*

вход|изход
---|---
3 5 3 5|19

*Решение:*

```cpp
#include <iostream>

typedef unsigned int uint;

int main() 
{
	uint a1, a2, a3;
	uint n;

	std::cin >> a1 >> a2 >> a3 >> n;

	do 
	{
		int an = (a1 + a2 + a3);
		a1 = a2; a2 = a3; a3 = an;
	} while (--n > 3);

	std::cout << a3;

	return 0;
}
```
**Задача 2.**

Да се напише програма, която създава два масива *arr1* и *arr2* от тип int с 1000 елемента и въвежда от потребителя цяло число <img src="https://latex.codecogs.com/svg.latex?\Large&space;N">, такова че <img src="https://latex.codecogs.com/svg.latex?\Large&space;0\le{N}\le{1000}">. Програмата да въведе от потребителя <img src="https://latex.codecogs.com/svg.latex?\Large&space;N"> числа в масива *arr1* и след това да прехвърли в *arr2* всички елементи на *arr1*, които са прости числа. Да се изведе на екрана масивът *arr2*. 

*Забележка*: за решението тук приемаме, че числата се генерират на случаен принцип, а не се въвеждат от стандартен вход, но смисълът на решението е същия.

*Решение:*

```cpp
#include <iostream>
#include <time.h>
#define RAND_NUMS
typedef unsigned int uint;

uint arr1[1000];
uint arr2[1000];
uint pcache[170];

// based on the Prime Number theorem, there are less than 170 primes
// in the 1..1000 range

// in this solution we introduce a cache to keep primes that area
// already known, thus avoiding having to calculate all cached numbers
// beforehand

int main()
{
	int sum = 0;
	uint n;

	std::cin >> n;

	if (n > 1000)
	{   // bad input
		return 0;
	}

	// you can enable RAND_NUMS for tests with large 
	// arrays of randomly generated integers in the
	// [0..1000] range
#ifdef RAND_NUMS
	// just fill this array with random data, 
	// so that we don't have to input 100 numbers
	srand((unsigned)time(NULL));
	for (unsigned i = 0; i < n; i++)
	{
		arr1[i] = (rand() % 1000);
	}
#else
	for (unsigned i = 0; i < n; i++)
	{
		std::cin >> arr1[i];
	}
#endif
	int k = 0;
	int pcount = 0;

	for (unsigned i = 0; i < n; i++)
	{
		bool prime = true;

		// first check if this number can be divided by 
		// an already known prime factor
		for (int p = 0; p < pcount && prime; p++)
		{
			if (arr1[i] % pcache[p] == 0)
			{
				prime = false;
			}
		}

		for (unsigned j = 2; j < arr1[i] && prime; j++)
		{
			if (arr1[i] % j == 0) {
				prime = false;

				// we found a prime. good - add it to the cache
				pcache[pcount++] = j;
			}
		}

		if (prime)
		{
			arr2[k++] = arr1[i];
			pcache[pcount++] = arr1[i];
		}
	}
	for (int i = 0; i < k; i++)
	{
		std::cout << arr2[i] << std::endl;
	} while (k--);
}
```

**Задача 3.** Да се напише програма, която създава масив от тип int с 1000 елемента и въвежда от потребителя цели числа <img src="https://latex.codecogs.com/svg.latex?\Large&space;K"> и <img src="https://latex.codecogs.com/svg.latex?\Large&space;N">, такива че <img src="https://latex.codecogs.com/svg.latex?\Large&space;0\le{K}\le{N}\le{1000}">. Програмата да въведе от потребителя <img src="https://latex.codecogs.com/svg.latex?\Large&space;N"> числа в масива и след това да намери и изведе на екрана сумата на най-малките <img src="https://latex.codecogs.com/svg.latex?\Large&space;K"> числа в масива.

вход|изход
---|---
4 6<br>10 20 1 500 60 700|91


*Решение:*

```cpp
#include <iostream>
#include <time.h>
#define RAND_NUMS
typedef unsigned int uint;

uint ary[1000];

int main() {
	int sum = 0;
	uint n, k, spos = 0;

	std::cin >> k >> n;

	if (k > n) {    // bad input
		return 0;
	}

	// you can enable RAND_NUMS for tests with large 
	// arrays of randomly generated integers in the
	// [0..1000] range

#ifdef RAND_NUMS
	// just fill this array with random data, 
	// so that we don't have to input 100 numbers
	srand((unsigned)time(NULL));
	for (unsigned i = 0; i < n; i++) {
		ary[i] = (rand() % 1000);
	}
#else
	for (int i = 0; i < n; i++) {
		std::cin >> ary[i];
	}
#endif

	// do selection sort as we assume K is lot smaller than N
	do {
		for (unsigned i = spos; i < n; i++) {
			if (ary[i] < ary[spos]) {
				int t = ary[spos];
				ary[spos] = ary[i];
				ary[i] = t;
			}
		}

		sum += ary[spos++];
	} while (spos < k);

	std::cout << sum;
}
```
