# TASKS
*Exercise tasks*
  
## 1. Simple operations and calculations. Primitive data types.
**1.01.** Write a program which initializes 2 variables and then swaps their values.

**1.02.** Write a program which asks the user for his age and then prints the number of seconds, days, weeks, months he has lived on the Earth.

**1.03.** Write a program which asks the user for the lengths of sides of a triangle and prints the area of the triangle.
 
**1.04.** Write a program which asks the user for three numbers a, d and n and prints the sum of the first n numbers of arithmetic progression with starting number a and difference d.

**1.05.** Yana decides to make a party and goes to the alcohol market to buy beer, wine, brandy and whiskey. On the console she inputs the price of the whiskey (lv./liter), and the quantities of the products, which she has to buy (liters). Write a program that calculates how much money she needs to pay for the bill, knowing that:

  - the price of the brandy is half-lower than this of the whiskey;

  - the price of the wine is with 40% cheaper than this of the brandy;

  - the price of the beer is with 80% cheaper than this of the brandy;

Print a single number on the console: the money that Yana needs to pay for the bill, formatted to the second digit after the floating point.


## 2. Conditional statements (if/else if/else/switch). Nested conditional statements 

**2.01** George must build a spacecraft to carry some of his crew. For this purpose, he has to make it so that there is room for at least three astronouts, but no more than 10. Every astronaut needs a small room that is of dimensions: 2 meters wide, 2 meters long and 40 cm - higher than the average height of the astronauts. Write down a program that calculates the volume of the ship, the capacity of astronaut that can carry and print on the console if that capacity is enough. The input is read from the console and contains exactly 4 rows: 

   - In the first row is the ship's width;  
   - In the second row is the length of the ship; 
   - In the third row is the height of the ship;
   - In the fourth row is the average astronaut height;
    
Print on the console one line: 
   
   - The number of astronauts is between 3 and 10: "The spacecraft holds `{number of astronauts}` astronauts." 
   - If the number of astronauts is less than 3: "The spacecraft is too small." 
   - If the number of astronauts is greater than 10: "The spacecraft is too big."

**2.02.** Write a program which asks the user to enter 3 numbers and prints whether there exist a triangle. If so, print the type of the triangle:

   a) scalene, isoscles or equaterial

   b) obtuse, right-angled or acute.

**2.03.** Write a program which asks the user for a number n and prints whether n is a leap year.

**2.04.** Manufacturers of vending machines like to make their machines return as little as possible coins change. Write down a program that accepts a sum - the change that has to be returned and calculates the smallest number of coins with which this action can take place.

input | output | explanation
------------ | ------------- | -------------
0.88 | 6 | 0.50+0.20+0.10+0.05+0.02+0.01 
1.55 | 3 | 1.00+0.50+0.05
2.63 | 5 | 2.00+0.50+0.10+0.02+0.01

**2.05.** Write a program wchich assigns to the variable k the number of the quadrant in which the point P(x, y) is located.
And checks if point P(x, y) lies in the:

  - unit square with center O(0,0);

  - unit circle with center O(0,5;0,5);


**2.06.** Write a program whick converts a decimal number lying between 1 and 3999 to Roman numerals (string allowed).

input | output
------------ | -------------
44 | XLIV
1111 | MCXI
2018 | MMXVIII

**2.07.** Write a program which asks the user to enter a number up to **3-digits** and then prints its English name (string allowed).

**2.08.** Write a program which asks the user for 5 numbers - a, b, c, p, q and prints the maximum and minimum value of the quadratic function  <img src="https://latex.codecogs.com/svg.latex?\Large&space;f(x)=ax^2+bx+c">  in the range <img src="https://latex.codecogs.com/svg.latex?\Large&space;[p;q]">.

input | output 
------------ | ------------- 
<img src="https://latex.codecogs.com/svg.latex?\Large&space;a=3,b=2,c=1,p=-1,q=2"> | <img src="https://latex.codecogs.com/svg.latex?\Large&space;max=17.00;min=0.67">

**2.09.** A student goes to an exam which starts at a specific time (for example at 9:30). He comes to the exam room in a given arrival time (e.g. 9:40). It is believed that the student is in time if he arrives at the start of the exam or up to half an hour before. If he comes earlier with more than 30 minutes, he is early. If he come after the start of the exam, he is late. Write a program that reads the begining of the exam and time of arrival and prints whether the student arrived on time, whether he arrived early or is late and how many hours or minutes he has came before or after the exam.

<details><summary>Input/Output explanation</summary>
<p>

Input

The concole reads 4 unsigned integer numbers (one in each row), entered by the user:

  - The first row contains an exam hour - an integer from 0 to 23.

  - The second row contains an exam minute - an integer from 0 to 59.

  - The third row contains an arrival hour - an integer from 0 to 23.

  - The forth row contains an arrival minute - an integer from 0 to 59.

