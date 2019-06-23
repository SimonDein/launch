// Write a function that returns a list of all substrings of a string. Order the returned list by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, return the substrings at a given position from shortest to longest.

// You may (and should) use the substringsAtStart function you wrote in the previous exercise:


console.log(substrings('abcde'));

function substrings(string) {
  let substrings = [];
  let substring;
  let i;
  
  for (i = 0; i < string.length; i += 1) {
    substring = substringsAtStart(string.slice(i))
    substrings = substrings.concat(substring);
  }

  return substrings;
}


function substringsAtStart(string) {
  let characters = string.split('');
  return characters.map(function (_character, index, array) {
    return array.slice(0, index + 1).join('');
  });
}

// returns
[ "a", "ab", "abc", "abcd", "abcde",
  "b", "bc", "bcd", "bcde",
  "c", "cd", "cde",
  "d", "de",
  "e" ]