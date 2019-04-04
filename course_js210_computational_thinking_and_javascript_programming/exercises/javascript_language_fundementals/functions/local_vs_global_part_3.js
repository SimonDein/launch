// What will the following code log to the console and why?
// Don't run the code until after you have tried to answer.

var myVar = 'This is global';

function someFunction() {
  myVar = 'This is local';
}

someFunction();
console.log(myVar);

/*
Line 11 will output 'This is local'.
The global variable myVar is reassigned on line 7 when the function is invoked.
*/