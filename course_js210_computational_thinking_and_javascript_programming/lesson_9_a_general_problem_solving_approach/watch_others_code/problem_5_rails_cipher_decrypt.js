/*
Algorithm:
  Decoding:
  - rails = [[], [], []] each representing a rail
  - fill rails
    - railIndex = 0
    - increment = 1
    - inputString.split('').forEach(char)
      - rail[railIndex].push(char)
      - railIndex += increment
      - if (railIndex % 3 === 0)
        - railIndex = -increment
        
        - add char
        - if (railIndex === 0 || railIndex % 2 === 0)
         - railIndex = -increment
        - railIndex += increment

  Index for rail1: 0, 4, 8, 12 etc

  W . . . E chipher.length = 
  . E . R .  => rail1.length = 2, rail2.length = 2, rail3.length = 1;
  . . A . .

  W . . . E . . . C . . . R . . . L . . . T . . . E
  . E . R . D . S . O . E . E . F . E . A . O . C .
  . . A . . . I . . . V . . . D . . . E . . . N . .

// Math.floor((cipher.length - 1) / 4) + 1

cipher: 'WECRLTEERDSOEEFEAOCAIVDEN'

  - rails = []
  - fill rails
    - rail

*/

// function zigZagArrayFor(array, callback, end) {
//   // array = array.slice();

//   let turnThreshold = array.length - 1 //=> 2
//   let thresholdTracker = -1; // we don't get
//   let arrayIndex = 0;
//   let increment = 1;
  
//   for(let start = 0; start < end; start += 1) {
//     callback(array[arrayIndex], arrayIndex, array); 
//     thresholdTracker += 1;

//     if (thresholdTracker === turnThreshold) {
//       thresholdTracker = 0;
//       increment = -increment;
//       arrayIndex += increment;
//       continue;
//     } 
//     arrayIndex += increment;
//   }
// }

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

  return decipher
}

console.log(railFenceCipherDecrypt('WECRLTEERDSOEEFEAOCAIVDEN'));