// Write a function that takes a number argument, and returns true if the number is prime, or false if it is not.
// You may assume that the input is always a non-negative integer.

function isPrime(number) {
  // A prime can only be a natural number greater than 1
  if (number <= 1) return false;
  
  for(let i = 2; i <= number / 2; i++) {
    if (number % i === 0) return false;
  }
  
  return true
}

// Example
console.log(isPrime(1));   // false
console.log(isPrime(2));   // true
console.log(isPrime(3));   // true
console.log(isPrime(43));  // true
console.log(isPrime(55));  // false
console.log(isPrime(0));   // false

