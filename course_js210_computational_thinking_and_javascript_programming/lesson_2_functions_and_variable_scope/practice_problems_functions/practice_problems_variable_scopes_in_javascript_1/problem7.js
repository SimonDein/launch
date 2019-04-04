// Please predict the output of the following programs, and explain why they output what they do.

console.log(a);

function hello() {
  a = 1;
}

/*
Line 3 will output a ReferenceError.
Hoisting the code would effect look like this: */

function (hello) {
  a = 1;
}

console.log(a);

/*
The global variable a wouldn't be initialized before we actually invoke 
the function.
*/