Output

On the first row print:

  - “Late”, if the student arrives after the hour of the exam.

  - “On time”, if the student arrives at the exact time of the exam or 30 minutes earlier.

  - “Early”, if the student arrives 30 or more minutes after the hour of the exam.

If the student arrives with at least one minute difference frm the exact exam beginning, print:

  - “mm minutes before the start” for arriving earlier with less than hour.

  - “hh:mm hours before the start” for arriving earliar with 1 hour ot more. 

  - “mm minutes after the start” for under hour delay.

  - “hh:mm hours after the start” for more than 1 hour or more delay. 

Always print the minutes with two digits, for exammple: "1:05".
   
input | output
------------ | -------------
14 | On time
00 | 5 minutes before the start
13 | 
55 |  

input | output
------------ | -------------
16 | Early
00 | 1:00 hours before the start
15 | 
00 |

input | output
------------ | -------------
14 | On time
00 | 
14 | 
00 |   

</p>
</details>

**2.10.** Kaloyan is a student who lives in Sofia and walks from time to time to his hometown. He is very keen on football but busy during business days and playing football only on weekends and holidays. Kaloyan plays in Sofia avery Saturday when he is not at work and does not travel to his hometown, as well as in 2/3 of festive days. He travels to his hometown h times in the year where he plays football with his old friends on Sunday. Kaloyan is not at work 3/4 of the weekends he's in Sofia. On the other hand, through the leap years, Kaloyan plays with 15% more football than normal. We assume that the year has exactly 48 weekends, suitable for football.

Write a program which calculates how many times Kaloyan has played football during the year. Round up the result down to the nearest integer (for example, 2.15 → 2; 9.95 → 9). The input data is entered by the user as follows:

  - The first line contains the word “leap” (leap year) or “normal” (normal year).

  - The second row contains an integer number p - number of holidays in the year (which are not Saturday and Sunday).

  - The third line contains an integer number h - the number of weekends in which Kaloyan travels to his hometown.

<details><summary>Example input/output</summary>
<p>

input | output
------------ | -------------
leap | 45
5 | 
2 | 

input | output
------------ | -------------
normal | 44
11 | 
6 | 

</p>
</details>

**2.11.** Write a poker-hand program. It should ask the user to enter 5 cards. The program must then tell the user what hand does he have (e.g. flush, quads, etc.).

   - use 'S' for spades, 'C' for clubs, 'H' for hearts, 'D' for diamonds
   
   - use the numbers between 2 and 14 for cards values (J=11, Q=12, K=13, A=14).
   
   - If you don't know how poker hands work, find a short [tutorial here](https://www.cardplayer.com/rules-of-poker/hand-rankings "Markdown Tutorial") .
   
Example input | Example output
------------ | -------------
C8 C7 C6 C5 C4 | straight flush
H11 D11 S11 C11 D7 | four of a kind
D3 C11 S8 H4 S2 | high card

## 3. Loops (while/for/do while). Nested loops. 

**3.01.** Fizz buzz is a group word game for children to teach them about division. Players take turns to count incrementally, replacing any number divisible by three with the word "fizz", and any number divisible by five with the word "buzz". Numbers divisible by 15, which is both become fizz buzz. For example, a typical round of fizz buzz would start as follows:

    1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, Fizz Buzz, 16, 17, Fizz, 19, Buzz, Fizz, 22, 23, Fizz, Buzz, 26, Fizz, 28, 29, Fizz Buzz, 31, 32, Fizz, 34, Buzz, Fizz, ...  

Writing a program to output the first 100 FizzBuzz numbers.

**3.02.** Write a program which calculates the arithmetic mean of the digits of a given integer long long number, formatted to the second digit after the decimal point.

**3.03.** Write a function with signature int digitPos(long long num, int k), which returns the k-th digit of the number num or -1 if such position does not exist. It starts counting from left to right and from 1. For example: digitPos(1234, 3) returns 3.

**3.04.** Write a function with signature double sqrt_x(double x, double eps), which calculates a square root of x with an epsilon (eps) precision.

**3.05.** Write a program which asks the user for a long long number and then prints:	

   - the same number in binary;

   - the same number in oct;
 
   - the same number in hex.

**3.06.** Write a program which asks the user for a number n and then prints whether n is a prime number or not.

**3.07** Write a program wchich asks the user for a number n and then prints all prime numbers smaller than n.

**3.08.** Write a program which asks the user for a number n and then prints all prime factors of n.

Example input | Example output
------------ | -------------
225 | 3.3.5.5
31668 | 2.2.3.7.13.29

**3.09.** Write a program which checks whether a number can be expressed as a sum of two prime numbers.

