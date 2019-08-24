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

- <img src="https://latex.codecogs.com/svg.latex?\Large&space;h_0(x)=1">
- <img src="https://latex.codecogs.com/svg.latex?\Large&space;h_1(x)=2x">
- <img src="https://latex.codecogs.com/svg.latex?\Large&space;h_n(x)=2x.h_{n-1}(x)-2(n-1).h_{n-2}(x),n>1.">

Да се сравнят двата кода.

*Решение:*

- а) итеративна функция

```cpp
#include <iostream>
double Hermit(size_t n, double x)
{
	double h0, h1, h;
	if (n == 0)return 1;
	else
	{
		if (n == 1)return 2 * x;
		else
		{
			h0 = 1;
			h1 = 2 * x;
			for (size_t i = 1; i <= n - 1; i++)
			{
				h = 2 * x*h1 - 2 * i*h0;
				h0 = h1;
				h1 = h;
			}
			return h1;
		}
	}
}
```

- б) рекурсивна функция

```cpp
double Hermit(size_t n, double x)
{
	if (n==0) return 1;
	else
	{
		if (n==1) return 2 * x;		
		else return 2 * x*Hermit(n - 1, x) - 2 * (n - 1)*Hermit(n - 2, x);		
	}
}
```
и в двата случая за *main()* функция може да се използва:

```cpp
int main()
{
	size_t n;
	std::cout << "n = ";
	std::cin >> n;
	double x;
	std::cout << "x = ";
	std::cin >> x;
	std::cout << Hermit(n, x);
	return 0;
}
```
Очевидно имплементацията на рекурсивната функция е в пъти по-кратка от итеративната, но дали е по интуитивна?

**Зад. 5.** Да се напише програма, която въвежда редица от символи с произволна дължина. Въвеждането да продължи до въвеждане на символа '!'. Програмата да извежда редицата от символи в обратен ред (Да не се използва масив).

Пример: 

вход | изход
---- | ----
recursion!| !noisrucer

*Решение:*

```cpp
#include <iostream>
void rev()
{
	char ch;
	std::cin >> ch;
	if (ch != '!') rev();
	std::cout << ch;
}
int main()
{
	rev();
	return 0;
}
```
**Зад. 6.** Дадена е матрица <img src="https://latex.codecogs.com/svg.latex?\Large&space;А(N">x<img src="https://latex.codecogs.com/svg.latex?\Large&space;N)">. Да се напише рекурсивна програма, която развива матрицата <img src="https://latex.codecogs.com/svg.latex?\Large&space;А"> по спирала в посока по часовниковата стрелка.

Например ако за <img src="https://latex.codecogs.com/svg.latex?\Large&space;N=3,A"> има вида <img src="https://latex.codecogs.com/svg.latex?\Large&space;A=\begin{pmatrix}a_{11}&a_{12}&a_{13}\\a_{21}&a_{22}&a_{23}\\a_{31}&a_{32}&a_{33}\end{pmatrix}">

да се конструира редицата <img src="https://latex.codecogs.com/svg.latex?\Large&space;B=(a_{11},a_{12},a_{13},a_{23},a_{33},a_{32},a_{31},a_{21},a_{22})">.

*Решение:*

**Анализ на задачата:**

Ще използваме рекурсивната функция  *void spiral()*, която развива по спирала частта <img src="https://latex.codecogs.com/svg.latex?\Large&space;A'"> на <img src="https://latex.codecogs.com/svg.latex?\Large&space;А">

<img src="https://latex.codecogs.com/svg.latex?\Large&space;A=\begin{pmatrix}a_{k,k}&a_{k,k+1}&...&a_{k,n-k+1}\\a_{k+1,k}&a_{k+1,k+1}&...&a_{k+1,n-k+1}\\...\\a_{n-k+1,k}&a_{n-k+1,k+1}&...&a_{n-k+1,n-k+1}\end{pmatrix}">

