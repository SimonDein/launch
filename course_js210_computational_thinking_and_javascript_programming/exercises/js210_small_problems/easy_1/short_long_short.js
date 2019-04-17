// Write a function that takes two strings as arguments, determines the longer of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. 
// You may assume that the strings are of different lengths.

function shortLongShort(string1, string2) {
  let short, long;
  [short, long] = [string1, string2].sort((a, b) => a.length < b.length ? -1 : 0);
  
  console.log(short + long + short);
}


shortLongShort('abc', 'defgh');    // "abcdefghabc"
shortLongShort('abcde', 'fgh');    // "fghabcdefgh"
shortLongShort('', 'xyz');         // "xyz"