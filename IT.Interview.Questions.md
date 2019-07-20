### SOME HARD INTERVIEW QUESTIONS

**01.** Do ***100000 consequtive composite*** numbers exist? If no, argument your answer. Otherwise give an example.      
*(1-2 minutes)*

<details><summary>ANSWER</summary>
<p>
  
From Euclid's algorithm for generating prime numbers, we know that they are infinitely many, which makes us doubt whether such a sequence exists. But the truth is that, no matter how long we choose the wanted sequence to be, we can always find such numbers, while the sequence is finite. That's because in the plurality of the natural numbers <img src="https://latex.codecogs.com/svg.latex?\Large&space;\mathbb{N}"> - the more we move away from the 0, the more the prime numbers “evanish”.
Take the sequence <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_j=\prod_{i=2}^{100001}+j=100001!+j">, for <img src="https://latex.codecogs.com/svg.latex?\Large&space;j=\overline{2,100001}">. Now the numbers <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_2,a_3,a_4,...,a_{100001}"> (with count = 100000) are consecutive and compose, because <img src="https://latex.codecogs.com/svg.latex?\Large&space;a_{k+1}-a_k=1">, for every k in the range <img src="https://latex.codecogs.com/svg.latex?\Large&space;k=\overline{1,100000}"> and <img src="https://latex.codecogs.com/svg.latex?\Large&space;j|a_j"> for every j in the range <img src="https://latex.codecogs.com/svg.latex?\Large&space;k=\overline{2,100001}">.

Note that we cannot tell whether <img src="https://latex.codecogs.com/svg.latex?\Large&space;100000!+1"> is compose!

</p>
</details>
