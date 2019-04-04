// Please predict the output of the following programs, and explain why they output what they do.

var total = 50;
var increment = 15;

function incrementBy(increment) {
  total += increment;
}

console.log(total); // 50
incrementBy(10);
console.log(total); // 60
console.log(increment); // 15