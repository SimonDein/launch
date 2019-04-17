// Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or the product of all numbers between 1 and the entered integer, inclusive.

let rlSync = require('readline-sync');

function computeSum(limit) {
  sum = 0;

  for(let i = 1; i <= limit; i++) {
    sum += i;
  }
  
  return `The sum of the numbers between 1 and ${limit} is ${sum}`;
}

function computeProduct(limit) {
  product = 1;

  for(let i = 1; i <= limit; i++) {
    product *= i;
  }
  
  return `The product of the numbers between 1 and ${limit} is ${product}`;
}

// reassing to question function for brevity
rlSync = rlSync.question;

let limit = parseInt(rlSync('Enter an integer greater than 0 '), 10);

if (limit > 0) {
  let choice = rlSync("Do you want to determine the sum or the product of all numbers between 1 and your entered number?\n\nEnter 'p' for product, 's' for sum ");
  let result;
  
  
  if (choice === 's') {
    result = computeSum(limit);
  } else if (choice === 'p') {
    result = computeProduct(limit);
  } else {
    result = "You didn't choose 's' or 'p'"
  }

  console.log(result)

} else {
  console.log("You didn't enter an integer greater than 0")
}