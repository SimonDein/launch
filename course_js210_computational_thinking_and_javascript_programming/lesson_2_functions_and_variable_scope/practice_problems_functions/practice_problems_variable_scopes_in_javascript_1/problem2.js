// Please predict the output of the following programs, and explain why they output what they do.

var a = 'outer';

function testScope() {
  a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);

/*
Line 10 will output 'outer'
It can only access the a variable in the global scope

Line 11 will output 'inner'
On line 6 the a variable defined on line 3 is reassigned to 'inner'.
Line 7 accesses a with it's new value.

Line 12 will output 'inner'
The variable has been reassinged from invoking the function on line 11.
It still only accesses the global variable - but the value has changed.

*/