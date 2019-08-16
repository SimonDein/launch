// The Vigenere Cipher encrypts alphabetic text using polyalphabetic substitution. It uses a series of Caesar Ciphers based on the letters of a keyword. Each letter of the keyword is treated as a shift value. For instance, the letter 'B' corresponds to a shift value of 1, and the letter 'd' corresponds to a shift value of 3. In other words, the shift value used for a letter is equal to its index value in the alphabet. This means that the letters 'a'-'z' are equivalent to the numbers 0-25. The uppercase letters 'A'-'Z' are also equivalent to 0-25.

// Applying the Vigenere Cipher is done sequentially for each character by applying the current shift value to a Caesar Cipher for that particular character. To make this more concrete, let's look at the following example:

// plaintext: Pineapples don't go on pizzas!
// keyword: meat

// Applying the Vigenere Cipher for each alphabetic character:
// plaintext : Pine appl esdo ntgo onpi zzas
// shift     : meat meat meat meat meat meat
// ciphertext: Bmnx mtpe qwdh zxgh arpb ldal

// result: Bmnxmtpeqw dhz'x gh ar pbldal!
// Notice that in the example, the key isn't moved forward if the character isn't in the alphabet. Like the Caesar Cipher, the Vigenere Cipher only encrypts alphabetic characters.

// Write a function that implements the Vigenere Cipher. The case of the keyword doesn't matter—in other words, the resulting encryption won't change depending on the case of the keyword's letters (e.g., 'MEat' === 'mEaT').

/*
------ PEDAC ------
Problem:
  Input:
    - String: message
    - String: keyword
      - represents shiftkeys to be applied to each character

  Output:
    - String: encrypted
  
  Rules:
    - each letter in keyword is a shiftvalue: keyWord "abcd" => "0123"
    - looping shiftvalues (until end of message), current letter is shifted shiftValue in alphabet
    - non alphabetic characters stay in place
    - lettercase of inputMessage is kept as is
    - lettercase of keyword does not matter
    - the shiftKey is only moved for each letter substituted

Data Structure:
  - message: string
    - we can use String.replace() with a function

  - keyword: Array
    - We can use Array.map() to get the shift values of keyWord


Algorithm:
  - get keyWord shift keys: 'abc' => [0, 1, 2]
    - keyWord.split('').map(getAlphabetIndex)
  - get current shiftKey: round1 => 0
    - shiftKey = shiftKeys[0]
    - shiftKeys = shiftKeys.push(shiftKeys.shift())

  - message.replace(/any letter/, ceasarEncrypt(shiftKey))
*/

const ALPHABET = 'abcdefghijklmnopqrstuvwxyz';

function vigenereCipherEncrypt(message, keyWord) {
  function shiftLetter(match) {
    let currentShiftKey = shiftKeys[0];
    shiftKeys.push(shiftKeys.shift());

    return ceasarEncrypt(match, currentShiftKey)
  }

  let shiftKeys = getAlphabetLetterIndexes(keyWord);
  return message.replace(/[a-z]/ig, shiftLetter);
}


console.log(vigenereCipherEncrypt("Pineapples don't go on pizzas!", 'meat')) // => Bmnxmtpeqw dhz'x gh ar pbldal!
console.log(vigenereCipherEncrypt("Pineapples don't go on pizzas!", 'MeAt')) // => Bmnxmtpeqw dhz'x gh ar pbldal!


function getAlphabetLetterIndexes(string) {
  return string.split('').map((letter) => ALPHABET.indexOf(letter.toLowerCase()));
}

function ceasarEncrypt(message, shiftKey) {
  function shiftLetter(match) {
    return getShiftLetter(match, shiftKey);
  }
  
  return message.replace(/[a-z]/gi, shiftLetter);
}

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