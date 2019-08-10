// Problem Description
// The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers Canadian Social Insurance Numbers.

// The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:

// Counting from the rightmost digit and moving left, double the value of every second digit
// For any digit that thus become 10 or more, subtract 9 from the reuslt
// 1111 becomes 2121
// 8763 becomes 7733 (from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)
// Add all these digits together
// 1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
// 8763 becomes 7733, and 7 + 7 + 3 + 3 is 20
// If the total (the checksum) ends in 0 (put another way, if the total modulus 10 is congruent to 0),
// then the number is valid according to the Luhn Formula; else it is not valid. So, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

// Write a program that, given a number in string format, check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid. You can ignore all non-numeric characters in the input string.

/*
Understand the Problem:
  Input: string of digits and any other characters. Non-digits should be ignored
  Output: boolean describing whether the credit card number is valid according to the rules.

  Rules:
    - All non digits should be ignored
    - Started from rightmost digit
      - every second digit is doubled
        - if the result is < 10 subtract 9 from the result

    - sum the digits and if sum % 10 === 0 it's valid: else false

Examples / test cases:
  validLuhnsFormulaNumber("2323 2005 7766 3554") => true
  validLuhnsFormulaNumber("  2323 2005 7766 3554  ") => true
  validLuhnsFormulaNumber("1111") => false
  validLuhnsFormulaNumber("8763") => true

  validLuhnsFormulaNumber("") => undefined;

Data Structure:
  array will give us reduce and map; if we need it

Algorithm:
  - Get digits
    - string.match
  - Calculate checksum
    - reduceRight
      - if index % 2 === 1
        - currentValue += currentValue
        - if currenValue >= 10
          - currentValue -= 9;
      - sum += currentValue
  
  - return checksum % 10 === 0;
*/

function validLuhnsFormulaNumber(numberString) {
  let digitsFound = numberString.match(/\d/g);
  if (digitsFound === null) return false

  let digits = digitsFound.map((digit) => Number(digit));
  let checkSum = digits.reverse().reduce(function (sum, digit, index) {
    if (index % 2 === 1) {
      digit *= 2;
      if (digit >= 10) {
        digit -= 9;
      }
    }
    return sum + digit;
  }, 0);

  return checkSum % 10 === 0;
}


// Examples / test cases:
console.log(validLuhnsFormulaNumber("8763")) //=> true
console.log(validLuhnsFormulaNumber("2323 2005 7766 3554")) //=> true
console.log(validLuhnsFormulaNumber("  2323 2005 7766 3554  ")) //=> true
console.log(validLuhnsFormulaNumber('2')) // => false
console.log(validLuhnsFormulaNumber("1111")) //=> false
console.log(validLuhnsFormulaNumber("18763")) //=> false
console.log(validLuhnsFormulaNumber("")) //=> false;