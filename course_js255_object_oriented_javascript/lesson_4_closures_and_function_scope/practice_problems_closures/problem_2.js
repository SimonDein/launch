// Write a program that uses two functions, add and subtract, to manipulate a running total value. When you invoke either function with a number, it should add or subtract that number from the running total and log the new total to the console. Usage looks like this:

let currentVal = 0;

function add(number) {
  currentVal += number;
  console.log(currentVal);
}

function subtract(number) {
  currentVal -= number;
  console.log(currentVal);
}

add(1);
// 1
add(42);
// 43
subtract(39);
// 4
add(6);
// 10