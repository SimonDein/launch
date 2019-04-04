// Please predict the output of the following programs, and explain why they output what they do.

function hello() {
  a = 'hello';
  console.log(a);

  if (false) {
    var a = 'hello again';
  }
}

hello();
console.log(a);

/*
When we call the function on line 12 a global variable a is assigned to the string 'hello'.
Line 5 prints out 'hello', the if statment is never run and the function returns execution.

Line 13 throws a ReferenceError. You might expect that 'a' on line 4 would create a global variable,
BUT because of the statement 'var a' on line 8 and the way hoisting in JavaScript works,
a is "blocked" from being a global variable and is hoisted to be at the scope of the function and not the global object.

Hoisting will in effect look like this:
*/

function hello() {
  var a // note the difference!
  a = 'hello';
  console.log(a);

  if (false) {
    a = 'hello again'; // note the difference!
  }
}

hello();
console.log(a);