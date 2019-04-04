// Please predict the output of the following programs, and explain why they output what they do.

var a = 'outer';
var b = 'outer';

console.log(a);
console.log(b);
setScope(a);
console.log(a);
console.log(b);

function setScope(foo) {
  foo = 'inner';
  b = 'inner';
}

/*
Line 6 will print 'outer'
Line 7 will print 'outer'
Line 8 calls setScope which results in the global b variable to be assigned to 'inner'.
Line 9 prints 'outer'
Line 10 prints 'inner'.
*/