// Write a function that takes a positive integer as an argument, and logs all the odd numbers from 1 to the passed in number (inclusive). All numbers should be logged on separate lines.


function logOddNumbers(lastVal) {
  for(let num = 1; num <= lastVal; num++) {
    if (num % 2 === 1) {
      console.log(num)
    }
  }
}

// Example
logOddNumbers(19);

// output on console
1
3
5
7
9
11
13
15
17
19