// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

var myVar = 'This is global';

function someFunction() {
  console.log(myVar);
}

someFunction();

/*
Invoking the function on line 9 will output 'This is global'.
A function can access any variable within it's closure.
*/