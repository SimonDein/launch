// What does the following program log to the console?
var a = 1;
function bar() {
  console.log(this.a);
}

var obj = {
  a: 2,
  foo: bar,
};

obj.foo();

/*
the function bar is assigned as a method on the object obj. This in a method points to the object and this.a will print 2.
*/