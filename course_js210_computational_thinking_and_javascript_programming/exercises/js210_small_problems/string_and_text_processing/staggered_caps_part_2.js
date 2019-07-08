// Modify the function from the previous exercise so that it ignores non-alphabetic characters when determining whether a letter should be upper or lower case. Non-alphabetic characters should still be included in the output string, but should not be counted when determining the appropriate case.

function staggeredCase(string) {
  let needCaps = true;
  let newChar;
  
  return string.split('').map(function (char) {
    if (/[a-z]/i.test(char)) {
      if (needCaps) {
        newChar = char.toUpperCase();
      } else {
        newChar = char.toLowerCase();
      }

      needCaps = !needCaps;
      return newChar;
    } else {
      return char
    }
  }).join('');
}

console.log(staggeredCase('I Love Launch School!'));        // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL CAPS'));                     // "AlL cApS"
console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 nUmBeRs"