```cpp
#include <iostream>

int** createMatrix(int n);
void fillMatrix(int** &A, int n);
void releaseMatrix(int** A, int n);
void printMatrix(int** A, int n);
void printSequence(int* B, int n);
int* createSequence(int n);
void releaseSequence(int* B);

void spiral(int** A, int k, int n, int* &B, unsigned& c)
{
	int i, j;
	// развиване на k-ти ред
	i = k;
	for (j = k; j <= n - 1 - k; j++)
	{
		B[c] = A[i][j];
		c++;
	}
	// развиване на n-k-ви стълб
	j = n - 1 - k;
	for (i = k + 1; i < n - k; i++)
	{
		B[c] = A[i][j];
		c++;
	}
	// развиване на n-k-ви ред
	i = n - 1 - k;
	for (j = n - 1 - k - 1; j >= k; j--)
	{
		B[c] = A[i][j];
		c++;
	}
	// развиване на k-ти стълб
	j = k;
	for (i = n - 1 - k - 1; i > k; i--)
	{
		B[c] = A[i][j];
		c++;
	}
	// преминаваме на развиване на вътрешността на А'
	k++;// променяме k (много важен момент)
	if (k == n-1 - k)
	{
		// остава само един елемент за развиване
		B[c] = A[k][k];
		c++;
	}
	else
	{
		if (k < n-1 - k)
		{
			// има още спирали за развиване
			spiral(A, k, n, B, c);
		}
	}
}

int main()
{
	int n;
	std::cout << "size of matrix n = ";
	std::cin >> n;

	int** A = createMatrix(n);
	fillMatrix(A, n);
	std::cout << "The matrix is:\n";
	printMatrix(A, n);

	int* B = createSequence(n);

	unsigned c(0); // брояч помнещ точната позиция за поставяне в редицата
	spiral(A, 0, n, B, c); // рекурсивната функция за спираловидно извеждане

	printSequence(B, n*n);

	releaseMatrix(A, n);
	releaseSequence(B);

	return 0;
}

int** createMatrix(int n)
{
	int** A = new int*[n];
	for (int i = 0; i < n; i++)
	{
		A[i] = new int[n];
	}
	return A;
}
void fillMatrix(int** &A, int n)
{
	std::cout << "Fill the matrix with size " << n << 'x' << n << ":\n";
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			std::cout << "a[" << i << "][" << j << "] = ";
			std::cin >> A[i][j];
		}
		std::cout << std::endl;
	}
}
void releaseMatrix(int** A, int n)
{
	for (int i = 0; i < n; i++)
	{
		delete[] A[i];
	}
	delete[] A;
}
void printMatrix(int** A, int n)
{
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			std::cout << A[i][j] << ' ';
		}
		std::cout << std::endl;
	}
}
void printSequence(int* B, int n)
{
	std::cout << "The sequence is:\n";
	for (int i = 0; i < n; i++)
	{
		std::cout << B[i] << ' ';
	}
	std::cout << std::endl;
}
int* createSequence(int n)
{
	int* B = new int[n*n];
	return B;
}
void releaseSequence(int* B)
{
	delete[] B;
}
```
**Зад. 7<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">.** Дадена е двумерна мрежа от клетки (матрица), всяка от които е празна или запълнена. Запълнените клетки, които са свързани, т.е. имат съседни в хоризонтално, вертикално или диагонално направление, образуват област. Да се напише програма, която намира броя на областите и размера (в брой клетки) на всяка област.

*Решение:*

**Анализ на задачата:**

Ще дефинираме функция *int countAreas()*, която преброява клетките в областта, съдържаща дадена клетка <img src="https://latex.codecogs.com/svg.latex?\Large&space;(X,Y)">. Функцията има два параметъра <img src="https://latex.codecogs.com/svg.latex?\Large&space;X"> и <img src="https://latex.codecogs.com/svg.latex?\Large&space;Y"> - координатите на точката и реализира следния алгоритъм:

*а)* Ако клетката с координати <img src="https://latex.codecogs.com/svg.latex?\Large&space;X"> и <img src="https://latex.codecogs.com/svg.latex?\Large&space;Y"> е извън мрежата, приемаме, че броят е равен на 0.

*б)* Ако клетката с координати <img src="https://latex.codecogs.com/svg.latex?\Large&space;X"> и <img src="https://latex.codecogs.com/svg.latex?\Large&space;Y"> е празна, приемаме, че броят е равен на 0.

*в)* В останалите случаи, броят на клетките от областта е равен на сумата от 1 и броя на клетките на всяка област, на която принадлежат осемте съседни клетки на клетката с координати <img src="https://latex.codecogs.com/svg.latex?\Large&space;(X,Y)">.

