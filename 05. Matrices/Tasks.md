## 5. Matrices

**5.01.** We say that in the elements of the matrix <img src="https://latex.codecogs.com/svg.latex?A_{nXm}"> there is a local minimum (<img src="https://latex.codecogs.com/svg.latex?a_{ij}">) for <img src="https://latex.codecogs.com/svg.latex?A">, if the elements that stay on it's left, right, up and down position are bigger than it. Write a program that finds and outputs all the elements of the matrix <img src="https://latex.codecogs.com/svg.latex?A"> for which <img src="https://latex.codecogs.com/svg.latex?A"> has a local minimum.

**5.02.** Write a program which checks and prints the numbers of those rows of a matrix containing at least one negative element.

**5.03.** Write a program which:

 a) inputs the elements of a square real matrix <img src="https://latex.codecogs.com/svg.latex?A"> with size <img src="https://latex.codecogs.com/svg.latex?NxN"> by rows ;
 
 b) from the matrix <img src="https://latex.codecogs.com/svg.latex?A"> constructs a vector <img src="https://latex.codecogs.com/svg.latex?\vec{B}=(b_1,b_2,...,b_m)">, where <img src="https://latex.codecogs.com/svg.latex?m=N^2"> and the first <img src="https://latex.codecogs.com/svg.latex?N"> elements of <img src="https://latex.codecogs.com/svg.latex?\vec{B}"> coincide with the first column of <img src="https://latex.codecogs.com/svg.latex?A">, the second <img src="https://latex.codecogs.com/svg.latex?N"> elements of <img src="https://latex.codecogs.com/svg.latex?B"> with the second column of <img src="https://latex.codecogs.com/svg.latex?A"> and etc., the last <img src="https://latex.codecogs.com/svg.latex?N"> elements of <img src="https://latex.codecogs.com/svg.latex?B"> coincide with the last column of <img src="https://latex.codecogs.com/svg.latex?A">;

 c) sorts in ascending order the elements of <img src="https://latex.codecogs.com/svg.latex?\vec{B}">;
 
 d) constructs a new square matrix <img src="https://latex.codecogs.com/svg.latex?C"> with size <img src="https://latex.codecogs.com/svg.latex?NxN">, where the elements from the first row coinside with the first <img src="https://latex.codecogs.com/svg.latex?N"> elements of <img src="https://latex.codecogs.com/svg.latex?\vec{B}">, the elements from the second row coinside with the second <img src="https://latex.codecogs.com/svg.latex?N"> elements of <img src="https://latex.codecogs.com/svg.latex?\vec{B}">, etc., the elements from the last row coinside with the last <img src="https://latex.codecogs.com/svg.latex?N"> elements of <img src="https://latex.codecogs.com/svg.latex?\vec{B}">;
 
  e) prints matrix <img src="https://latex.codecogs.com/svg.latex?C"> by rows.
  
**5.04.** Let A be a n-th order square matrix. Write a program which finds:
  
  a) the sum of the elements over the main diagonal;
  
  b) the product of the elements under the main diagonal;
  
  c) the sum of the positive elements from the main diagonal;
  
  d) the product of the elements from the secondary diagonal;
  
  e) the sum of the elements outside the secondary diagonal.
  
**5.05.** Write a program which erases the k-th column of the matrix <img src="https://latex.codecogs.com/svg.latex?A_{nXm}">. Deleting means moving the columns with one to the left and reducing the number of columns by one.

**5.06.** Write a program which finds the sum of the squares of those elements in a real square matrix of order n, which are special. A special element is element for which the following inequality is true: <img src="https://latex.codecogs.com/svg.latex?a[i,j]\geq\frac{a[i-1,j]+a[i,j-1]+a[i,j+1]+a[i+1,j]}{4}">.

**5.07.** It is given the set <img src="https://latex.codecogs.com/svg.latex?M"> of pairs:  <img src="https://latex.codecogs.com/svg.latex?M=\{(x_1,y_1),(x_2,y_2),...,(x_n,y_n)\}">, where <img src="https://latex.codecogs.com/svg.latex?x_i"> and <img src="https://latex.codecogs.com/svg.latex?y_i">, <img src="https://latex.codecogs.com/svg.latex?i=1,...,n"> are integer numbers. Write a program which checks whether the set M defines a function. Hint: The set M defines a function whenever for every <img src="https://latex.codecogs.com/svg.latex?x_i=x_j"> is satisfied <img src="https://latex.codecogs.com/svg.latex?y_i=y_j">.

**5.08.** Let <img src="https://latex.codecogs.com/svg.latex?Y=A,B,C"> be three matrices and <img src="https://latex.codecogs.com/svg.latex?X,Y"> be two vectors. Write a program which finds:

a) <img src="https://latex.codecogs.com/svg.latex?C=A+B">;

b) <img src="https://latex.codecogs.com/svg.latex?Y=A.X">;

