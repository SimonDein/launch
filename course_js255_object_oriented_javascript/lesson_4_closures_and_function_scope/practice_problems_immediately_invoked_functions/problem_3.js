// The code below throws an error:
// What kind of problem does this error highlight? Use an IIFE to address it, so that code runs without error.
/*
var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

function sum(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
}

sum += sum(numbers);  // ?
*/

// This highlights pollutition of the name space. We overwrite sum with a the function sum().

var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

sum += (function sum(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
})(numbers);
console.log(sum);

// Here we sum and add the result to sum via an IIFE. No extra names in the global namespace.
