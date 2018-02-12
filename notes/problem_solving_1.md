# Breaking down a problem - before you start coding

*Notes for the Launch Shool problem solving video guides and tips for tackling problems*



**Steps before coding:**

- Understand the problem

  - Take notes
  - Describe **any possible inputs**, what exactly needs to be **output** and data structeres used.
    - You're done when you have a well defined input / output and you're not in doubt about any details regarding the problem.

  ​

- Set up your examples and test cases

  - Test cases **helps to understand** the problem and **verify** your solution
    - Start with a basic test case
    - Make test cases **based on edge cases**
    - Focus on the input
    - Emptiness? (Nil/null, "", [], {})
    - Ask questions to verify your understanding

  ​

- Data Structes

  - Choose how you want to represent the input
    - String?
      - Do we want to concat, strip reverse etc. ?
      - Regular expressions! split, replace, match...
    - Array?
      - Need to walk through it? (iteration)
      - Need index?
      - Do we want abstractions?
        - map
        - reduce
        - select / filter
        - all?
        - ...
    - Hash?
      - Do i want a look up table / dictionary ?
    - Number?
      - Do we need math operations?
      - Number as a string can have advantages over numbers



- Algorithm
  - Algorithms have to be described in the language of the chose data structure!
    - The reason being that if you already chose a data structure to represent your data - the algorithm for solving the problem is almost going to write itself (example: We represent the input data as an array - then we immediately know which methods and operations we have available operate on the input - like map, reduce etc...)
  - You have to be really fluent with
    - String / Regex
    - Array
      - Ruby: Enumerable
    - Hash
      - Creation (default values)
      - Access (default values)
      - Iteration



> You'll know you're doing things the right way when you find yourself spending more time getting ready to code than you actually spend coding. (That won't be true all the time, but if your preparation is thorough, the code almost writes itself.)
>
> Knowing how to solve computing problems and practicing those techniques will take you a long way.



## Examples of breaking down a problem

#### Requirements are explicit

```md
Consider a character set consisting of letter, a space and a point. Words consists of one or more, but at most 20 letters. An input text consists of one or more words separated from each other by one of more spaces and terminated by 0 or more spaces followed by a point. Input should be read from, including the first letter of the first word, up to and including the terminating point. The ouput text is to be produced such that successive words are separated by a single space with the last word being. terminated by a single point. Odd words are copied in reverse order while even words are merely echoed.

Example input string:
"whats the matter with kansas."

Becomes
"whats eht matter htiw kansas."


---------------- BREAKDOWN ----------------
Understanding the Problem:
-input:
	- 1 - many words
	- separated by: 1 - many spaces
	- terminated by:
		- 0 - many spaces
		- followed by a point
	- chars: letter, space, point, up to 20 letters per word
	- need to handle failure?
	
- output:
	- words: words at odd index reversed
	- words separated by only one space
	- terminated by 0 space and a dot
	
Data Structure:
	- choices: string, array
	- Array, because index is significant
	
Algorithm:
- split string into array of strings with space or point
- map the array of strings to a new array
	- map function: reverse the odd indexed strings
- join the strings back together with a single space delimeter
- apppend a "dot" to the end
```

> Example of breaking down a problem presented with a thorough / explicit description (and maybe only a single example or two).
>
> Usually you don't need to define much more than your input / output



#### Requirements are not so explicit and needs to be modeled


```md
Write a function that take an integer number as input, and prints out a diasmond with the '*' character whose width is the number n

Example:

Given n = 3

 * 
***
 *
 
Given n = 5
  *
 ***
*****
 ***
  *

---------------- BREAKDOWN ----------------
Understand the Problem:
- input: number
	- what happens when the n is 0?
	- What happens when the n is a even number?

- output:
	- returns a string with new line char "\n" delimeters?
	- prints to the screen?

- model the problem:
	- given an odd number n, fx 5
	- output n strings
		- number of '*' per string: 1, 3, 5, 3, 1
		- prepend number of spaces: 2, 1, 0, 1, 2
		
Data Structure:
- number

Algorithm:
- From an odd number, 2a+1
	- generate an array, [1, 3, ..., 2a+1, ...., 3, 1]
	- generate an array, [a, a-1, ..., 1, 0, 1, a]
- loop through the two arrays at the same time
	- for each iteration print out '*' of number and prepend it by y spaces
		- y * " " + x * "*"
```

> Example of breaking down a problem where the requirements are not very specific - here the examples are the main description of what the code should do - not the description. Therefore examples needs to be described in computational words (see "model the problem" above)



####Implicit knowledge needs to be captured

```md
Write a function that takes an integer year as input and returns the century. The return value should be a string that begins with the centure number and ends with st, nd, rd or th as appropriate for that number.

New centuries begin in years that end with 01. So the years 1901-2000 comprise the 20th century.


---------------- BREAKDOWN ----------------
Understanding the Problem:
- input:
	- integer number
	- need to validate?

- output:
	- a string
	- begins with the century number
	- end with st, nd, rd or th

- rules:
	- new centuries begin in years that end with 01
	- century string number into a string:
		- 1: st
		- 2: nd
		- 3: rd
		- 4-20: th
		- 21: st
		- 22: nd
		- 23: rd
		- 24 - 30: th
		...
		- generalize:
			- century % 10
				- 1, 2, 3: st, nd, trd
				- 0, 4-9: th
				- except for 11, 12, 13

Data Structure:
- input:
	-number

Algorithm:
- century number = (year - 1) % 100
- century string = century number to string, the "apply suffix rules"
```

> Example of breaking down a problem containing implicit information (You should know the definition of a century to be able to solve this problem)
>
> Here we define the input / output but ALSO the rules that applies to how to define a century as that is not provided (implicit to the description of the problem)



```md
Write a program, given a word, computes the scrabble score for that word.

Letter values:
Letter							value
A, E, I, O, U, L, N, R, S, T		1
D, G								2
B, C, M, P							3
F, H, V, W, Y						4
K									5
J, X								8
Q, Z								10

---------------- BREAKDOWN ----------------
Understanding the Problem:
- Input: String
	- lower case / upper case?
	
- Output: an integer (the scrabble score)

- Rules:
	- the score is the sum of the points each letter in the word are worth
	- the letter value table is used to look up letter score


Data Structure:
- Input
	- array of chars

- Rules
	- look up table: hash/object
	
Algorithm:
- split the input into array of chars
- map to lower cased chars
- map each char into its scrabble score referincing the look up table
- reduce array summing up the values, Array#reduce(:+)
```



### Summary

- Understand the problem
  - Input
  - Output
  - Implicit knowledge?
    - Definitions / concepts / facts you need to know to be able to solve the problem
- Test cases
  - Edge cases
- Choose data structures
  - What data structure do you want your input to be
    - Think about the advantages / disadvantages of a data structure relating to solving your problem
  - Any extra data structures - look up tables, constants etc.
- Algorithm
  - Be specific - this is what your code is going to be written from



#### Source

- https://launchschool.com/gists/c013accd - 2 part videos on general approach for solving small interview style code challenges
- https://launchschool.com/gists/2a3a3d72 - General list of tips for solving exercises