c) <img src="https://latex.codecogs.com/svg.latex?C=A.B">;

d) <img src="https://latex.codecogs.com/svg.latex?A=A^T">, where <img src="https://latex.codecogs.com/svg.latex?A^T"> is the transposed matrix of <img src="https://latex.codecogs.com/svg.latex?A">.

**5.09.** Write a program which finds the maximum number, which occurs int a given <img src="https://latex.codecogs.com/svg.latex?n-th"> order matrix <img src="https://latex.codecogs.com/svg.latex?A"> more than once.

**5.10.** We say that two columns of a matrix are *alike* if the sets of numbers that make up the collumns are equal. Write a program that finds the numbers of all the columns of matrix <img src="https://latex.codecogs.com/svg.latex?A"> with size <img src="https://latex.codecogs.com/svg.latex?N">x<img src="https://latex.codecogs.com/svg.latex?N"> that are *alike*.

**5.11.** A matrix <img src="https://latex.codecogs.com/svg.latex?A"> has a saddle point in <img src="https://latex.codecogs.com/svg.latex?a_{ij}"> if <img src="https://latex.codecogs.com/svg.latex?a_{ij}"> is a minimum element in the <img src="https://latex.codecogs.com/svg.latex?i">-th row and a maximum element in the <img src="https://latex.codecogs.com/svg.latex?j">-th column of <img src="https://latex.codecogs.com/svg.latex?A">. Write a program that *determines if a saddle point exists* in a given matrix <img src="https://latex.codecogs.com/svg.latex?A">.

**5.12.** A matrix <img src="https://latex.codecogs.com/svg.latex?A"> has a saddle point in <img src="https://latex.codecogs.com/svg.latex?a_{ij}"> if <img src="https://latex.codecogs.com/svg.latex?a_{ij}"> is a minimum element in the <img src="https://latex.codecogs.com/svg.latex?i">-th row and a maximum element in the <img src="https://latex.codecogs.com/svg.latex?j">-th column of <img src="https://latex.codecogs.com/svg.latex?A">. Write a program that *finds all saddle points* in a given matrix <img src="https://latex.codecogs.com/svg.latex?A">.

**5.13.** A square matrix <img src="https://latex.codecogs.com/svg.latex?A"> of <img src="https://latex.codecogs.com/svg.latex?N">-th order is given. Write a program, which determines if there exist a number <img src="https://latex.codecogs.com/svg.latex?k">, such that the <img src="https://latex.codecogs.com/svg.latex?k">-th column matches the <img src="https://latex.codecogs.com/svg.latex?k">-th row of the matrix <img src="https://latex.codecogs.com/svg.latex?A">.

**5.14.** It is given a sequence of real numbers <img src="https://latex.codecogs.com/svg.latex?a_1,a_2,a_3,...,a_n">. Write a program, which constructs and prints on the console the square matrix:

<img src="https://latex.codecogs.com/svg.latex?A'=\begin{pmatrix}a_1&a_2&a_3&...&a_{n-2}&a_{n-1}&a_n\\a_2&-a_3&a_4&...&a_{n-1}&a_n&a_1\\a_3&a_4&a_5&...&a_n&a_1&a_2\\...\\a_{n-2}&a_{n-1}&a_n&...&a_{n-5}&a_{n-4}&a_{n-3}\\a_{n-1}&a_n&a_1&...&a_{n-4}&a_{n-3}&a_{n-2}\\a_{n}&a_1&a_2&...&a_{n-3}&a_{n-2}&a_{n-1}\end{pmatrix}">

**5.15.** Given a real square matrix <img src="https://latex.codecogs.com/svg.latex?A"> of order <img src="https://latex.codecogs.com/svg.latex?N">. Write a program which finds:

 <img src="https://latex.codecogs.com/svg.latex?a)\underset{1\le{i}\le{n}}{\mathrm{\max}}\{\underset{1\le{j}\le{n}}{\mathrm{\min{a_{ij}}}}\}">;  <img src="https://latex.codecogs.com/svg.latex?b)\underset{1\le{j}\le{n}}{\mathrm{\max}}\{\underset{1\le{i}\le{n}}{\mathrm{\min{a_{ij}}}}\}">; <img src="https://latex.codecogs.com/svg.latex?c)\underset{1\le{i}\le{n}}{\mathrm{\min}}\{\underset{1\le{j}\le{n}}{\mathrm{\max{a_{ij}}}}\}">;  <img src="https://latex.codecogs.com/svg.latex?d)\underset{1\le{j}\le{n}}{\mathrm{\max}}\{\underset{1\le{i}\le{n}}{\mathrm{\min{a_{ij}}}}\}">.

