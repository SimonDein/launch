/*
write a function that can add a check digit to make an invalid number per the Luhn Formala, into a valid one.
Return the original number + the extra check digit '2323 2005 7766 355' => '2323 2005 7766 3554'

Input: string numbers
Output: valid string of numbers according to the Luhn Formula

Algorithm:
  - if valid number
    - return as is
  - else
    - add zero to the end
    - checkDigit = checksum(number)
  
    return number + String(checkDigit)
*/

function checkSumLuhnsFormula(numbers) {
  return numbers.reverse().reduce(function (sum, digit, index) {
    if (index % 2 === 1) {
      digit *= 2;
      if (digit >= 10) {
        digit -= 9;
      }
    }
    return sum + digit;
  }, 0);
}

function getDigits(string) {
  return string.match(/\d/g).map((digit) => Number(digit));
}

function validLuhnsFormulaNumber(numberString) {
  let digits = getDigits(numberString);
  let checkSum = checkSumLuhnsFormula(digits);
  
  return checkSum % 10 === 0;
}

function getCheckDigit(digits) {
  digitsPadded = digits.concat([0]);
  return 10 - (checkSumLuhnsFormula(digitsPadded) % 10);
}

function addCheckDigit(numberString) {
  if (validLuhnsFormulaNumber(numberString)) return numberString
  
  let digits = getDigits(numberString);
  let checkDigit = getCheckDigit(digits)

  return numberString + checkDigit;
}

// tests
console.log(addCheckDigit("8763")) //=> "8763"
console.log(addCheckDigit("2323 2005 7766 3554")) //=> "2323 2005 7766 3554"

console.log(addCheckDigit('2323 2005 7766 355')) //=> "2323 2005 7766 3554"