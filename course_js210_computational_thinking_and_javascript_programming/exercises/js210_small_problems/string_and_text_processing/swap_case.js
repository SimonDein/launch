// Write a function that takes a string as an argument, and returns that string with every lowercase letter changed to uppercase and every uppercase letter changed to lowercase. Leave all other characters unchanged.

function swapCase(string) {
  return string.split('').map(function (letter) {
    if (/[a-z]/.test(letter)) {
      return letter.toUpperCase();
    } else if (/[A-Z]/.test(letter)) {
      return letter.toLowerCase();
    } else return letter;
  }).join('');
}

console.log(swapCase('CamelCase'));              // "cAMELcASE"
console.log(swapCase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"