**3.10.** Wtire a program which asks the user for a number n and then prints a square with numbers with as many rows as n. Align all numbers in the square!

• For n=3, the output must be;     • For n=4, the output must be (note how all columns are aligned)

    1 2 3                       1  2  3  4
    4 5 6                       5  6  7  8 
    7 8 9                       9  10 11 12
                                13 14 15 16
                                
**3.11.** Wtire a program which asks the user for a number n and then prints a triangle with numbers with as many rows as n. This triangle is named after [Robert Floyd](https://en.wikipedia.org/wiki/Floyd%27s_triangle "Markdown Tutorial") . Align all numbers in the triangle!

• For n=4, the output must be;     • For n=7, the output must be (note how all columns are aligned)

    1                           1  
    2 3                         2  3 
    4 5 6                       4  5  6
    7 8 9 10                    7  8  9 10
                                11 12 13 14 15
                                16 17 18 19 20 21
                                22 23 24 25 26 27 28

**3.12.** Consider the sequence: <img src="https://latex.codecogs.com/svg.latex?\Large&space;1;2+3;4+5+6;7+8+9+10;...">. In other words, the n-th term of the sequence is the "sum of the next n natural numbers" - Felice Russo. Write a program which prints the first n terms of the sequence.

**3.13.** Write a program which checks to which row and column in the Floyd's triangle the number n belongs.

**3.14.** Wtire a program which asks the user for an odd number n and then prints a Christmas tree as wide as n. Print and error if n is not odd!

• For n=5, the output must be:       • For n=7, the output must be: 

      *                              *                     
     ***                            ***
    *****                          *****
      *                           *******
                                     *

**3.15.** Wtire a program which asks the user for an odd number n and then prints a Christmas tree as wide as n. Print and error if n is not odd!

• For n=5, the output must be:       • For n=5, the output must be: 

     *   *                         *     *
    *** ***                       ***   ***
     *****                       ***** *****
      ***                         *********
       *                           *******
                                    *****
                                     ***
                                      *

**3.16.** Ask a friend to take a piece of paper and ***write*** down a number from 1 to 1000, without showing it to you. Write a program that guesses the written number only by asking questions like “ ***Is your number bigger than {arbitrary number of your choice}?*** ”, etc. if your question contains the correct answer, then your friend needs to answer with “ ***that's the number!*** ”, otherwise with “ ***yes*** ” or “ ***no*** ”. Assuming your friend is not lying, how many questions will your program ask in the worst case?
                                           
## 4. Arrays

**4.01.** Write a function which takes two arguments - an array and its size and prints all elements of the array on the console.  

**4.02.** Write a function which takes two arguments - an array and its size and reverses the array. Example: {4,2,8,-6,12}->{12,-6,8,2,4}.

**4.03.** Write a program which asks the user to enter n - the number of numbers he will enter. Then the program should ask for n numbers and print the contents of the array in reverse.

   Example input | Example output 
   ------------- | -------------- 
   4 2 4 6 8 | 8 6 4 2
   5 1 0 1 0 -1 | -1 0 1 0 1 

**4.04.** Write a program which asks the user to enter n - the number of numbers he will enter. Then the program should ask for n numbers and print only the even numbers.

   Example input | Example output 
   ------------- | -------------- 
   4 1 2 3 -4 | 2 -4
   5 1 3 0 7 9  | 0 

**4.05.** Write a program which asks the user to enter n - the number of numbers he will enter. Then the program should ask for n numbers and print only the numbers that are smaller than the average of all numbers.

   Example input | Example output 
   ------------- | -------------- 
   7 1 2 3 4 5 6 7 | 1 2 3
   5 -2 4 -3 6 8  | -2 -3 
   
**4.06.** Write a program which asks the user to enter n - the number of numbers he will enter. Then the program should ask for n numbers and print the maximum and minimum of them.

   Example input | Example output 
   ------------- | -------------- 
   6 -2 -1 0 1 3 4 | 4 -2
   1 4 | 4 4

**4.07.** Write a function which takes three arguments - two double arrays - *source* and *destination* and unsigned *s* - size of the source. The function has to copy all elements from *source* to *destination* (assume destination is big enough).

**4.08.** Write a function which takes two arguments - an int array and its size, and sorts the array (in ascending or descending order).

**4.09** Write a function which takes two arguments - an int array and its size, and returns its median.

**4.10** Write a function which takes two arguments - an int array and its size, and returns its mode(s). "vector" and "algorithm" libraries are allowed, because the array can have more than one mode.

Example input | Example output 
   ------------- | -------------- 
   1 2 3 4 4 5 | 4
   22 3 11.9 22 3 4.5 -12 3 | 22 3
   0 1 2 3  | no mode  

*Mode & Median of a set of data*

Type | Description  
   ------------- | -------------- 
   Median | Middle value separating the greater and lesser halves of a data set 
   Mode | Most frequent value in a data set  
   

[More about Median and Mode of a set of data values here](https://www.khanacademy.org/math/in-in-class-7th-math-cbse/in-in-7th-data-handling/in-in-7th-data-handling-mean-median-basics/a/mean-median-and-mode-review?utm_account=Grant&utm_campaignname=Grant_Math_Dynamic&gclid=Cj0KCQjwvdXpBRCoARIsAMJSKqLVAk3oh5QcLGBqsu8gQXeRzaS8axXqg6_6cC5blZb6np86HGShZSYaAhoOEALw_wcB "Markdown Tutorial")

**4.11.** Write a program which asks the user to enter n - the number of numbers he will enter. Then the program should ask for n numbers and determine if the given array is hacksaw. We call a sequence of numbers hacksaw if the following is true: <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_0<a_1>a_2<a_3>a_4<a_5...a_n"> or <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_0>a_1<a_2>a_3<a_4>a_5...a_n">

   Example input | Example output 
   ------------- | -------------- 
   3   ***1 4 1*** | yes
   3   ***4 1 4*** | yes
   6  ***1 3 2 8 9 4*** | no
   7   ***0 1 0 1 0 1 0*** | yes
   4   ***4 -8 19 22*** | yes
   4   ***4 -8 19 19*** | no

**4.12.** Write a function with signature bool checkDate(const char* text), which verifies if the input parameter is a correct date in DD.MM format. Do not use string.

**4.13** Write a function which takes four arguments - an int array, first index and last index of the searched interval and wanted value x. Using the algorithm binary search, the function should return the index of x if it exists in the array, or -1 if it does not exist.

## 5. Matrices

**5.01.** 

## 6. Strings

**6.01.** Write a function with signature void revert(char* text), which converts the given string as a parameter, replacing all 
lowercase Latin alphabets with uppercase and reverse. Do not use the built-in string library.

**6.02.** Write a function which checks whether a string is а substring in another string. If true, the functions must return the index to the first position the substring is located in the string, else return -1.

**6.03.** Write a function which counts words in char* text. A "word" is defined to be a single or a sequence of characters different from ' ', '\t', '\n'. If the array of characters is empty, the function must return -1.

## 7. Functions and recursion

**7.01.** Write a function which by a given real number x and a non-negative integer n returns x raised to the n-th power. Use Karatsuba multiplication method (recursion).
   
**7.02.** Write a program which asks the user for a non-negative integer n and gives the n-th number of Fibonacci.

**7.03.** Write a program which asks the user for a non-negative integer n and gives the n-th number of the sequence <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_{n+2}=5a_{n+1}-6a_n+6^n">, with <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_0=0"> <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_1=1">.

**7.04.** Write a program which asks the user for the numbers <img src="https://latex.codecogs.com/svg.latex?\Large&space;0\leq{k}\leq{n}"> and prints the number of combinations <img src="https://latex.codecogs.com/svg.latex?\Large&space;\binom{n}{k}">. Hints: <img src="https://latex.codecogs.com/svg.latex?\Large&space;\binom{n}{k}=\frac{n!}{k!(n-k)!}=C_{n}^{k}"> , also <img src="https://latex.codecogs.com/svg.latex?\Large&space;C_{n}^{0}=C_{n}^{n}=1"> and <img src="https://latex.codecogs.com/svg.latex?\Large&space;C_{n}^{k}=C_{n-1}^{k}+C_{n-1}^{k-1}">.

**7.05.** Write a function which by given n, finds the number of solutions of the system in natural numbers <img src="https://latex.codecogs.com/svg.latex?\Large&space;\mathbb{N}\cup{0}">:

<img src="https://latex.codecogs.com/svg.latex?\Large&space;\left\{\begin{array}{l}x_1+x_2+x_3+x_4+x_5=n\\x_1<10\\10\leq{x_2}<30\\x_4>20\\x_5<30\end{array}\right."> 

input | output
------------ | -------------
30 | 0
31 | 1
32 | 5
100 | 249000

## 8. Other tasks  

**8.01.** Write a program which by given two days of any year computes the number of days between them. Hint:

struct tm

Member | Type | Meaning | Range
------------ | ------------- | ------------- | -------------
tm_sec | int | seconds after the minute | 0-60*
tm_min | int | minutes after the hour | 0-59
tm_hour | int | hours since midnight | 0-23
tm_mday | int | day of the month | 1-31
tm_mon | int | months since January | 0-11
tm_year | int | years since 1900 | 
tm_wday | int | days since Sunday | 0-6
tm_yday | int | days since January 1 | 0-365
tm_isdst | int | Daylight Saving Time flag | 


Conversion (function) | Do
------------ | -------------
asctime | Convert tm structure to string
ctime | Convert time_t value to string
