  ## TASKS
  #### SIMPLE CALCULATIONS; CONDITIONAL STATEMENTS (if, else/switch); LOOPS (for/while); ARRAYS; MATRICES; FUNCTIONS AND                    RECURSION; STRINGS; COMPLEX TASKS

1. Write a program which initializes 2 variables and then swaps their values.

2. Write a program which asks the user to enter 3 numbers and prints whether there exist a triangle. If so, print the type of the 
   triangle (scalene, isoscles or equaterial).
   
3. Write a program wchick assigns to the variable k the number of the quadrant in which the point P(x, y) is located.

4. Write a program which calculates the arithmetic mean of the digits of a given integer long long number, formatted to the second 
   digit after the decimal point.

5. Write a function with signature bool checkDate(const char* text), which verifies if the input parameter is a correct date in 
   DD.MM format. Do not use string.
   
6. Write a function which checks whether a string is а substring in another string. If true, the functions must return the index 
   to the first position the substring is located in the string, else return -1.
   
7. Write a function with signature int digitPos(long long num, int k), which returns the k-th digit of the number num or -1 if 
   such position does not exist. It starts counting from left to right and from 1. For example: digitPos(1234, 3) returns 3.
   
8. Write a function with signature void revert(char* text), which converts the given string as a parameter, replacing all 
   lowercase Latin alphabets with uppercase and reverse. Do not use the built-in string library.
   
9. Write a function with signature double sqrt_x(double x, double eps), which calculates a square root of x with an epsilon (eps) 
   precision.
   
10. Write a function which by a given real number x and a non-negative integer n returns x raised to the n-th power. Use Karatsuba
   multiplication method (recursion).

11. Write a function which counts words in char* text. A "word" is defined to be a single or a sequence of characters different from 
   ' ', '\t', '\n'. If the array of characters is empty, the function must return -1.
   
12. Write a program which asks the user for a long long number and then prints:
    - the same number in binary;
    -  the same number in oct;
    -  the same number in hex.

13. Write a program which asks the user for a non-negative integer n and gives the n-th number of Fibonacci.

14. Write a program which asks the user for a non-negative integer n and gives the n-th number of the sequence <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_{n+2}=5a_{n+1}-6a_n+6^n">, with <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_0=0"> <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_1=1">.

15. Write a program which asks the user for the numbers <img src="https://latex.codecogs.com/svg.latex?\Large&space;0\leq"> <img src="https://latex.codecogs.com/svg.latex?\Large&space;m\leq\{n}"><img src="https://latex.codecogs.com/svg.latex?\Large&space;n"> and prints the number of combinations <img src="https://latex.codecogs.com/svg.latex?\Large&space;\binom{n}{k}">. Hints: <img src="https://latex.codecogs.com/svg.latex?\Large&space;\binom{n}{m}=\frac{n!}{m!(n-m)!}=C_{m}^{n}"> , also <img src="https://latex.codecogs.com/svg.latex?\Large&space;C_{n}^{0}=C_{n}^{n}=1"> and <img src="https://latex.codecogs.com/svg.latex?\Large&space;C_{n}^{m}=C_{n-1}^{m}+C_{n-1}^{m-1}">.
