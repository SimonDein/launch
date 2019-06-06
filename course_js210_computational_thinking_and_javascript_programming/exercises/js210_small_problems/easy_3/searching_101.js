// Write a program that solicits six numbers from the user, then logs a message that describes whether or not the sixth number appears amongst the first five numbers.

let readLinesSync = require('readline-sync');

function numberSuffix(number) {
  if (number >= 4) {
    return 'th';
  } else if (number === 3) {
    return 'rd';
  } else if (number === 2) {
    return 'nd';
  } else {
    return 'st';
  }
}

function numberInNumbers() {
  let numbers = [];
  let number;

  for(let i = 1; i <= 5; i += 1) {
    number = Number(readLinesSync.question(`Enter the ${i}${numberSuffix(i)} number: `));
    numbers.push(number);
  }

  let numberToFind = Number(readLinesSync.question('Enter the final number: '));
  let indexOfNumberToFind = numbers.indexOf(numberToFind);
  let resultString = indexOfNumberToFind >= 0 ? 'appears' : 'does not appear';

  console.log(`The number ${numberToFind} ${resultString} in [${numbers.join(', ')}]`);
}

numberInNumbers();

// Enter the 1st number: 25
// Enter the 2nd number: 15
// Enter the 3rd number: 20
// Enter the 4th number: 17
// Enter the 5th number: 23
// Enter the last number: 17

// The number 17 appears in [25, 15, 20, 17, 23].

// -----

// Enter the 1st number: 25
// Enter the 2nd number: 15
// Enter the 3rd number: 20
// Enter the 4th number: 17
// Enter the 5th number: 23
// Enter the last number: 18

// The number 18 does not appear in [25, 15, 20, 17, 23].


