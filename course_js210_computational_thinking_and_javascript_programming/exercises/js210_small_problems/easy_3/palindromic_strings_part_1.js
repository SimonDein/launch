// Write a function that returns true if the string passed as an argument is a palindrome, or false otherwise. A palindrome reads the same forwards and backwards. For this problem, the case matters and all characters matter.


// with use of Array.prototype.reverse()
function isPalindrome(string) {
  return string === string.split('').reverse().join('');
}

// With no use of Array.prototype.reverse()
function isPalindrome(string) {
  let halfLength = Math.floor(string.length / 2);
  let rightIndex;
  
  for(let i = 0; i < halfLength; i += 1) {
    rightIndex = (string.length - i) - 1;
    if (string[i] !== string[rightIndex]) {
      return false
    }
  }
  
  return true;
}

// Examples:
console.log(isPalindrome('madam'));               // true
console.log(isPalindrome('Madam'));               // false (case matters)
console.log(isPalindrome("madam i'm adam"));      // false (all characters matter)
console.log(isPalindrome('356653'));              // true