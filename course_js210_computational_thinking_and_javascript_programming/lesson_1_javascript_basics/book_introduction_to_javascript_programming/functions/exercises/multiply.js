let rlSync = require('readline-sync');

function multiply(a, b) {
  return a * b;
}

function getNumber(prompt) {
  return Number(rlSync.question(prompt));
}

let num1 = getNumber("Enter the first number: ");
let num2 = getNumber("Enter the second number: ");
let result = multiply(num1, num2);

console.log(`${num1} * ${num2} = ${result}`);