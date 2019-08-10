// Problem Description
// A collection of spelling blocks has two letters per block, as shown in this list:

// B:O   X:K   D:Q   C:P   N:A
// G:T   R:E   F:S   J:W   H:U
// V:I   L:Y   Z:M
// This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

// Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

// Examples:

// isBlockWord('BATCH');      // true
// isBlockWord('BUTCH');      // false
// isBlockWord('jest');       // true

/*
Problem
  input:
    - word
      - string
      - case-insensitive
      - don't have to consider anything but a string of consecutive letters

  output: 
    - boolean
      - describes if arg fits the rules or not

  Block rules:
    - a block consists of two letters
      - each block can only be used once
Examples / test cases
  isBlockWord('BATCH');      // true
  isBlockWord('BUTCH');      // false
  isBlockWord('jest');       // true
  isBlockWord('');       // false

Data structure
spellingblocks: hash - we can look up the block a letter belongs to and count how many times it has been used
word: stays as is - we can use a for loop and terminate early if a block has been used twice. We can downcase as well

Algorithm
  - Is a block used more than once
    - word.toLowerCase()
    - for loop: for each letter
      - look up the block letter belongs to
        - SPELLING_BLOCKS.keys.filter
      - if count === 0
        - count += 1
      - else
        - return false
    - return true
*/


function isBlockWord(word) {
  if (word.length === 0) return false;
  
  const SPELLING_BLOCKS = {
    'bo': 0, 'xk': 0, 'dq': 0, 'cp': 0,
    'na': 0, 'gt': 0, 're': 0, 'fs': 0,
    'jw': 0, 'hu': 0, 'vi': 0, 'ly': 0, 'zm': 0,
  }
  
  word = word.toLowerCase();
  let block;
  let letter;
  let i;

  for (i = 0; i < word.length; i += 1) {
    letter = word[i];
    block = Object.keys(SPELLING_BLOCKS).filter((key) => key.includes(letter))[0];
    SPELLING_BLOCKS[block] += 1;
    
    if (SPELLING_BLOCKS[block] > 1) return false
  }

  return true;
}



console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('ba'));      // true
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord(''));       // false