// Please predict the output of the following programs, and explain why they output what they do.

var a = 'outer';

function testScope() {
  var a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);

/*
Line 10 will output 'outer'.
It's the only variable with the name 'a' in the scope of the console.log invocation.

Line 11 will output 'inner'
It's the first variable in its scope it encounters with the name 'a'.
The a variable in the function shadows the a variable in the global scope.

Line 12 is exactly the same as line 10;
*/