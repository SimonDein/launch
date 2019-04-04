// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

var a = 7;

function myValue(a) {
  a += 10;
}

myValue(a);
console.log(a);

/*
Line 10 will output 7.
When the function is invoked, a local variable 'a' will be initialized.
On line 6 that local variable will be reassined - and not the global variable 'a' on line 3.

*/