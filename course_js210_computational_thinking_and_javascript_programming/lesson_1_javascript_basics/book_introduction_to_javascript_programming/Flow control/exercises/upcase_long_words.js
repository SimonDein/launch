// Solution 1

function upcaseLongerThan10(string) {
  if (string.length > 10) {
    return string.toUpperCase();
  }
  return string;
}

console.log(upcaseLongerThan10('Hello world!'));
console.log(upcaseLongerThan10('Yo'));

// Solution 2

function capsLong(string) {
  return (string.length > 10) ? string.toUpperCase() : string;
}
console.log(capsLong('Hello world!'));
console.log(capsLong('Yo'));