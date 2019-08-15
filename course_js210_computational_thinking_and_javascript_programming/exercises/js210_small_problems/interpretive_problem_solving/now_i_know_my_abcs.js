
// A collection of spelling blocks has two letters per block, as shown in this list// B:O   X:K   D:Q   C:P   N:A
// G:T   R:E   F:S   J:W   H:U
// V:I   L:Y   Z:M
// This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

// Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

/*
Problem:
 - Input: word string
 - Output: boolean, describing whether input fits rules or not
    - return undefined if no characters

  - Rules:
    - a block consists of two letters
    - each block can only be used once
    - if a block is used more than once, return false

Data structure:
  - Object
    - we can associate labels with a value

Algorithm:
  - get all chars
  - go through each char
    - find block corresponding to char
      - if block is already used
        - return false
      - else
        - set as used
*/


function isBlockWord(word) {
  let chars = word.toLowerCase().match(/[a-z]/gi);
  if (chars === null) return undefined;

  let blocks = ['bo', 'xk', 'dq','cp', 'na', 'gt','re', 'fs', 'jw','hu', 'vi', 'ly','zm'];
  let i;

  for (i = 0; i < chars.length; i += 1) {
    let charBlock = blocks.filter((block) => block.includes(chars[i]))[0];
    let charBlockIndex = blocks.indexOf(charBlock);

    if (charBlockIndex === -1) return false

    blocks.splice(charBlockIndex, 1);
  }

  return true;
}




console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord('bOt'));       // false
console.log(isBlockWord('bob')); // false
console.log(isBlockWord('bkqcngefjhvlz')); // true
console.log(isBlockWord('34@')); // undefined