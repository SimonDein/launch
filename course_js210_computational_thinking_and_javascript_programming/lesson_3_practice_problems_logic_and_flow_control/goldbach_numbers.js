// Write a function named checkGoldbach() that uses Goldbach's Conjecture to log every pair of primes that sum to the number supplied as an argument
// The conjecture states that "you can express every even integer greater than 2 as the sum of two primes"
// The function takes as its only parameter, an integer n, and logs all combinations of two prime numbers whose sum is n
// Log the prime pairs with the smaller number first. If n is odd or less than 4, your function should log null.

function isPrime(number) {
  // A prime can only be a natural number greater than 1
  if (number <= 1) return false;
  
  for(let i = 2; i <= number / 2; i++) {
    if (number % i === 0) return false;
  }
  
  return true
}

function checkGoldbach(num) {
  if (num % 2 === 1 || num <= 3) {
    console.log('null');
    return;
  } else if (num === 4) {
    console.log('2 2');
    return;
  }
  
  let primes = [];
  let start = 3;
  let end = (num - 1);

  while (start <= end) {
    // if (isPrime(start) && isPrime(end)) {
    //   if (start + end === num ) {
    //     primes.push([start, end]);
    //   }

    //   start += 2;
    //   end += -2;

    // } else if (!isPrime(start)) {
    //   start += 2

    // } else if (!isPrime(end)) {
    //   end -= 2
      
    // }
    while (start + end > num) {
      if ((isPrime(start) && isPrime(end)) && start + end === num) {
        primes.push([start, end]);
      }
      
      end -= 2
    }

    start += 2
  }

  console.log(primes);
}

// simple tests ----
checkGoldbach(3);
// logs: null

checkGoldbach(4);
// logs: 2 2

checkGoldbach(12);
// logs: 5 7

checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53