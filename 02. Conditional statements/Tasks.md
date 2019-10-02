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

Example input | Output | Explanation
------------ | ------------- | -------------
0.88 | 6 | 0.50+0.20+0.10+0.05+0.02+0.01 
1.55 | 3 | 1.00+0.50+0.05
2.63 | 5 | 2.00+0.50+0.10+0.02+0.01

**2.05.** Write a program wchich assigns to the variable k the number of the quadrant in which the point P(x, y) is located.
And checks if point P(x, y) lies in the:

  - unit square with center O(0,0);

  - unit circle with center O(0,5;0,5);


**2.06.** Write a program whick converts a decimal number lying between 1 and 3999 to Roman numerals (string allowed).

Example input | Output
------------ | -------------
44 | XLIV
1111 | MCXI
2018 | MMXVIII

**2.07.** Write a program which asks the user to enter a number up to **3-digits** and then prints its English name (string allowed).

**2.08.** Write a program which asks the user for 5 numbers - a, b, c, p, q and prints the maximum and minimum value of the quadratic function  <img src="https://latex.codecogs.com/svg.latex?\Large&space;f(x)=ax^2+bx+c">  in the range <img src="https://latex.codecogs.com/svg.latex?\Large&space;[p;q]">.

Example input | Output 
------------ | ------------- 
3 2 1 -1 2 | max=17.00<br>min=0.67

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
   
Example input | Output
------------ | -------------
14 | On time
00 | 5 minutes before the start
13 | 
55 |  

Example input | Output
------------ | -------------
16 | Early
00 | 1:00 hours before the start
15 | 
00 |

Example input | Output
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

Example input | Output
------------ | -------------
leap | 45
5 | 
2 | 

Example input | Output
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
   
Example input | Output
------------ | -------------
C8 C7 C6 C5 C4 | straight flush
H11 D11 S11 C11 D7 | four of a kind
D3 C11 S8 H4 S2 | high card
