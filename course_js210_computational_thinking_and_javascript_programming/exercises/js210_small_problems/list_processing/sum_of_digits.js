// Write a function that takes one argument, a positive integer, and returns the sum of its digits. Do this using list processing techniques.

function sumDigits(digits) {
  return String(digits).split('').reduce((sum, digit) => sum + Number(digit), 0);
}

sumDigits(23);           // 5
sumDigits(496);          // 19
sumDigits(123456789);    // 45