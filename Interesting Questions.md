### Interesting questions

**01.** Do ***100000 consequtive composite*** numbers exist? If “no”, argument your answer. Otherwise give an example.      
*(1-2 minutes)*

<details><summary>ANSWER</summary>
<p>
  
From Euclid's algorithm for generating prime numbers, we know that they are infinitely many, which makes us doubt whether such a sequence exists. But the truth is that, no matter how long we choose the wanted sequence to be, we can always find such numbers, while the sequence is finite. That's because in the plurality of the natural numbers <img src="https://latex.codecogs.com/svg.latex?\Large&space;\mathbb{N}"> - the more we move away from the 0, the more the prime numbers “evanish”.
Take the sequence <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_j=\prod_{i=2}^{100001}+j=100001!+j">, for <img src="https://latex.codecogs.com/svg.latex?\Large&space;j=\overline{2,100001}">. Now the numbers <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_2,a_3,a_4,...,a_{100001}"> (with count = 100000) are consecutive and compose, because <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_{k+1}-a_k=1">, for every k in the range <img src="https://latex.codecogs.com/svg.latex?\Large&space;k=\overline{1,100000}"> and <img src="https://latex.codecogs.com/svg.latex?\Large&space;j|a_j"> for every j in the range <img src="https://latex.codecogs.com/svg.latex?\Large&space;k=\overline{2,100001}">.

Note that we cannot tell whether <img src="https://latex.codecogs.com/svg.latex?\Large&space;100000!+1"> is compose!

</p>
</details>


**02.** What will be displayed on the console after executing the following code:
```cpp
#include <iostream>
#include <cmath>
int main()
{
	float a(0), b(0);
	std::cout << pow(a, b);
	return 0;
} 
```
 Argument your answer.


<details><summary>ANSWER</summary>
<p>
Zero to the power of zero, denoted by <img src="https://latex.codecogs.com/svg.latex?\Large&space;0^0">, is a mathematical expression with no agreed-upon value. But in our case floating point numbers in the memory are represented as approximation because the memory is limited. So we can look for an answer to the equivalent question: <img src="https://latex.codecogs.com/svg.latex?\Large&space;\lim_{x\rightarrow{0}}(x^x)">, which is 1. 
  
</p>
</details>

**03.** What can we say about a number x if the expression x&(x-1) is true.

<details><summary>ANSWER</summary>
<p>

We have the operator "&", which is bitwise "AND". Knowing that a binary power of two is of the form 100...000 and subtracting one will give you 111...111. Then, when you AND those together, you get zero, such as with:
 
	  1000 0000 0000 0000
	&  111 1111 1111 1111
	  ==== ==== ==== ====
	= 0000 0000 0000 0000

Any non-power-of-two input value (other than zero) will not give you zero when you perform that operation.

For example, let's try all the 4-bit combinations:

n  |    n |   n-1 |  n&(n-1)
---- |  ----  |  ----  | ----
 0  | 0000 |  0111  |  0000 *
 1 |  0001 |  0000  |  0000 *
 2 |  0010 |  0001  |  0000 *
 3 |  0011 |  0010  |  0010
 4 |  0100 |  0011  |  0000 *
 5 |  0101 |  0100  |  0100
 6 |  0110 |  0101  |  0100
 7 |  0111 |  0110  |  0110
 8 |  1000 |  0111  |  0000 *
 9 |  1001 |  1000  |  1000
10 |  1010 |  1001  |  1000
11 |  1011 |  1010  |  1010
12 |  1100 |  1011  |  1000
13 |  1101 |  1100  |  1100
14 |  1110 |  1101  |  1100
15 |  1111 |  1110   | 1110

You can see that only 0 and the powers of two (1, 2, 4 and 8) result in a 0000/false bit pattern, all others are non-zero or true.  

***So the answer is that n is neither power of two nor zero.***

</p>
</details>

**04.** What will be displayed on the console after executing the following code:
```cpp
#include <iostream> 
int main()
{
	(052 == 0x2a) ? std::cout << "true" : std::cout << "false";
	return 0;
}
```
Explain why.
<details><summary>ANSWER</summary>
<p>
	
*true*

052 is considered from the compilator as octal numeral system, i.e. the base-8 number system, which uses the digits 0 to 7. On the other hand 0x2a or equivalently 0x2A is considered from the compilator as hexadecimal (also base 16, or hex) system to represent numbers with sixteen digits. So 

<img src="https://latex.codecogs.com/svg.latex?\Large&space;052=8.0^2+8.5^1+8.2^0=48"> and 
<img src="https://latex.codecogs.com/svg.latex?\Large&space;0x2a=0x2A=16.2^1+16.10^0=48">,

i.e. is 48 equal to 48 ?

</p>
</details>

**05.** How does the garbage collector in othen (modern) than C++ program languages work?
<details><summary>ANSWER</summary>
<p>
For example it can be considered as a graph of all objects initialized in a given scope. It searches with DFS for all objects which are not referented from another object (which are not connectet to none of the other objects) and after that perform deletion. In that logic it also deletes all non-used connectivity components.	
</p>
</details>
