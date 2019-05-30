// Rounding numbers up or down in JavaScript is easy, but there are three methods that perform different types of rounding. Math.round takes any decimal value and rounds it to the nearest integer. If the fractional part of the number is less than 0.5, Math.round rounds the value downwards; otherwise, it rounds the value upwards. Note: if the fractional part is exactly 0.5, Math.round rounds upwards. Math.floor rounds any number downward to the next lower integer. Math.ceil rounds any number upward to the next higher integer.

// Use the appropriate method on each of these variables to return a value of 50. Make sure you use each method once.

var a = 50.72;
var b = 49.2;
var c = 49.86;

console.log(Math.floor(a)); // 50
console.log(Math.ceil(b)); // 50
console.log(Math.round(c)); // 50