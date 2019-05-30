// Implement a function that takes a String as an argument and returns an object that contains a count of the repeated characters.

function repeatedCharacters(string) {
  let repeatedCharacters = {};
  let matches
  let regex
  let i
  
  for(i = 0; i < string.length; i++) {
    regex = new RegExp(`${string[i]}`, 'ig')
    matches = string.match(regex).length;

    if (matches >= 2) {
      repeatedCharacters[string[i]] = matches;
    }
  }
  
  return repeatedCharacters;
}

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }

// Note that repeatedCharacters does a bit more than simply count the frequency of each character: it determines the counts, but only returns counts for characters that have a count of 2 or more. It also ignores the case.