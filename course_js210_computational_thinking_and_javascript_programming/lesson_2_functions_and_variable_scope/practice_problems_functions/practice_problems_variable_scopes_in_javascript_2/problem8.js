// Please predict the output of the following programs, and explain why they output what they do.

var a = 'outer';

console.log(a);
setScope();
console.log(a);

var setScope = function () {
  a = 'inner';
};

/*
Line 5 outputs 'outer'
Line 7 raises a TypeError.
setScope is a variable at line 6 assigned to undefined due to hoisting.
First at line 9 is the variable assigned to the function.

With hoisting the code above is equivalent to:
*/

var a
var setScope

a = 'outer'

console.log(a);
setScope();
console.log(a);

setScope = function () {
  a = 'inner';
};

