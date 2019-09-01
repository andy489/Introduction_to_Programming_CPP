**Pattern 1.** For given <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> print Pascal's triangle.

*for* <img src="https://latex.codecogs.com/svg.latex?\Large&space;n=5">:
``` 
          1
        1   1
      1   2   1
    1   3   3   1
  1   4   6   4   1
```
*Solution:*

```cpp
#include <iostream>
int main()
{
	int rows, coef = 1;
	std::cout << "Enter number of rows: ";
	std::cin >> rows;
	for (int countNums = 0; countNums < rows; countNums++)
	{
		for (int space = 1; space <= rows - countNums; space++)	std::cout << "  ";
		for (int j = 0; j <= countNums; j++)
		{
			if (j == 0) coef = 1;
			else coef = coef * (countNums - j + 1) / j;
			std::cout << coef << "   ";
		}
		std::cout << std::endl;
	}
	return 0;
}
```

**Pattern 2.** For given <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> print the following number triangle.

*for* <img src="https://latex.codecogs.com/svg.latex?\Large&space;n=5">:
``` 
         1
       2 3 2
     3 4 5 4 3
   4 5 6 7 6 5 4
 5 6 7 8 9 8 7 6 5
```
*Solution:*

```cpp
#include <iostream>
int main()
{
	int rows, count = 0, count1 = 0, k = 0;
	std::cout << "Enter number of rows: ";
	std::cin >> rows;
	for (int i = 1; i <= rows; ++i)
	{
		for (int space = 1; space <= rows - i; space++)
		{
			std::cout << "  ";
			count++;
		}
		while (k != 2 * i - 1)
		{
			if (count <= rows - 1)
			{
				std::cout << i + k << " ";
				count++;
			}
			else
			{
				count1++;
				std::cout << i + k - 2 * count1 << " ";
			}
			k++;
		}
		count1 = count = k = 0;
		std::cout << std::endl;
	}
	return 0;
}
```

**Pattern 3.** For given <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> print the following number triangle.

*for* <img src="https://latex.codecogs.com/svg.latex?\Large&space;n=5">:
``` 
          1
        1 2 1
      1 2 3 2 1
    1 2 3 4 3 2 1
  1 2 3 4 5 4 3 2 1
```
*Solution:*

```cpp
#include<iostream>
int main()
{
	int i, j, n, s;
	int a = 1;
	std::cout << "Enter number of rows : ";
	std::cin >> n;
	s = n;
	while (s > 0)
	{
		std::cout << "  ";
		s--;
	}
	s = n - 1;
	std::cout << a << "\n";
	for (i = 1; i < n; i++)
	{
		a = 1;
		s = n - i;
		while (s > 0)
		{
			std::cout << "  ";
			s--;
		}
		for (j = 0; j <= i * 2; j++)
		{
			if (j < i)
			{
				std::cout << a << ' ';
				a++;
			}
			else
			{
				std::cout << a << ' ';
				a--;
			}
		}
		std::cout << "\n";
		s = n - 1;
	}
	return 0;
}
```

**Pattern 4.** For given <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> print the following number square.

*for* <img src="https://latex.codecogs.com/svg.latex?\Large&space;n=5">:
``` 
17 16 15 14 13
18 5  4  3  12
19 6  1  2  11
20 7  8  9  10
21 22 23 24 25
```
*Solution:*

```cpp
#include <iostream>
#include <cmath>
int numDigits(int n)
{
	return (int)log10(n) + 1;
}

void spaces(int n, int k)
{
	int len1 = numDigits(n*n);
	int len2 = numDigits(k);
	for (int i = 0; i < 1 + len1 - len2; i++)
	{
		std::cout << ' ';
	}
}
int main()
{
	int matrix[16][16];
	int n;
	int i, j;
	int iIncr, jIncr;
	int num;
	int k;
	int m;
	std::cin >> n;
	if (n == 1)
	{
		std::cout << 1;
		return 0;
	}
	if (n % 2 == 0)
	{
		i = 0;
		j = 0;
		iIncr = 0;
		jIncr = 1;
	}
	else
	{
		i = n - 1;
		j = n - 1;
		iIncr = 0;
		jIncr = -1;
	}
	m = n;
	num = n * n;
	while (num > 0)
	{
		for (k = 0; k < m; ++k)
		{
			matrix[i][j] = num;
			--num;
			i += iIncr;
			j += jIncr;
		}
		m--;
		i -= iIncr;
		j -= jIncr;
		iIncr = jIncr;
		jIncr = 0;
		i += iIncr;
		for (k = 0; k < m; ++k)
		{
			matrix[i][j] = num;
			--num;
			i += iIncr;
			j += jIncr;
		}
		i -= iIncr;
		j -= jIncr;
		jIncr = -iIncr;
		iIncr = 0;
		j += jIncr;
	}
	for (i = 0; i < n; ++i)
	{
		for (j = 0; j < n; ++j)
		{
			std::cout << matrix[i][j];
			spaces(n, matrix[i][j]);
		}
		std::cout << std::endl;
	}
	return 0;
}

```
