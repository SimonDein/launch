// Write a function that determines and returns the ASCII string value of a string passed in as an argument.
// The ASCII string value is the sum of the ASCII values of every character in the string.
// (You may use String.prototype.charCodeAt() to determine the ASCII value of a character.)

function asciiValue(string) {
  return string.split('').map(char => char.charCodeAt(0)).reduce((total, value) => total + value);
  
}

console.time('someFunction');

console.log(asciiValue('Four score'));         // 984

console.timeEnd('someFunction');

// console.log(asciiValue('Launch School'));      // 1251
// console.log(asciiValue('a'));                  // 97
// console.log(asciiValue(''));                   // 0
