// Write a function that returns a string converted to lowercase.

// To convert a single uppercase character to a lowercase character, get its ASCII numeric representation from the ASCII table, add 32 to that number, then convert the number back to a character using the same ASCII table.
// You can use the String.fromCharCode and the String.charCodeAt methods for these operations. For example:

//You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length.
// However, you may not use any other properties or methods from JavaScript's built-in String class.

function isUpperCaseLetter(asciiNumber) {
  return (asciiNumber > 64 && asciiNumber < 91);
}

function toLowerCase(string) {
  const CONVERSION_OFFSET = 32;
  let newString = '';
  let charCode;

  for(i = 0; i < string.length; i++) {
    charCode = string.charCodeAt(i);

    if (isUpperCaseLetter(charCode)) {
      charCode += CONVERSION_OFFSET;
    }

    newString += String.fromCharCode(charCode);
  }

  return newString;
}


console.log(toLowerCase('ALPHABET'));    // "alphabet"
console.log(toLowerCase('123'));         // "123"
console.log(toLowerCase('abcDEF'));      // "abcdef"