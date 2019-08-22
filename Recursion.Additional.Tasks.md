## РЕКУРСИЯ (*допълнителни задачи*)

**Зад. 1.** Да се напише рекурсивна функция *int min(size_t n, int a[])*, която намира минималния елемент на вектора <img src="https://latex.codecogs.com/svg.latex?\Large&space;a=(a_1,a_2,...,a_n)">.

*Решение:*

```cpp
#include <iostream>
int min(size_t n, int a[])
{	
	if (n == 1) return a[0];
	else
	{
		int b = min(n - 1, a);
		if (b < a[n - 1]) return  b;		
		else return a[n - 1];		
	}
}
int main()
{
	int a[] = { 2,4,0,-19,5,8,-22,1 };
	size_t n = sizeof(a) / sizeof(a[0]);
	std::cout << min(n, a);
	return 0;
}
```

**Зад. 2.** Да се напише рекурсивна функция *int sum(size_t n, int a[])*, която намира сумата от елементите на вектора <img src="https://latex.codecogs.com/svg.latex?\Large&space;a=(a_1,a_2,...,a_n)">.

*Решение:*

```cpp
#include <iostream>
int sum(size_t n, int a[])
{
	if (n == 1) return a[0];	
	else return sum(n - 1, a) + a[n - 1];	
}
int main()
{
	int a[] = { 1,2,3,4,5,-4,-3,-2,-1 };
	size_t n = sizeof(a) / sizeof(a[0]);
	std::cout << sum(n, a);
	return 0;
}
```

**Зад. 3.** Да се напише рекурсивна функция, която по дадено естествено число <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> пресмята произведението на естествените числа от 1 до <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> със стъпка 3, т.е. <img src="https://latex.codecogs.com/svg.latex?\Large&space;P=1.4.7.10...n">.

*Решение:*

```cpp
#include <iostream>
size_t P(size_t n)
{
	if (n == 1) return 1;
	else
	{
		if (n % 3 == 1)	return P(n - 1)*n;
		else return P(n - 1);		
	}
}
int main()
{
	size_t n;
	std::cout << "n = ";
	std::cin >> n;
	std::cout << P(n);
	return 0;
}
```
**Зад. 4.** Да се напишат итеративна и рекурсивна функция за изчисляване стойността на полинома на [Ермит](https://en.wikipedia.org/wiki/Hermite_polynomials "Markdown Tutorial") <img src="https://latex.codecogs.com/svg.latex?\Large&space;h_n(x)">(<img src="https://latex.codecogs.com/svg.latex?\Large&space;x"> е реална, а <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> е цяла променлива <img src="https://latex.codecogs.com/svg.latex?\Large&space;n\ge{0}">), дефиниран по следния начин:

- <img src="https://latex.codecogs.com/svg.latex?\Large&space;h_0{x}=1">
- <img src="https://latex.codecogs.com/svg.latex?\Large&space;h_1{x}=2x">
- <img src="https://latex.codecogs.com/svg.latex?\Large&space;h_n{x}=2x.h_{n-1}(x)-2(n-1)/h_{n-2}(x),n>1.">


*Решение:*

