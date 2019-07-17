  ## TASKS
  #### SIMPLE CALCULATIONS; CONDITIONAL STATEMENTS (if, else/switch); LOOPS (for/while); ARRAYS; MATRICES; FUNCTIONS AND                    RECURSION; STRINGS; COMPLEX TASKS

**1.** Write a program which initializes 2 variables and then swaps their values.

**2.** Write a program which asks the user to enter 3 numbers and prints whether there exist a triangle. If so, print the type of the 
   triangle (scalene, isoscles or equaterial).
   
**3.** Write a program wchick assigns to the variable k the number of the quadrant in which the point P(x, y) is located.

**4.** Write a program which calculates the arithmetic mean of the digits of a given integer long long number, formatted to the second 
   digit after the decimal point.

**5.** Write a function with signature bool checkDate(const char* text), which verifies if the input parameter is a correct date in 
   DD.MM format. Do not use string.
   
**6.** Write a function which checks whether a string is а substring in another string. If true, the functions must return the index 
   to the first position the substring is located in the string, else return -1.
   
**7.** Write a function with signature int digitPos(long long num, int k), which returns the k-th digit of the number num or -1 if 
   such position does not exist. It starts counting from left to right and from 1. For example: digitPos(1234, 3) returns 3.
   
**8.** Write a function with signature void revert(char* text), which converts the given string as a parameter, replacing all 
   lowercase Latin alphabets with uppercase and reverse. Do not use the built-in string library.
   
**9.** Write a function with signature double sqrt_x(double x, double eps), which calculates a square root of x with an epsilon (eps) 
   precision.
   
**10.** Write a function which by a given real number x and a non-negative integer n returns x raised to the n-th power. Use Karatsuba
   multiplication method (recursion).

**11.** Write a function which counts words in char* text. A "word" is defined to be a single or a sequence of characters different from 
   ' ', '\t', '\n'. If the array of characters is empty, the function must return -1.
   
**12.** Write a program which asks the user for a long long number and then prints:	

• the same number in binary;

• the same number in oct;

• the same number in hex.

**13.** Write a program which asks the user for a non-negative integer n and gives the n-th number of Fibonacci.

**14.** Write a program which asks the user for a non-negative integer n and gives the n-th number of the sequence <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_{n+2}=5a_{n+1}-6a_n+6^n">, with <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_0=0"> <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_1=1">.

**15.** Write a program which asks the user for the numbers <img src="https://latex.codecogs.com/svg.latex?\Large&space;0\leq{k}\leq{n}"> and prints the number of combinations <img src="https://latex.codecogs.com/svg.latex?\Large&space;\binom{n}{k}">. Hints: <img src="https://latex.codecogs.com/svg.latex?\Large&space;\binom{n}{k}=\frac{n!}{k!(n-k)!}=C_{n}^{k}"> , also <img src="https://latex.codecogs.com/svg.latex?\Large&space;C_{n}^{0}=C_{n}^{n}=1"> and <img src="https://latex.codecogs.com/svg.latex?\Large&space;C_{n}^{k}=C_{n-1}^{k}+C_{n-1}^{k-1}">.

**16.** Write a function which by given n, finds the number of solutions of the system in natural numbers <img src="https://latex.codecogs.com/svg.latex?\Large&space;\mathbb{N}\cup{0}">:

<img src="https://latex.codecogs.com/svg.latex?\Large&space;\left\{\begin{array}{l}x_1+x_2+x_3+x_4+x_5=n\\x_1<10\\10\leq{x_2}<30\\x_4>20\\x_5<30\end{array}\right."> 

input | output
------------ | -------------
30 | 0
31 | 1
32 | 5
100 | 249000

**17.** Write a program whick converts a decimal number lying between 1 and 3999 to Roman numerals.

input | output
------------ | -------------
44 | XLIV
1111 | MCXI
2018 | MMXVIII

**18.** Write a program which asks the user for 5 numbers - a, b, c, p, q and prints the maximum and minimum value of the quadratic function  <img src="https://latex.codecogs.com/svg.latex?\Large&space;f(x)=ax^2+bx+c">  in the range <img src="https://latex.codecogs.com/svg.latex?\Large&space;[p;q]">.

input | output 
------------ | ------------- 
<img src="https://latex.codecogs.com/svg.latex?\Large&space;a=3,b=2,c=1,p=-1,q=2"> | <img src="https://latex.codecogs.com/svg.latex?\Large&space;max=17.00;min=0.67">

**19.** Manufacturers of vending machines like to make their machines return as little as possible coins change. Write down a program that accepts a sum - the change that has to be returned and calculates the smallest number of coins with which this action can take place.

input | output | explanation
------------ | ------------- | -------------
0.88 | 6 | 0.50+0.20+0.10+0.05+0.02+0.01 
1.55 | 3 | 1.00+0.50+0.05
2.63 | 5 | 2.00+0.50+0.10+0.02+0.01

**20.** Write a program which by given two days of any year computes the number of days between them. Hint:
struct tm
Member | Type | Meaning | Range
------------ | ------------- | ------------- | -------------
tm_sec | int | seconds after the minute | 0-60*
tm_min | int | minutes after the hour | 0-59
tm_hour | int | hours since midnight | 0-23
tm_mday | int | day of the month | 1-31
tm_mon | int | months since January | 0-11
tm_year | int | years since 1900 | -
tm_wday | int | days since Sunday | 0-6
tm_yday | int | days since January 1 | 0-365
tm_yday | int | Daylight Saving Time flag |  -
tm_isdst | 5 | 2.00+0.50+0.10+0.02+0.01 | -
