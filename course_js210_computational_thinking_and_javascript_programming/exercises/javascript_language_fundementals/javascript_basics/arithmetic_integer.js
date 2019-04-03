/*
In this program we're going to explore the basic arithmetic operations in JavaScript. The program below prompts the user for two positive integers, then logs the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. For this exercise, assume positive integers as inputs.

Here are our expected results after running the program:

Enter the first number: 23
Enter the second number: 17

23 + 17 = 40
23 - 17 = 6
23 * 17 = 391
23 / 17 = 1
23 % 17 = 6
23 ** 17 = 1.4105003956066297e+23


Here is the code for the program:
*/

var number1 = prompt('Enter the first number:');
var number2 = prompt('Enter the second number:');

console.log(number1 + ' + ' + number2 + ' = ' + (number1 + number2));
console.log(number1 + ' - ' + number2 + ' = ' + (number1 - number2));
console.log(number1 + ' * ' + number2 + ' = ' + (number1 * number2));
console.log(number1 + ' / ' + number2 + ' = ' + Math.floor(number1 / number2));
console.log(number1 + ' % ' + number2 + ' = ' + (number1 % number2));
console.log(number1 + ' ** ' + number2 + ' = ' + Math.pow(number1, number2));

// Did the results of the program match what we expected?
// Why or why not? If not, can you fix it?

/* Answer ---------
No it don't.
All returned inputs will be strings.
That means that if we don't explictly coerce the recieved input strings into numbers,
Javascript will intpret and coerce, the inputs as well as the operation to take place, itself.

In the first (addition) operation; string concatenation will take place - and a string will be returned.
But in all the following operations, the two arguments will be coerced into numbers and the
"expected" arithmetic operation will take place - returning a number.

However if we coerce the input into integers, we can then expect the correct operations to take place:
*/
var number1 = parseInt(prompt('Enter the first number:'), 10);
var number2 = parseInt(prompt('Enter the second number:'), 10);

console.log(number1 + ' + ' + number2 + ' = ' + (number1 + number2));
console.log(number1 + ' - ' + number2 + ' = ' + (number1 - number2));
console.log(number1 + ' * ' + number2 + ' = ' + (number1 * number2));
console.log(number1 + ' / ' + number2 + ' = ' + Math.floor(number1 / number2));
console.log(number1 + ' % ' + number2 + ' = ' + (number1 % number2));
console.log(number1 + ' ** ' + number2 + ' = ' + Math.pow(number1, number2));