От подточка *в)* следва, че функцията *int count()* е рекурсивна. За да избегнем зацикляне, трябва преди рекурсивното обръщение да направим клетката <img src="https://latex.codecogs.com/svg.latex?\Large&space;(X,Y)"> празна.

```cpp
#define N 8
#define M 13
#include <iostream>

// създаваме си произволна мрежа с размери NxM
char web[N][M] = {
		' ','a',' ',' ','a',' ',' ',' ',' ',' ',' ','a',' ',
		' ','a',' ','a','a',' ',' ',' ',' ',' ',' ','a','a',
		' ','a','a','a','a',' ',' ',' ',' ',' ',' ','a','a',
		' ',' ',' ','a',' ',' ',' ',' ',' ',' ',' ',' ',' ',
		' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',
		'a',' ',' ',' ',' ',' ','a',' ',' ',' ',' ',' ','a',
		'a','a',' ',' ','a','a','a',' ',' ',' ','a','a','a',
		'a','a',' ',' ',' ',' ',' ',' ',' ',' ','a','a','a'
};
void printWeb(); // функция за принтиране на мрежата имплементирана по-долу

int countAreas(int x, int y)
{
	unsigned count;

	if (x < 0 || x > N - 1 || y < 0 || y > M - 1) // извън мрежата
	{
		count = 0;
	}
	else
	{
		if (web[x][y] == ' ') // при стъпване на празна клетка големината на региона е 0
		{
			count = 0;
		}
		/* в този случай не сме извън мрежата и не сме стъпили на празна клетка следователно
		сме стъпили на запълнена и започваме да броим размера на областта*/
		else
		{
			web[x][y] = ' ';
			count = 1 + countAreas(x - 1, y + 1) + countAreas(x, y + 1)
				+ countAreas(x + 1, y + 1) + countAreas(x + 1, y) +
				+countAreas(x + 1, y - 1) + countAreas(x, y - 1) +
				countAreas(x - 1, y - 1) + countAreas(x - 1, y);
		}
	}
	return count;
}
int main()
{
	std::cout << "The starting web:\n";
	printWeb();
	unsigned br(0); // брояч за номер на област
	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < M; j++)
		{
			if (web[i][j] != ' ')
			{
				br++;
				std::cout << "~The area of region " << br << " is " << countAreas(i, j);
				std::cout << "\n~Web after counting region " << br << ":\n";
				printWeb();
			}
		}
	}
	return 0;
}
void printWeb()
{
	for (size_t i = 0; i < N; i++)
	{
		for (size_t j = 0; j < M; j++) std::cout << web[i][j];
		std::cout << std::endl;
	}
	std::cout << std::endl;
}
```
**Зад. 8<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">.** Дадени са <img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> града (<img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> е естествено число <img src="https://latex.codecogs.com/svg.latex?\Large&space;n\ge{1}">) и целочислена матрица <img src="https://latex.codecogs.com/svg.latex?\Large&space;A_{nX{n}}">, така че:

<img src="https://latex.codecogs.com/svg.latex?\Large&space;A_{i,j}=\left\{\begin{matrix}1,ako{\ominus}&\\0,ako{\oslash}&\end{matrix}\right.">

<img src="https://latex.codecogs.com/svg.latex?\Large&space;\ominus"> - има пряк път от <img src="https://latex.codecogs.com/svg.latex?\Large&space;i">-тия до <img src="https://latex.codecogs.com/svg.latex?\Large&space;j">-тия град;

<img src="https://latex.codecogs.com/svg.latex?\Large&space;\oslash"> - няма пряк път от <img src="https://latex.codecogs.com/svg.latex?\Large&space;i">-тия до <img src="https://latex.codecogs.com/svg.latex?\Large&space;j">-тия град.

<img src="https://latex.codecogs.com/svg.latex?\Large&space;(0\le{i}\le{n},0\le{j}\le{n})">. Да се напише програма, която установява дали съществува път между два произволно зададени града. (Приемаме, че ако от град <img src="https://latex.codecogs.com/svg.latex?\Large&space;i"> до град <img src="https://latex.codecogs.com/svg.latex?\Large&space;j"> има път, то има път от град <img src="https://latex.codecogs.com/svg.latex?\Large&space;j"> до град <img src="https://latex.codecogs.com/svg.latex?\Large&space;i"> също).

**Анализ на задачата:**

