// Write a function that implements the Caesar Cipher. The Caesar Cipher is one of the earliest and simplest ways to encrypt plaintext so that a message can be transmitted securely. It is a substitution cipher in which each letter in a plaintext is substituted by the letter located a given number of positions away in the alphabet. For example, if the letter 'A' is right-shifted by 3 positions, it will be substituted with the letter 'D'. This shift value is often referred to as the key. The "encrypted plaintext" (ciphertext) can be decoded using this key value.

// The Caesar Cipher only encrypts letters (including both lower and upper case). Any other character is left as is. The substituted letters are in the same letter case as the original letter. If the key value for shifting exceeds the length of the alphabet, it wraps around from the beginning.

/*
------------ PEDAC ------------
Input:
  - String to be "encoded"
  - An integer representing the "shift key"

Ouput: String "encoded" according to rules

Rules:
 - The "shift key" represents how many places a character should be shifted in the alphabet
 - Only shifts letters
  - any other character stays as it is
- If the value of a "shift key" exceeds the alphabet, it wraps around from the beginning
- Letters keep letter case

Data Structure:
  - String
    - Replace
    - Unicode for shifting values without having to check case.

Algorithm:
  - Replace each letter
    - upperCase = boolean
    - get alphabet index: [a, b, c ...., z]
    - get shift index
      - 26 % index + shiftValue
    - return alphabet[shiftIndex]
*/
const ALPHABET = 'abcdefghijklmnopqrstuvwxyz';

function caesarEncrypt(message, shiftKey) {
  function shiftLetter(match) {
    return getShiftLetter(match, shiftKey);
  }
  
  return message.replace(/[a-z]/gi, shiftLetter);
}

// simple shift
console.log(caesarEncrypt('A', 0));       // "A"
console.log(caesarEncrypt('A', 3));       // "D"

// wrap around
console.log(caesarEncrypt('y', 5));       // "d"
console.log(caesarEncrypt('a', 47));      // "v"

// all letters
console.log(caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25));
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
console.log(caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5));
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
console.log(caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2));
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"



function getShiftLetter(letter, shift) {
  let letterIndex = ALPHABET.indexOf(letter.toLowerCase());
  let shiftIndex = (letterIndex + shift) % 26;
  let shiftedLetter = ALPHABET[shiftIndex];

  if (isUpperCase(letter)) shiftedLetter = shiftedLetter.toUpperCase();
  
  return shiftedLetter;
}

function isUpperCase(string) {
  return string.toLowerCase() !== string;
}