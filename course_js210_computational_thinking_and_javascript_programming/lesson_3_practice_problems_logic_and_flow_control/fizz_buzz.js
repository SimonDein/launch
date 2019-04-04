// Write a function that iterates over the integers from 1 to 100, inclusive
// For multiples of three, log "Fizz" to the console
// For multiples of five, log "Buzz"
// For numbers which are multiples of both three and five, log "FizzBuzz"
// For all other numbers, log the number.

function fizzbuzz() {
  for(let i = 1; i <= 100; i++) {
    let fizzBuzz = ''

    if (i % 3 === 0) fizzBuzz += 'Fizz';
    if (i % 5 === 0) fizzBuzz += 'Buzz';

    console.log(fizzBuzz || i);
  }
} 

fizzbuzz();

// console output
// 1
// 2
// Fizz
// 4
// Buzz
// Fizz
// 7
// 8
// Fizz
// Buzz
// 11
// Fizz
// 13
// 14
// FizzBuzz
// 16
// 17
// Fizz
// ...