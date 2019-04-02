// What does the following program log to the console? Why?

let foo = {
  a: 'hello',
  b: 'world',
};

let qux = 'hello';

function bar(argument1, argument2) {
  argument1.a = 'hi';
  argument2 = 'hi';
}

bar(foo, qux);

console.log(foo.a);
console.log(qux);

/*
Line 17 will output 'hi'. 
Objects are mutable and in this case the key a in the object are reassinged to the value 'hi'.
The object is passed by reference and is that changed in memory and we see the effect once we log to the console.

Line 18 will output 'hello'.
Primitives are immutable and will pass by value to the function. The function then reassigns the local
variable argument2 to the value of 'hi', but with no effect on the variable qux.
*/