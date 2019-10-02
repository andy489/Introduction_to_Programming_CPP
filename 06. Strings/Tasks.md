## 6. Strings

**6.01.** Write an implementation of:
- strlen;
- strcmp;
- strcat;
- strcpy.

**6.02.** Write the following program: You are given two strings separated by a new line. Each string will consist of lower case Latin characters ('a'-'z').
- In the first line print two space-separated integers, representing the length of a and b respectively;
- In the second line print the string produced by concatenating a and b;
- In the third line print two strings separated by a space, a' and b'. a' and b' are the same as a and b, respectively, except that their first characters are swapped;

Example input | Output 
------------- | -------------- 
abcd<br>ef  | 4 2<br> abcdef<br> ebcd af

**6.03.** Write a function that checks whether a given word is a palindrome.

Example input | Output 
------------- | -------------- 
civic  | 1
palindrome  | 0
kapak | 1

**6.04.** Write a function with signature void revert(char* text), which converts the given string as a parameter, replacing all 
lowercase Latin alphabets with uppercase and reverse. Do not use the built-in string library.

**6.05.** Write a function which checks whether a string is а substring in another string. If true, the functions must return the index to the first position the substring is located in the string, else return -1.

**6.06.** Write a function which counts words in char* text. A "word" is defined to be a single or a sequence of characters different from ' ', '\t', '\n'. If the array of characters is empty, the function must return -1.

**6.07.** Write a function which takes a string and prints out a char histogram of that string. Each string will consist of lower case Latin characters ('a'-'z').

- Example input: aaaabb
- Output:
  - a - 4
  - b - 2

- Example input: randomness
- Output:
  - r - 1
  - a - 1
  - n - 2
  - d - 1
  - o - 1
  - m - 1
  - e - 1
  - s - 2

NOTE: The order of the output is irrelevant. The only importance is the histogram accuracy.
