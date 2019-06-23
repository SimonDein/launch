// Write a function that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as backwards. The substrings in the returned list should be sorted by their order of appearance in the input string. Duplicate substrings should be included multiple times.

// You may (and should) use the substrings function you wrote in the previous exercise.

// For the purpose of this exercise, you should consider all characters and pay attention to case; that is, 'AbcbA' is a palindrome, but 'Abcba' and 'Abc-bA' are not. In addition, assume that single characters are not palindromes.

console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
// returns
// [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
//   "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
//   "-madam-", "madam", "ada", "oo" ]

console.log(palindromes('knitting cassettes'));
// returns
// [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]


function palindromes(string) {
  return substrings(string).filter((word) => isPalindrome(word));
}

function isPalindrome(string) {
  if (string.length <= 1) return false;
  return string.split('').reverse().join('') === string;
}

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
