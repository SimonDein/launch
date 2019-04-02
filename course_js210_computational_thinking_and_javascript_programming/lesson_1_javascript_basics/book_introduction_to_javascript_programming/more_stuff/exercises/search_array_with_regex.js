// Write a function that searches an array of strings for every element that matches the regular expression given by its argument.
// The function should return all matching elements in an array.

function filterMatch(words, regex) {
  return words.filter(word => regex.test(word));
}

function logMatch(words, regex) {
  let matches = filterMatch(words, regex);
  matches.forEach((match) => console.log(match));
}


// Example
let words = [
  'laboratory',
  'experiment',
  'flab',
  'Pans Labyrinth',
  'elaborate',
  'polar bear',
];

logMatch(words, /lab/);

// Output
// 'laboratory'
// 'flab'
// 'elaporate'