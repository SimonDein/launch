// Write a function that takes a string as an argument and returns true if the string contains properly balanced parentheses, false otherwise. Parentheses are properly balanced only when '(' and ')' occur in matching pairs, with each pair starting with '('.

function isBalanced(string) {
  let paranthesisCount = 0;
  let i;
  for (i = 0; i < string.length; i += 1) {
    if (string[i] === '(') paranthesisCount += 1;
    if (string[i] === ')') paranthesisCount -= 1;
    if (paranthesisCount < 0) return false;
  }
  return paranthesisCount === 0;
}

console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What) ()is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false