### SOME HARD INTERVIEW QUESTIONS

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
  
    #include <iostream>
    #include <cmath>
    int main()
    {
	    float a(0), b(0);
	    std::cout << pow(a, b);
	    return 0;
    } 
  Argument your answer.


<details><summary>ANSWER</summary>
<p>
Zero to the power of zero, denoted by <img src="https://latex.codecogs.com/svg.latex?\Large&space;0^0">, is a mathematical expression with no agreed-upon value. But in our case floating point numbers in the memory are represented as approximation because the memory is limited. So we can look for an answer to the equivalent question: <img src="https://latex.codecogs.com/svg.latex?\Large&space;\lim_{x\rightarrow{0}}(x^x)">, which is 1. 
  
</p>
</details>

**03.** What can we say about a number <img src="https://latex.codecogs.com/svg.latex?\Large&space;x"> if <img src="https://latex.codecogs.com/svg.latex?\Large&space;x&(x-1)">.
