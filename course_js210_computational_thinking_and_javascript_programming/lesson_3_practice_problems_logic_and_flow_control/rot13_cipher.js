// If the character is a letter in the modern English alphabet, change it to the character 13 positions later in the alphabet.

// So a becomes n. If you reach the end of the alphabet, return to the beginning. So o becomes b.

// Letter transformations preserve case. A becomes N while a becomes n.

// Don't modify characters that are not letters.

function isLetter(asciiChar) {
   return (asciiChar >= 65 && asciiChar <= 90) ||
         (asciiChar >= 97 && asciiChar <= 122)
}

function exceedsAsciiLimit(asciiChar, asciiCharRotated) {
  return   (asciiCharRotated > 90 && asciiChar <= 90) ||
         (asciiCharRotated > 122 && asciiChar <= 122)
}

function rot13(string) {
  const ROTATION = 13;
  const OFFSET = 26;
  let newString = '';
  let asciiChar;
  let asciiCharRotated;

  for(i = 0; i < string.length; i++) {
    asciiChar = string.charCodeAt(i);


    if (isLetter(asciiChar)) {
      asciiCharRotated += ROTATION;

      if (exceedsAsciiLimit(asciiChar, asciiCharRotated)) {
        asciiChar -= OFFSET;
      }
    }
    
    newString += String.fromCharCode(asciiChar)
  }
  
  return newString
}


console.log(rot13('Teachers open the door, but you must enter by yourself.'));

// logs:
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));

// logs:
// Teachers open the door, but you must enter by yourself.