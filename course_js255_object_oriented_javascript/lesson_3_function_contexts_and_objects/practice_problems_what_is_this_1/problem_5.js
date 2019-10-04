// What does the following program log to the console?
function foo() {
  console.log(this.a);
}

var a = 2;
foo();

/*
this will log 2. A variable declared in the global scope, will be assigned a property of the global object.
Since this in a function will point to the global object and a is a property on the global object this.a will return 2.
*/