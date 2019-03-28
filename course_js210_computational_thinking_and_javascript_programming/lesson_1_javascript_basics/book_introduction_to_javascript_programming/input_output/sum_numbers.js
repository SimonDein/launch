var readlineSync = require('readline-sync')

console.log("Sum 2 numbers");
let num1 = Number(readlineSync.question("First number: "));
let num2 = Number(readlineSync.question("Second number: "));

let sum = num1 + num2;
console.log(`Sum: ${sum}`);