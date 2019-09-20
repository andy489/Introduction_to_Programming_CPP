## Task 1 – Near Cities
You are given information about towns. Each town has a name and a position represented by a point in 2 dimensional Euclidean space (i.e. the “normal” 2D space you are used to). 

Write a program, which, given the names and coordinates of a set of towns, finds the two closest towns (the two towns with the smallest distance between them). 
#### Input 
On the first line of the standard input, there will be the number of towns – **N**<br> 
On each of the next lines, there will be the **name**, the **first coordinate** and the **second coordinate** of a town (i.e. **name x y**), separated by single spaces.<br>
#### Output 
Write a single line containing the names of the two closest towns, separated by a single "**-**" sign. The names should be printed in order of appearance in the input. Also, if there are multiple pairs of towns with the same distance between each other, print the one that appears first in the input. For example, if the input has the towns **Sofia, Burgas, Pernik**, entered in that order, and if the distances between all of them are the same (i.e. they form an equilateral triangle), then the output should be **Sofia-Burgas** (NOT Burgas-Sofia, NOT Sofia-Pernik). 
#### Restrictions 
**1 < N < 100**, The name of each town will be a sequence of English letters (**a-z, A-Z**), no 2 towns will have the same name or same coordinates. <br>
Coordinates will be input as integer numbers (but calculations should be done in floating-point). <br>
The total running time of your program should be no more than **0.1s** <br>
The total memory allowed for use by your program is **5MB** <br>
#### Example Input/Output
Example Input|Expected Output 
---|---
3<br> Sofia 0 0<br>Burgas 350 0 <br>Pernik 0 -5|Sofia-Pernik 
3<br>A -1 -1<br>B -4 -1<br>C -3 -2|B-C 
4<br>A 1 1<br>B 2 1<br>C 2 2<br>D 1 2|A-B 
 
 
