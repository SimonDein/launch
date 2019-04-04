// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

logValue();

function logValue() {
  console.log('Hello, world!');
}

/*
Line 3 will output 'Hello, world!' due to hoisting.
The hoisted code would in effect look like this:
*/

function logValue() {
  console.log('Hello, world!');
}

logValue();

// Hoisted functions will hoist the whole function including the body
// Hoisted function expressions will only hoist the variable and assign the function at definition