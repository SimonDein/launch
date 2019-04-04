var logValue = 'foo';

function logValue() {
  console.log('Hello, world!');
}

console.log(typeof logValue);

// hoisted equivalent
function logValue() {
  console.log('Hello, world!');
}
var logValue
logValue = 'foo';

console.log(typeof logValue);

[1, 2, 3].forEach(function printNum(num) {
  console.log(num)
});