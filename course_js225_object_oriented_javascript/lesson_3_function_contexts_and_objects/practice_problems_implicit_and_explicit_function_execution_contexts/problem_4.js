// What will the code below output?

var a = 10;
var b = 10;
var c = {
  a: -10,
  b: -10,
};

function add() {
  return this.a + b;
}

c.add = add;

console.log(add());
console.log(c.add());

/*
line 16 will output => 20
line 17 will output => 0

The difference is that when c.add() is called, this.a will refer to c's a, which is -10,
but b will refer to the global b, which is 10.
*/