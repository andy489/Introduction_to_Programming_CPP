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

**Pattern 2.** For given <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> print the following triangle.

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
