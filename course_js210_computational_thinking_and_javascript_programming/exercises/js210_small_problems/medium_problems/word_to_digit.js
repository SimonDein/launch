// Write a function that takes a sentence string as an argument, and returns that string with every occurrence of a "number word" — 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' — converted to its corresponding digit character.

// Further Exploration
// Can you refactor the function so that it does not use a loop?

const DIGIT_NOUNS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
const matchDigitNoun = /\b(one|two|three|four|five|six|seven|eight|nine)\b/gi;

const digitNounToDigit = function(noun) {
  return DIGIT_NOUNS.indexOf(noun);
}

function wordToDigit(sentence) {
  return sentence.replace(matchDigitNoun, digitNounToDigit);
}

console.log(wordToDigit('Please call me at five five five one two three four. Thanks. Height of the'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."