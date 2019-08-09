### Изпит по Увод в програмирането
спец. Компютърни науки 1.02.2019 г. `Вариант Б`

**Задача 1.** (3 т.) Подредица на дадена редица <img src="https://latex.codecogs.com/svg.latex?\Large&space;a"> наричаме всяка непрекъсната последователност от елементи на редицата. Да се дефинира функция *unsigned progression(int a[], unsigned n)*, която намира дължината на най-дългата подредица от нарастващи числа в масива <img src="https://latex.codecogs.com/svg.latex?\Large&space;a"> с <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> елемента.

***Пример:*** За масива {1, 3, ***1, 2, 3***, 1} дължината е 3, за масива {4, 3, 2, 1} дължината е 1.

***Решение:***
- *първи стандартен подход*
````cpp
#include <iostream>
unsigned progression(int a[], unsigned n)
{
	if (n == 0) return 0; //частен случай - празната редица
	//временен и максимален брояч за дължината на растящата подредица
	unsigned currCount(0), maxCount(0);	
	for (unsigned i = 0; i < n; i++)
	{
		for (unsigned j = i; j < n; j++)
		{
			if (n - i <= maxCount) goto end;/* оптимизираме кода, ако максималната 
			растяща подредица до тоя момент е с X елемента, а до края на 
			масива/редицта има по-малко от X елемента, то няма смисъл да 
			продължаваме да търсим по-дълга растяща редица*/
			if (a[j] < a[j + 1]) currCount++; /* ако редицата е растяща (както 
			се иска в условието) - инкрементираме брояча*/
			else // в противен случай
			{
				i = j; /* прескачаме до мястото до където се е счупила растящата 
				редица и започваме да търсим от новото място*/
				break;
			}
		}
		if (currCount > maxCount) maxCount = currCount;
		//ако временния брояч е станал по-голям от максималния - новия максимален става временния
		currCount = 0; // рестартираме временния брояч
	}
end:return maxCount + 1;
}
int main()
{
	int a[] = { 1,3,1,2,3,1 };
	unsigned n = sizeof(a) / sizeof(a[0]); // намираме дължината на масива

	std::cout << progression(a, n);

	return 0;
}
````
- *втори идеен подход*
````cpp
#include <iostream>
struct Range
{
	const int *begin, *end;
	int len() const
	{
		return end - begin;
	}
};
unsigned progress(int a[], unsigned n)
{
	int* first = a; int* last = &a[n - 1];
	Range r{ nullptr, nullptr }, t;
	while (first < last)
	{
		t.begin = first;
		while (++first != last)
			if (*(first - 1) > *first) break; /* проверка за растене на
											  подредицата чрез поинтъри*/
		t.end = first;
		if (r.len() < t.len()) r = t; // избиране на максималната дължина
	}
	return r.len();
}
int main()
{
	int a[] = {1,3,1,2,3,1 };
	unsigned n = sizeof(a) / sizeof(a[0]);	
	std::cout << progress(a,n);
}
````
