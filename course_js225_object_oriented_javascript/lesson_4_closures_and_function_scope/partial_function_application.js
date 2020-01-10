/*
Closures give us the tools to invoke functions in more flexable ways.

If we fx. make a pretty generic function that adds two numbers:
*/

function add(first, second) {
  return first + second;
}

// But we want to specify it more by always including a certain argument:
function addOne(first) {
  add(first, 1);
}

// We now have such a function. But let's say we want another one -
// called addThree or addFour. We'll have to keep defining new functions

// Instead we use a closure along with partial application to generate those new functions:

function add(first, second) {
  return first + second;
}

function generatorFunction(func, arg1) {
  return function(arg2) {
    return func(arg1, arg2);
  }
}

let addOne = generatorFunction(add(), 1);
let addThree = generatorFunction(add(), 3);
addOne(2) // 3
addThree(5) // 8


// We now have a "generator" function that partially applies some of the arguments,
// and let's us provide more arguments at invocation.


// Two exercises
// Write a function that takes two arguments and logs a greeting:
function greet(greeting, name) {
  console.log(greeting + ', ' + name + '!');
}

greet('Hello', 'Mathias'); // 'Hello, Mathias'
greet('Good morning', 'Sofie'); // 'Good morning, Sofie'

// Use the partial function shown below and your solution to problem 1 to create sayHello and sayHi functions that work like this:

function partial(primary, arg1) {
  return function(arg2) {
    return primary(arg1, arg2);
  };
}

let sayHola = partial(greet, 'Hola');
sayHola('Eva');

let sayYo = partial(greet, 'Yo');
sayYo('Kim');