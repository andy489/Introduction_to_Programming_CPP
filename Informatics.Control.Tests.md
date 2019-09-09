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
			//memcpy(&ary[cnum], &ary[cnum+1], ( sizeof (int) )* (numcount-cnum-1));
			//memcpy(ary + cnum, ary + cnum + 1, ( sizeof (int) )* (numcount-cnum-1));
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
