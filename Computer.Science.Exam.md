### Изпит по Увод в програмирането
спец. Компютърни науки 1.02.2019 г. `Вариант Б`

**Задача 1.** (3 т.) Подредица на дадена редица <img src="https://latex.codecogs.com/svg.latex?\Large&space;a"> наричаме всяка непрекъсната последователност от елементи на редицата. Да се дефинира функция ***unsigned progression(int a[], unsigned n)***, която намира дължината на най-дългата подредица от нарастващи числа в масива <img src="https://latex.codecogs.com/svg.latex?\Large&space;a"> с <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> елемента.

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
		if (*(first - 1) > *first) break; // проверка за растене на подредицата чрез поинтъри
		t.end = first;
		if (r.len() < t.len()) r = t; // избираме максималната дължина
	}
	return r.len();
}
int main()
{
	int a[] = {1,3,1,2,3,1 };
	unsigned n = sizeof(a) / sizeof(a[0]);
	
	std::cout << progress(a,n);
	return 0;
}
````
**Задача 2.** (6 т.) Нека е дадена квадратната матрица <img src="https://latex.codecogs.com/svg.latex?\Large&space;A"> от цели числа <img src="https://latex.codecogs.com/svg.latex?\Large&space;\mathbb{N}">x<img src="https://latex.codecogs.com/svg.latex?\Large&space;\mathbb{N}">, <img src="https://latex.codecogs.com/svg.latex?\Large&space;2\leq\mathbb{N}\leq{100}">, представляваща „лабиринт“. Елементите на матрицата със стойност по-гпляма от числото 0 смятаме за „проходими“, а всички останали - за „непроходими“. „Низходящ път“ в лабиринта наричаме всяка последователност от проходими елементи на матрицата, в която всеки следващ елемент е или вдясно, или под предишния.

Да се дефинира функция ***bool reachable(int A[][100], unsigned N, int sx, int sy, int targer)***, която проверява дали в лабиринта, зададен чрез матрицата <img src="https://latex.codecogs.com/svg.latex?\Large&space;A">, съществува низходящ път от елемента с координати ***(sx,sy)*** до някой елемент със стойност ***target*** такъв, че елементите на пътя да образуват ненамаляваща редица от числа.

Пример: На фигурата по-долу, такъв път съществува от елемента с координати ***(0,0)*** до целеви елемент със стойност ***target=60***, но не и до целеви елемент със стойност ***target=40***.

1|0|1|0
---- | ---- | ---- | ----
**10**|**15**|**1**|**1**
**50**|**20**|**50**|**50**
**40**|**0**|**40**|**60**

***Решение:***
````cpp
#define N 4
#include <iostream>
bool reachable(int A[N][N], int n, int x, int y, int target)
{
	if (x < 0 || y < 0 || x >= n || y >= n) return false;
	if (A[x][y] == target) return true;

	if (y + 1 < n && A[x][y] <= A[x][y + 1]) // ако е възможен преход надясно
	{
		if (reachable(A, n, x, y + 1, target)) return true;
	}
	if (x + 1 < n && A[x][y] <= A[x + 1][y]) // ако е възможен преход надолу
	{
		if (reachable(A, n, x + 1, y, target)) return true;
	}
	return false; // не съществува възможен преход
}
int main()
{
	int A[N][N] = { { 1, 2, 4, 3},
			{10,15, 6, 8},
			{50,20,50,50},
			{40, 0,40,60} };
	std::cout << reachable(A, N, 0, 0, 8);
	return 0;
}
````
**Задача 3.** (6 т.) Да се дефинита подходяща структура ***Planet***, описваща планетно тяло в система с една звезда със следните параметри (пренебрегваме влиянието на всички други тела, освен на звездата):
- координати на центъра на тежестта на тялото в евклидова отправна система с начало в центъра на звездата на системата;
- диаметър;
- наличие на живот (да или не);
- описание (символен низ до 20 символа).

а) Да се създаде масив от 5 планети и да се въведат от стандартния вход стойности на параметрите им;

б) Да се дефинира функция ***void printPlanets(Planet planets[], unsigned n)***, която по даден масив ***planets*** от ***n*** планетни тела извежда на стандартния изход подходящо форматирана информация за планетите в реда на срещането им в масива;

в) Да се дефинира функция ***Planet findPlanet(Planet planets[], unsigned n, char type)***, която в даден масив ***planets*** от ***n*** планетни тела намира и връща планетата, която:
- е най-близо до звездата на системата, ако ***type=='s'***;
- е най-малката по диаметър и с наличие на живот, ако ***type=='d'***, като ако на никоя от планетите в системата няма живот, да се върне планетата с най-малък диаметър;
- е с обем най-близък до средно аритметичното на обемите на всички планети, за всички други стойности на ***type***.

***Упътване:*** Допускаме, че планетите са сферични, обемът на сфера се намира по формулата <img src="https://latex.codecogs.com/svg.latex?\Large&space;V=\frac{4}{3}{\pi}r^3">, където ***r*** е радиусът на сферата.

