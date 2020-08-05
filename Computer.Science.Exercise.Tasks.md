**Пермутации от k елемента**



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

```cpp
#include <iostream>
#include <cmath>
void printArr(size_t n, size_t* a)
{
	for (size_t i = 0; i < n; i++) std::cout << a[i];
	std::cout << std::endl;
}
int main()
{
	size_t a[30]; size_t n, m;
	std::cout << "n = ";
	std::cin >> n;
	a[0] = 1;
	for (size_t i = 1; i < n; i++) a[i] = 0;
	printArr(n, a);
	for (size_t i = 1; i < 9 * pow(10, n - 1); i++)
	{
		if (a[n - 1] < 9)
		{
			a[n - 1]++;
			printArr(n, a);
		}
		else
		{
			m = n;
			while (a[m - 1] == 9)m--;
			a[m - 1]++;
			for (size_t j = m; j < n; j++)a[j] = 0;
			printArr(n, a);
		}
	}
	return 0;
}
```
Използването на оператора

```cpp
for (size_t i = 1; i < 9 * pow(10, n - 1); i++)
```
прави горната програма неприложима за големи стойности на <img src="https://latex.codecogs.com/svg.latex?\Large&space;n">. Това може да се избегне като този оператор се замени с оператора *do while*:

```cpp
#include <iostream>
#include <cmath>
void printArr(size_t n, size_t* a)
{
	for (size_t i = 0; i < n; i++) std::cout << a[i];
	std::cout << std::endl;
}
bool nine(size_t n, size_t* a)
{
	for (size_t i = 0; i < n; i++) if (a[i] != 9) return true;	
	return false;
}
int main()
{
	size_t a[30]; size_t n, m;
	std::cout << "n = ";
	std::cin >> n;
	a[0] = 1;
	for (size_t i = 1; i < n; i++) a[i] = 0;
	printArr(n, a);
	do
	{
		if (a[n - 1] < 9)
		{
			a[n - 1]++;
			printArr(n, a);
		}
		else
		{
			m = n;
			while (a[m - 1] == 9)m--;
			a[m - 1]++;
			for (size_t j = m; j < n; j++)a[j] = 0;
			printArr(n, a);
		}
	} while (nine(n, a));
	return 0;
}
```
Където функцията *bool nine()* проверява дали всички елементи на редицата <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_1,a_2,...,a_n"> са равни на 9.
