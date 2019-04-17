// Log all odd numbers from 1 to 99, inclusive, to the console. Log all numbers on separate lines.

for(let i = 1; i <= 99; i += 2) {
  console.log(i);
}

// Repeat this exercise with a technique different from the one that you used, and different from the one provided.
// Also consider adding a way for the user to specify the limits of the odd numbers logged to the console.

let readlineSync = require('readline-sync');

let question = "Starting from 1, what's the highest number you wish to print? ";
let limit = Number(readlineSync.question(question));
let i = 1;

do {
  console.log(i);
  i += 2;
} while (i <= limit);