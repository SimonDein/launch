// Write a function that rotates the last n digits of a number. For the rotation, rotate by one digit to the left, moving the first digit to the end.

/*
Algorithm:
- get digits
- get digits for rotation
- rotate digits
- concat with digits not rotated

*/


function rotateString(string) {
  return string.slice(1) + string[0];
}

function rotateRightmostDigits(number, numberOfDigitsToRotate) {
  let numberString = String(number);
  let rotationIndex = numberString.length - numberOfDigitsToRotate
  let leftPart = numberString.slice(0, rotationIndex);
  let rightPart = numberString.slice(rotationIndex);
  let resultString = leftPart + rotateString(rightPart)

  return Number(resultString);
}


console.log(rotateRightmostDigits(735291, 1));      // 735291
console.log(rotateRightmostDigits(735291, 2));      // 735219
console.log(rotateRightmostDigits(735291, 3));      // 735912
console.log(rotateRightmostDigits(735291, 4));      // 732915
console.log(rotateRightmostDigits(735291, 5));      // 752913
console.log(rotateRightmostDigits(735291, 6));      // 352917