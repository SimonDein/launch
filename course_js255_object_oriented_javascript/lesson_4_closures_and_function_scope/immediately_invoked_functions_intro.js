/*
An immediately invoked function is a function we define and invoke simultaniously.
An immediately invoked function can be used to prevent hoisting of functions and reduce polution of the
name space

They look like this:
*/

(function () {
  console.log('hello')
})()

// The surrounding parenthisis is a group operator that controls evaluation of expressions:
(3) // 3
(2 * (4 + 3)) // 14 - not 11 as without the parenthisis

// By surrounding the function in parenthisis we turn the declaration into an expression
// and expressions returns a value - in this case a function.
// We can then call the returned function by appending parenthisis to the expression:

(function () {
  // ...some code
})() // we call the returned function

// We can pass arguments to an IIFE like any other function:
(function (a) {
  return a + 1;
})(2) // 3


// The parenthisis can be omitted if the function expression doesn't occur at the beginning of a line:
let foo = function() {
  return function() {
    return 10;
  }(); // here omit the surrounding parens
}(); // here omit the surrounding parens

console.log(foo) // 10

/*
IIFE can be useful if we fx. want need to add some code to a large and messy codebase.
When we can't be sure if overwrite existing values if we by accident use a variable name
already taken in the scope - IIFE can prevent and name space issues. The expression creates
its own scope and we immedietaly call it to execute any code within:
*/

// thousands of lines of messy JavaScript code!

for (var i = 0; i < 100; i += 1) {
  console.log(i);
}

// more messy JavaScript code

// What if we overwrote a value assigned to i furhter up? Or code was dependant on it later?
// We could try this:

// thousands of lines of messy JavaScript code!

function loopAndLog() {
  for (var i = 0; i < 100; i += 1) {
    console.log(i);
  }
}

loopAndLog();

// more messy JavaScript code
// But again - what if there's already a function by the name loopAndLog?

// This will ensure we don't change something by accident or polute the name space:

// thousands of lines of messy JavaScript code!

(function(number) {
  for (var i = 0; i < number; i += 1) {
    console.log(i);
  }
})(100);

// more messy JavaScript code