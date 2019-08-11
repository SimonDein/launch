/*
Problem Description
You are given a list of numbers in a "short-hand" range where only the significant part of the next number is written because we know the numbers are always increasing (ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). Some people use different separators for their ranges (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the same numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.

Your job is to return a list of complete numbers.

The possible separators are: ["-", ":", ".."]

Examples:
"1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21
"1-3, 1-2" --> 1, 2, 3, 11, 12
"1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12
"104-2" --> 104, 105, ... 112
"104-02" --> 104, 105, ... 202
"545, 64:11" --> 545, 564, 565, .. 611



---- PEDAC ---------------
Problem:
  Input
    - string of numbers, delimitors and seperators
      - delimitor: ,
      - ranges: - : and ..

  Output:
    - array of numbers
      - numbers are inserted and procuced from the rules

  Rules:
  "1, 3, 7, 2, 4, 1" --> [1, 3, 7, 12, 14, 21]
  "1-3, 1-2" --> [1, 2, 3, 11, 12]
  "1:5:2" --> [1, 2, 3, 4, 5, 6, ... 12]
  "104-2" --> [104, 105, ... 112]
  "104-02" --> [104, 105, ... 202]
  "545, 64:11" --> [545, 564, 565, .. 611]
  
  - each number higher than the last
    - lastNumber > currentNumber
  - each number has to end with the same digit as it is in the string
    - if currentNumber > previousNumber
      - use number
    - else
      - check digits in the same place as each other
      - if previousNumber digits are < currentNumber digits
        - take the exceeding digits from previousNumber and concat with the currentNumber digits
      - else
        - take the previous Number exceeding digtits, increment them and concat with currentNumber

  - ranges are described by (- : ..)
    - numbers in between should be added according to the rules described above
    - ranges are inclusive

Data Structure:
  array: array.map provides us with iteration and returns a new array we can then return flattened



Algorithm:
  example input: "1-3, 4, 1-4-2" => 1, 2, 3, 4, 11, 12, 13, 14, 15...22
                "1, 2, 3, 4, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2" => 1, 2, 3, 4, 11, 12, 13

  - get notations: input.split(',') => ['1-3', '4', '1-4-2']
  - result = notations.map() => [[1, 2, 3], 4, [11, 12, 13..., 22]]
    - if (notation is number)
      - return getNextNumber((notation)) => 4
    - else
      - range = getRange(notation): => [1, 3] and [1, 4, 2]
      - range.map(getNextNumber(rangeNumber)) => [1, 3] and [11, 14, 22]
      - rangeStart = range[0]
      - rangeEnd = range[range.length - 1]
      - return computeRange(rangeStart, rangeEnd) => [1, 2, 3] and [11, 12, 13...22]

  - return result.flat() => [1, 2, 3, 4, 11, 12, 13..., 22]
*/

let previousNumber = -Infinity;

function isNumber(string) {
  return /^\d+$/.test(string);
}

function nextNumberEndingWithNumber(numberString) {
  let number = Number(numberString);

  if (number > previousNumber) {
    previousNumber = number;
    return number
  }

  let previousNumberString = String(previousNumber);
  let exceedingDigits = previousNumberString.substring(0, previousNumberString.length - numberString.length)

  if (exceedingDigits.length === 0) {
    number = Number('1' + numberString);
  } else if (Number(exceedingDigits + numberString) > previousNumber) {
    number = Number(exceedingDigits + numberString);
  } else {
    let exceedingDigitsIncremented = String(Number(exceedingDigits) + 1)
    number = Number(exceedingDigitsIncremented + numberString);
  }

  previousNumber = number;
  return number
}

function convertShortHandNumbers(shortHand) {
  let notations = shortHand.split(/\,\s+/);
  let range
  let rangeConverted
  let rangeStart
  let rangeEnd
  let numbersInRange
  
  let rangesComputed = notations.map(function (notation) {
    if (isNumber(notation)) {
      return nextNumberEndingWithNumber(notation);
    } else {
      range = notation.match(/\d+/g);
      rangeConverted = range.map((number) => nextNumberEndingWithNumber(number));
      rangeStart = rangeConverted[0]
      rangeEnd = rangeConverted[rangeConverted.length - 1];
      numbersInRange = [];
      
      for(let currentNumber = rangeStart; currentNumber <= rangeEnd; currentNumber += 1) {
        numbersInRange.push(currentNumber)
      }
      
      return numbersInRange;
    }
  });

  // Only working with previousNumber as global object and manual reset out of simplicity for assignment
  previousNumber = -Infinity; 
  return rangesComputed.flat();
}

console.log(convertShortHandNumbers("1, 3, 7, 2, 4, 1")) //--> [1, 3, 7, 12, 14, 21]
console.log(convertShortHandNumbers("1-3, 1-2")) //--> [1, 2, 3, 11, 12]
console.log(convertShortHandNumbers("1:5:2")) //--> [1, 2, 3, 4, 5, 6, ... 12]
console.log(convertShortHandNumbers("104-2")) //--> [104, 105, ... 112]
console.log(convertShortHandNumbers("104-02")) //--> [104, 105, ... 202]
console.log(convertShortHandNumbers("545, 64:11")) //--> [545, 564, 565, .. 611]
console.log(convertShortHandNumbers("1-3, 4, 1-4-2")) //--> [1, 2, 3, 4, 11, 12, 13..., 22]