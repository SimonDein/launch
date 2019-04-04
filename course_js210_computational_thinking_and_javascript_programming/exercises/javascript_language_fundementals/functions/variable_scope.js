// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

function someFunction() {
  myVar = 'This is global';
}

someFunction();
console.log(myVar);

/*
Line 8 will output 'This is global'.
When our function is run, the variable myVar is defined without a variable type and becomes a property
on the global object. This makes it accessible on line 8.

*/