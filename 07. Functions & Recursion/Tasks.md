## 7. Functions and recursion

**7.01.** Write a function which takes three numbers and returns if the smallest one of them is prime.

**7.02.** Write a function which takes a character and returns if the character is either digit or letter.

**7.03.** Write a function which takes four numbers - coordinates of two <img src="https://latex.codecogs.com/svg.latex?2D"> points - <img src="https://latex.codecogs.com/svg.latex?A(x_1,y_1)">, <img src="https://latex.codecogs.com/svg.latex?B(x_2,y_2)"> and returns the distance between <img src="https://latex.codecogs.com/svg.latex?A"> and <img src="https://latex.codecogs.com/svg.latex?B">.

**7.04.** Write a function which takes six numbers - coordinates of three points in  <img src="https://latex.codecogs.com/svg.latex?2D">, and returns if they lie on a straight line.

**7.05.** Write a function which takes three numbers - coordinates of a <img src="https://latex.codecogs.com/svg.latex?3D"> vector, and returns the length of the vector.

**7.06.** Write a function which by a given real number x and a non-negative integer n returns x raised to the n-th power. Use Karatsuba multiplication method (recursion).
   
**7.07.** Write a program which asks the user for a non-negative integer <img src="https://latex.codecogs.com/svg.latex?n"> and gives the <img src="https://latex.codecogs.com/svg.latex?n-th"> number of ***Fibonacci***.

**7.08.** Write a program which asks the user for a number <img src="https://latex.codecogs.com/svg.latex?n"> and prints the first <img src="https://latex.codecogs.com/svg.latex?n"> numbers of ***Tribonacci***.

**7.09.** Write a program which asks the user for a non-negative integer <img src="https://latex.codecogs.com/svg.latex?n"> and gives the <img src="https://latex.codecogs.com/svg.latex?n-th"> number of the sequence <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_{n+2}=5a_{n+1}-6a_n+6^n">, with <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_0=0"> <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_1=1">.

**7.10.** Write a function which takes one integer <img src="https://latex.codecogs.com/svg.latex?n"> and returns <img src="https://latex.codecogs.com/svg.latex?n!">.

**7.11.** Write a program which asks the user for the numbers <img src="https://latex.codecogs.com/svg.latex?\Large&space;0\leq{k}\leq{n}"> and prints the number of combinations <img src="https://latex.codecogs.com/svg.latex?\Large&space;\binom{n}{k}">. Hints: <img src="https://latex.codecogs.com/svg.latex?\Large&space;\binom{n}{k}=\frac{n!}{k!(n-k)!}=C_{n}^{k}"> , also <img src="https://latex.codecogs.com/svg.latex?\Large&space;C_{n}^{0}=C_{n}^{n}=1"> and <img src="https://latex.codecogs.com/svg.latex?\Large&space;C_{n}^{k}=C_{n-1}^{k}+C_{n-1}^{k-1}">.

**7.12** Write a function which by given n, finds the number of solutions of the system in natural numbers <img src="https://latex.codecogs.com/svg.latex?\Large&space;\mathbb{N}\cup{0}">:

<img src="https://latex.codecogs.com/svg.latex?\Large&space;\left\{\begin{array}{l}x_1+x_2+x_3+x_4+x_5=n\\x_1<10\\10\leq{x_2}<30\\x_4>20\\x_5<30\end{array}\right."> 

Example input | Output
------------ | -------------
30 | 0
31 | 1
32 | 5
100 | 249000

**7.13.** Write a function which takes two integers, which are not all zero, and returns the largest positive integer that divides each of the integers (***greatest common divisor***). For example, the ***GCD*** of 8 and 12 is 4. Use [Euclid's algorithm](https://en.wikipedia.org/wiki/Euclidean_algorithm "Markdown Tutorial").

**7.14.** Write a function which calculates the value of a given polynomial using [Horner's method](https://en.wikipedia.org/wiki/Horner%27s_method "Markdown Tutorial").
