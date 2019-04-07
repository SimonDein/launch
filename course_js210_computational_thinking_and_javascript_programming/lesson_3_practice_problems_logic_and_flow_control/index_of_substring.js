// Write two functions that each take two strings as arguments. Their expected behaviors are as follows:

// The indexOf() function searches for the first instance of a substring in firstString that matches the string secondString, and returns the index of the character where that substring begins.

// The lastIndexOf() function searches for the last instance of a substring in firstString that matches the string secondString, and returns the index of the character where that substring begins.

// Both functions return -1 if firstString does not contain the substring specified by secondString.

// You may use the square brackets ([]) to access a character by index (as shown below), and the length property to find the string length. However, you may not use any other properties or methods from JavaScript's built-in String class.


// Find match of pattern, return index immediately if we find one.
function indexOf(string, pattern) {
  for (let i = 0; i < string.length; i++) {
    let subString = '';
    for (let letter = 0; letter < pattern.length; letter += 1) {
      subString += string[(i + letter)];
    }

    if (subString === pattern) return i;
  }
  return -1;
}

// Keep finding matching pattern, return index of last match found
function lastIndexOf(string, pattern) {
  let matchIndex = -1;
  
  for (let i = 0; i < string.length; i++) {
    let subString = '';
    for (let letter = 0; letter < pattern.length; letter += 1) {
      subString += string[(i + letter)];
    }

    if (subString === pattern) matchIndex = i;
  }
  return matchIndex;
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1