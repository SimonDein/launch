/*
Algorithm:
  - get characters
  - draw on rails in zig zag
  - combine characters from each rail
*/

function zigZagFor(end, callback, width = 3) {
  let turnThreshold = width - 1;
  let thresholdTracker = -1;
  let zigZagIndex = 0;
  let increment = 1;
  
  for(let start = 0; start < end; start += 1) {
    callback(zigZagIndex, start); 
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


function railFenceCipherEncrypt(text) {
  if (text.length === 0) return undefined;

  let characters = text.match(/\S/gi).join('');
  let rails = [[], [], []];
  
  zigZagFor(characters.length, function (railIndex, characterIndex) {
    rails[railIndex].push(characters[characterIndex])
    characterIndex += 1;
  })
  
  return rails.flat().join('').toUpperCase();
}

console.log(railFenceCipherEncrypt('we are discovered flee at once')) // => 'WECRLTEERDSOEEFEAOCAIVDEN'
console.log(railFenceCipherEncrypt('')) // => 'WECRLTEERDSOEEFEAOCAIVDEN'
console.log(railFenceCipherEncrypt('')) // => 'WECRLTEERDSOEEFEAOCAIVDEN'