**5.16.** It's given a real square matrix <img src="https://latex.codecogs.com/svg.latex?A">, <img src="https://latex.codecogs.com/svg.latex?N">x<img src="https://latex.codecogs.com/svg.latex?N">, where <img src="https://latex.codecogs.com/svg.latex?2\le{N}\le{10}">. Write a program which checks if <img src="https://latex.codecogs.com/svg.latex?A"> is *ortonormal*, where we define a matrix to be *ortonormal* if the *scalar product* of any two different rows of <img src="https://latex.codecogs.com/svg.latex?A"> is equal to 0 and the *scalar product* of any row with itself is equal to 1.

**5.17.** Write a program which determines whether the square matrix <img src="https://latex.codecogs.com/svg.latex?A"> is a *magic square*, i.e. such that the sum of the elements of all rows and columns is the same.

**5.18.** Write a program which asks the user for a natural number <img src="https://latex.codecogs.com/svg.latex?n"> and ***generates*** (also prints) eight <img src="https://latex.codecogs.com/svg.latex?nXn"> matrices in the pattern of the given example:
- for <img src="https://latex.codecogs.com/svg.latex?n=4"> (note how all the numbers are aligned!):

  - a) 
  ````
       0 0 0 0
       0 1 0 0
       0 0 2 0
       0 0 0 3
  ````
  - b)  
  ````
       1  2  3  4        
       5  6  7  8        
       9 10 11 12        
      13 14 15 16
  ````   
  - c) 
  ````
       1 5  9 13
       2 6 10 14
       3 7 11 15
       4 8 12 16
  ````
  - d) 
  ````
       1 2 3 4
       0 1 2 3
       0 0 1 2
       0 0 0 1
  ````
  - e) 
  ````
       1 8  9 16
       2 7 10 15
       3 6 11 14
       4 5 12 13
  ````
  - f)    
  ````     
       1  3  6 10
       2  5  9 13
       4  8 12 15
       7 11 14 16
  ````
  - g) 
  ````
       7 11 14 16
       4  8 12 15
       2  5  9 13
       1  3  6 10
  ````
  - h) 
  ````
       1  2  3  4
       12 13 14 5
       11 16 15 6
       10 9  8  7
   ````
**5.19.** Game of Life (***Conway's Game of Life***) is a game for zero :disappointed: players and consists of a surface, devided in cells. Every cell is dead or alive. The game is played in turns. Every turn depends on the state of the game in the previous turn following these rules:

  - Every cell with less than two living neighbours dies (of loneliness);
  - Every living cell with more than three living neighbours dies (too crowded);
  - Every living cell with two or three living neighbours stays alive for the next turn;
  - Every dead cell with exactly three living neighbours comes back to live.

Your task is to simulate this game. The initial state of the surface should be hard-coded. On every turn the state of the cells should be written to the console: 'X' for a living cell, '.' for a dead cell.

- [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life "Markdown Tutorial")

- [Simulation](https://bitstorm.org/gameoflife/ "Markdown Tutorial")

- *Some configurations:*

![alt text](https://github.com/andy489/Data_Structures_and_Algorithms_CPP/blob/master/assets/Conway's%20Game%20of%20Life%2001.gif)

**5.20.** You are given numbers <img src="https://latex.codecogs.com/svg.latex?n,m"> and a <img src="https://latex.codecogs.com/svg.latex?nXm"> matrix that consists of numbers 0 through 9. Your task is to create a program that says ***how many*** islands and peninsulas are there. These are the ***rules***:
- 0 is water;
- 1-9 is the height of the ground;
- Islands are pieces of land connected by different grounds. Example of an island:
````
00000000000000000
00000000110000000
00000001211000000
00000012321100000
00000123432110000
00000012332211000
00000001211000000
00000000100000000
00000000000000000
````
- Peninsulas are like islands but on the edge of the ***map***. Example of a peninsula:
````

98620000000000
76542110000000
84321000000000
52321100000000
32100000000000
21000000000000
10000000000000
````
- Note that we don't actually care if the land is an island or peninsula. We care about the number of different connected lands.

Example input:
````
10 5

4321000131
3210010010
2100121000
2100010000
1000000001
````
Output should be: 4.

**5.21.** We are given the coefficients <img src="https://latex.codecogs.com/svg.latex?a_{ij}(1\le{i}\le{n},1\le{j}\le{n})"> and
<img src="https://latex.codecogs.com/svg.latex?b_i(i=1,...,n)">. Write a program which solves the system of linear equations:
          
<img src="https://latex.codecogs.com/svg.latex?\begin{cases}a_{11}x_1+a_{12}x_2+a_{13}x_3+...+a_{1n}x_n=b_1\\a_{21}x_1+a_{22}x_2+a_{23}x_3+...+a_{2n}x_n=b_2\\a_{31}x_1+a_{32}x_2+a_{33}x_3+...+a_{3n}x_n=b_3\\...\\a_{n1}x_1+a_{n2}x_2+a_{n3}x_3+...+a_{nn}x_n=b_n\end{cases}">