***Решение:***
````cpp
#define _USE_MATH_DEFINES
#include <iostream>
#include <cmath>
#include <cstring>
#include <climits>
struct Planet
{
	double x;
	double y;
	double z;
	double d;
	bool life;
	char name[20];

	Planet();
	Planet(double x, double y, double z, double d, bool life, char name[20]);
};
void printPlanet(Planet p[]);
void printPlanets(Planet planets[], unsigned n);
Planet findPlanet(Planet planets[], unsigned n, char type);
double getDistanceToStar(Planet p[]);
double getVolume(Planet p[]);
int main()
{
	char planet1[20] = "Earth";
	Planet* Earth = new Planet(2, 2, 2, 500, 0, planet1);

	char planet2[20] = "Uranus";
	Planet* Uranus = new Planet(8, 10, 9, 25, 0, planet2);

	char planet3[20] = "Mars";
	Planet* Mars = new Planet(3, 4, 8, 400, 0, planet3);

	char planet4[20] = "Jupiter";
	Planet* Jupiter = new Planet(22, 14, 18, 350, 0, planet4);

	char planet5[20] = "Saturn";
	Planet* Saturn = new Planet(6, 15, 10, 175, 0, planet5);

	Planet* planets = new Planet[5];

	planets[0] = *Earth;
	planets[1] = *Uranus;
	planets[2] = *Mars;
	planets[3] = *Jupiter;
	planets[4] = *Saturn;

	printPlanets(planets, 5);

	std::cout << "\nClosest to the Star planet is: ";
	printPlanet(&findPlanet(planets, 5, 's'));
	std::cout << "\nSmallest planet (with life) is: ";
	printPlanet(&findPlanet(planets, 5, 'd'));
	std::cout << "\nPlanet with middle volume is: ";
	printPlanet(&findPlanet(planets, 5, 'v'));
	return 0;
}
Planet::Planet()
{
	this->x = 0;
	this->y = 0;
	this->z = 0;
	this->d = 0;
	this->life = false;
	char name[] = "default";
	size_t len = sizeof(name) / sizeof(name[0]) + 1;
	strcpy_s(this->name, len, name);
}
Planet::Planet(double x, double y, double z, double d, bool life, char name[20])
{
	this->x = x;
	this->y = y;
	this->z = z;
	this->d = d;
	this->life = life;
	size_t len = strlen(name) + 1;
	strcpy_s(this->name, len, name);
}
void printPlanet(Planet p[])
{
	std::cout << p->name << " with coordinates (" << p->x << ", " << p->y << ", " << p->z 
	<< "), diameter " << p->d << " and ";
	(p->life) ? std::cout << "life existence." : std::cout << "no life existence.";
	std::cout << std::endl;
}
void printPlanets(Planet planets[], unsigned n)
{
	for (size_t i = 0; i < n; i++) printPlanet(&planets[i]);	
}
Planet findPlanet(Planet planets[], unsigned n, char type)
{
	if (type == 's')
	{
		double minDistance = DBL_MAX;
		Planet* closestPlanet = nullptr;
		for (size_t i = 0; i < n; i++)
		{
			if (getDistanceToStar(&planets[i]) < minDistance)
			{
				minDistance = getDistanceToStar(&planets[i]);
				closestPlanet = &planets[i];
			}
		}
		return *closestPlanet;
	}
	else if (type == 'd')
	{
		double minDiameter = DBL_MAX;
		Planet* smallestPlanet = nullptr;
		double minDiameterWithLife = DBL_MAX;
		Planet* smallestPlanetWithLife = nullptr;
		for (size_t i = 0; i < n; i++)
		{
			if (planets[i].d < minDiameter)
			{
				minDiameter = planets[i].d;
				smallestPlanet = &planets[i];
			}
			if (planets[i].d < minDiameterWithLife && planets[i].life == true)
			{
				minDiameterWithLife = planets[i].d;
				smallestPlanetWithLife = &planets[i];
			}
		}
		if (smallestPlanetWithLife)	return *smallestPlanetWithLife;
		else return *smallestPlanet;
	}
	else
	{
		double sumVol = 0;
		for (size_t i = 0; i < n; i++) sumVol += getVolume(&planets[i]);		
		double minDiff = DBL_MAX;
		Planet* middleVolPlanet = nullptr;
		double averageVol = sumVol / n;
		for (size_t i = 0; i < n; i++)
		{
			if (abs(averageVol - getVolume(&planets[i])) < minDiff)
			{
				minDiff = abs(averageVol - getVolume(&planets[i]));
				middleVolPlanet = &planets[i];
			}
		}
		return *middleVolPlanet;
	}
}
double getDistanceToStar(Planet p[])
{
	double vecLen = sqrt(pow(p->x, 2) + pow(p->y, 2) + pow(p->z, 2));
	return vecLen;
}
double getVolume(Planet p[])
{
	return (4.0*M_PI / 3.0)*pow(p->d / 2.0, 2);
}
````
