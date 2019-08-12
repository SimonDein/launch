/*
Example:
W . . . E . . . C . . . R . . . L . . . T . . . E   rail1
. E . R . D . S . O . E . E . F . E . A . O . C .   rail2
. . A . . . I . . . V . . . D . . . E . . . N . .   rail3

Each rail is concatenated together:
rail1 + rail2 + rail3 => 'WECRLTEERDSOEEFEAOCAIVDEN'

----- PEDAC -----
Examples:$
console.log(railFenceCipherDecrypt('WECRLTEERDSOEEFEAOCA$IVDEN')); // => WEAREDISCOVEREDFLEEATONCE$
console.log(railFenceCipherDecrypt('WEER')); // => WERE$$
console.log(railFenceCipherDecrypt('TKRNU')); // =$> TRUNK$
console.log(railFenceCipherDecrypt('T')); $// => T$
console.log(railFenceCipherDecrypt('TkRNu$')); // => TRUNK

DataStructure:
  - Arrays
    - fits structure of having "rails" of characters
    - mutable, could work when we need to read off each rail in a zig zag

  - String for output

Algorithm:
  Decoding:
  - rails = [[], [], []] each representing a rail
  - fill rails
  - read of each rail
  */

function zigZagFor(end, callback, width = 3) {
  let turnThreshold = width - 1;
  let thresholdTracker = -1;
  let zigZagIndex = 0;
  let increment = 1;
  
  for(let start = 0; start < end; start += 1) {
    callback(zigZagIndex); 
    thresholdTracker += 1;
    if (thresholdTracker === turnThreshold) {
      thresholdTracker = 0;
      increment = -increment;
      zigZagIndex += increment;
      continue;
    } 
    zigZagIndex += increment;
  }
}

function getRailLengths(zigZagEnd) {
  let railLengths = [0, 0, 0];

  zigZagFor(zigZagEnd, function (index) {
    railLengths[index] += 1;
  })

  return railLengths;
}

function getRailCharacters(railLengths, text) {
  let characters = text.split('');
  let railCharacters = [];
  
  railLengths.forEach(function (length){
    railCharacters.push(characters.splice(0, length));
  });

  return railCharacters;
}

function readRails(railCharacters) {
  let decipher = '';
  let zigZagEnd = railCharacters.flat().length;

  zigZagFor(zigZagEnd, function (index) {
    decipher += railCharacters[index].shift()
  })
  
  return decipher;
}

function railFenceCipherDecrypt(cipher) {
  let railLengths = getRailLengths(cipher.length);
  let railCharacters = getRailCharacters(railLengths, cipher);
  let decipher = readRails(railCharacters);

  return decipher.toUpperCase()
}

console.log(railFenceCipherDecrypt('WECRLTEERDSOEEFEAOCAIVDEN')); // => WEAREDISCOVEREDFLEEATONCE
console.log(railFenceCipherDecrypt('WEER')); // => WERE
console.log(railFenceCipherDecrypt('TKRNU')); // => TRUNK
console.log(railFenceCipherDecrypt('T')); // => T
console.log(railFenceCipherDecrypt('TkRNu')); // => TRUNK
