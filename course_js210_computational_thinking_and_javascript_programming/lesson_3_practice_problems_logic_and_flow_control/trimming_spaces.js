// Write a function that takes a string as an argument, and returns the string stripped of spaces from both ends. Do not remove or alter internal spaces.

// You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length.
// However, you may not use any other properties or methods from JavaScript's built-in String class.


/*
I opted for a solution that would never pass over more characters than needed.
This solution retrieves the first and last index of the characters in the string,
and generates a new string from the indexes inbetween.
This also ensures I would never trim any extra spaces that was intended to be part of the string.
*/
function trim(string) {
  let trimmedString = ''
  let startIndex
  let endIndex

  for(i = 0;; i++) {
    if (string[i] !== ' ') {
      startIndex = i;
      break;
    }
  }

  for(i = string.length - 1;; i--) {
    if (string[i] !== ' ') {
      endIndex = i;
      break;
    }
  }

  for(; startIndex <= endIndex; startIndex++) {
    trimmedString += string[startIndex]
  }

  return trimmedString;
}

console.log(trim('  abc  '));  // "abc"
console.log(trim('abc   '));   // "abc"
console.log(trim(' ab c'));    // "ab c"
console.log(trim(' a b  c'));  // "a b  c"
console.log(trim('      '));   // ""
console.log(trim(''));         // ""

