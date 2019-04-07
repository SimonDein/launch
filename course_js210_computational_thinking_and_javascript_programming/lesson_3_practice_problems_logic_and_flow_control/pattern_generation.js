// Write a function that takes a number of rows as the argument n and logs a square of numbers and asterisks.
// For example, if n is 7, log the following pattern:


function generatePattern (num) {
  let pattern = ''
  for (let i = 1; i <= num; i += 1) {
    pattern += String(i);
    asterisk = '*'.repeat(num - i)
    console.log(pattern + asterisk);
  }
}

generatePattern(3);
generatePattern(6);