// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

var a = 7;

function myValue(b) {
  b += 10;
}

myValue(a);
console.log(a);

// output will be 7, the argument is a primitive value and is passed by value and cannot be mutated.