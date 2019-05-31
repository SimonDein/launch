// The penultimate function takes a string as an argument and returns the next-to-last word in the string. The function assumes that "words" are any sequence of non-whitespace characters. The function also assumes that the input string will always contain at least two words. The penultimate function in the example below does not return the expected result. Run the code below, check the current result, identify the problem, explain what the problem is, and provide a working solution.

// Examples:

function penultimate(string) {
  return string.split(' ')[-2];
}

/*

The function splits the string on any spaces returning an array. Then it tries to access an index / property
-2 which is non-existant and returns undefined.
In JavaScript, unlike other programming languages such as Ruby, we can't extract an object in the array using negative integers.
Instead it will often return undefined as it looks for a property with a key of '-1' (remember arrays are objects!) and doesn't find any.

Instead the functions should the base index we try to access by the -
length of the array.

*/

// fixed
function penultimate(string) {
  let words = string.split(' ')
  return words[words.length - 2];
}

// another solution
function penultimate(string) {
  return string.split(' ').slice(-2, -1)[0];
}

console.log(penultimate('last word'));                    // expected: "last"
console.log(penultimate('Launch School is great!'));      // expected: "is"

