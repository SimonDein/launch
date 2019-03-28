var rlSync = require('readline-sync');
let choice = ['Add', 'Subtract', 'Multiply', 'Division'];

//funtions
function add(num1, num2) {
  return (num1 + num2);
}

function subtract(num1, num2) {
  return (num1 - num2);
}

function multiply(num1, num2) {
  return (num1 * num2);
}

function divide(num1, num2) {
  return (num1 / num2);
}

console.log("---------- Calculator ----------")
index = rlSync.keyInSelect(choice, 'What operation do you want to perform?')

console.log(index)

let num1 = Number(rlSync.question("First number: "))
let num2 = Number(rlSync.question("Second number: "))
let result

switch (index) {
  case 0:
    result = add(num1, num2);
    break;
  case 1:
    result = subtract(num1, num2)
    break;
  case 2:
    result = multiply(num1, num2)
    break;
  case 3:
    result = divide(num1, num2)
    break;
}

console.log(`The result is ${result}`);
