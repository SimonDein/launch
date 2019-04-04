// We now need a function that calculates the sum of the same three values.
// Create a function named sum that takes the same three arguments as average, and returns the sum of the three arguments.
// Now modify average to call the sum function with those three arguments and use the return value to calculate the average

function sum(num1, num2, num3) {
  return (num1 + num2 + num3);
}

function average(num1, num2, num3) {
  return (sum(num1, num2, num3) / 3);
}

console.log(average(4, 7, 33));