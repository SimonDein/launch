// What will the following code snippets log?

// Code Snippet 1
var counter = 5;
var rate = 3;
console.log('The total value is ' + String(counter * rate));

function counter(count) {
  // ...
}

/*

It will log 'The total value is 15'.
The function is really a variable assigned to function and is hoisted first.
Then the variable counter will be reassigned to 5 and rate to 3. Then logged.

*/

// Code Snippet 2
function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

var counter = 5;
var rate = 3;

/*

This will log 'The total value is NaN'.
The function is hoisted first. Then the two variable declarations.
Then we try to multiply a function by undefined (rate is not assigned to anything yet)
and we end up with NaN.

*/


// Code Snippet 3
var counter = 5;
var rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

/*

This will log 'The total value is 15.
The function is really a variable assigned to a function.
Functions are hoisted first, so now we have a variable called counter assigned to a function.
Then the two variable declarations are hoisted as well (not the assignmnet).
counter already exists and the declaration is ignored.
rate doesn't exist and is hoisted right after the variable counter assigned to the function.
Then the assignment takes place - counter is reassigned to 5 instead of the function - rate is assigned to 3.

Then we log.

*/