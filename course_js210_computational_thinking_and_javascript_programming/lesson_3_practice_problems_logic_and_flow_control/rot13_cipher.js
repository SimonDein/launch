// If the character is a letter in the modern English alphabet, change it to the character 13 positions later in the alphabet.

// So a becomes n. If you reach the end of the alphabet, return to the beginning. So o becomes b.

// Letter transformations preserve case. A becomes N while a becomes n.

// Don't modify characters that are not letters.

LOW_CASE_LOW_BOUNDARY  = 65;
LOW_CASE_HIGH_BOUNDARY = 90;
UP_CASE_LOW_BOUNDARY   = 97;
UP_CASE_HIGH_BOUNDARY  = 122;

function isLetter(asciiCode) {
  
   return (asciiCode >= LOW_CASE_LOW_BOUNDARY && asciiCode <= LOW_CASE_HIGH_BOUNDARY) ||
            (asciiCode >= UP_CASE_LOW_BOUNDARY && asciiCode <= UP_CASE_HIGH_BOUNDARY);
}

function exceedsAsciiLetterRange(asciiCode, asciiCodeRotated) {
  return (asciiCodeRotated > LOW_CASE_HIGH_BOUNDARY && asciiCode <= LOW_CASE_HIGH_BOUNDARY) ||
           (asciiCodeRotated > UP_CASE_HIGH_BOUNDARY && asciiCode <= UP_CASE_HIGH_BOUNDARY);
}

function rot13(string) {
  const ROTATION = 13;
  const OFFSET = 26;
  let newString = '';
  let asciiCode;
  let asciiCodeRotated;

  for(i = 0; i < string.length; i++) {
    asciiCode = string.charCodeAt(i);


    if (isLetter(asciiCode)) {
      asciiCodeRotated = asciiCode + ROTATION;

      if (exceedsAsciiLetterRange(asciiCode, asciiCodeRotated)) {
        asciiCodeRotated -= OFFSET;
      }

      asciiCode = asciiCodeRotated;
    }
    
    newString += String.fromCharCode(asciiCode);
  }
  
  return newString;
}


console.log(rot13('Teachers open the door, but you must enter by yourself.'));

// logs:
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));

// logs:
// Teachers open the door, but you must enter by yourself.