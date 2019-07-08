// Write a function that takes a string and returns an object containing three properties: one representing the number of characters in the string that are lowercase letters, one representing the number of characters that are uppercase letters, and one representing the number of characters that are neither.


// solution 1
function letterCaseCount(string) {
  let count = {
    lowercase: 0,
    uppercase: 0,
    neither: 0,
  };
  
  string.split('').forEach(function (character) {
    if (character.match(/[A-Z]/)) {
      count.uppercase += 1;
    } else if (character.match(/[a-z]/)) {
      count.lowercase += 1;
    } else {
      count.neither += 1;
    }
  });

  return count;
}

// solution 2
function letterCaseCount(string) {
  let lowerCaseCount = string.match(/[a-z]/g) || [];
  let upperCaseCount = string.match(/[A-Z]/g) || [];
  let neitherCaseCount = string.match(/[^a-z]/ig) || [];

  return {
    lowercase: lowerCaseCount.length,
    uppercase: upperCaseCount.length,
    neither: neitherCaseCount.length,
  }
}

console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }