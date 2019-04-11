// Write a function that takes two arguments:

// a string to be split
// a delimiter character

// You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.

function splitString(string, delimiter = null) {
  if (delimiter === null) {
    console.log("ERROR: no delimter");
  }
  
  let splitString = '';
  
  for (i = 0; i< string.length; i++) {
    if (string[i] === delimiter) {
      console.log(splitString);
      splitString = '';
    } else if(delimiter === '') {
      console.log(string[i])
    } else {
      splitString += string[i];
    }
  }
  if (splitString) console.log(splitString);
}

// The function logs the split strings to the console, as shown below:

// Examples

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// logs:
// ERROR: No delimiter

splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

splitString('hello', ';');
// logs:
// hello

splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello