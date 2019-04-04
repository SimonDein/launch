// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

console.log(a);

var a = 1;

/*
Line 3 will output 'undefined' due to hoisting
The hoisted code would in effect look like this:
*/

var a
console.log(a);

a = 1;

// A declared variable that is not assigned will be implicitly assigned to undefined