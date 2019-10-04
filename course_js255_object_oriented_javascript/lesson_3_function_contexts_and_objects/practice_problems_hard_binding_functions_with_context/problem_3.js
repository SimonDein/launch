// What will the code below output?

var a = 1;
var b = -1;
var obj = {
  a: 2,
  b: 3,
};

function foo() {
  return this.a + this.b;
}

var bar = foo.bind(obj);

console.log(foo());
console.log(bar());

/*
Line 16 will output 0
Line 17 will output 5

Line 16 when called will access the variables a and b in the global scope
Line 17 will refer to the properties defined in obj on line 5, as bar has bound 'this' to obj.
*/