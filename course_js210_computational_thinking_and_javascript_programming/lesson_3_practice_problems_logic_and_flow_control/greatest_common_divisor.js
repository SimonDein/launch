// Create a function that computes the Greatest Common Divisor of two positive integers.

// does the job, but ineffective solution
function gcd(num1, num2) {
  let smallestNum = num1 < num2 ? num1 : num2;
  for(let i = smallestNum; i >= 1; i--) {
    if (num1 % i === 0 && num2 % i === 0) {
      return i;
    }
  }
}

// Using euclids algorithm
function gcd(num1, num2) {
  let temp

  while (temp !== 0) {
    temp = num1 % num2
    num1 = num2
    num2 = temp
  }
  
  return num1
}



console.log(gcd(12, 6)); // 6
console.log(gcd(15, 6)); // 3
console.log(gcd(9, 1)); // 1