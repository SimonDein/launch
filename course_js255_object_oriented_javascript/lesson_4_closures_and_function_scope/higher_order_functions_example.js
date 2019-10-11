/*
Higher order functions are functions that:
- take a function as argument
- return a function
- or both
*/

// We've seen the first example many times so far:
[1, 2, 3].forEach(function (number) {
  console.log(number);
});

// What's new are functions that return functions:
function helloFactory() {
  return function () {
    console.log('hello');
  }
}

// We can now immediately invoke it, pass it or assign:
helloFactory()();
helloer = helloFactory();
helloer();


// A higher order function can borth take a function as argument and return a function:
function timed(func) {
  return function() {
    let start = new Date();
    func();
    let stop = new Date();
    console.log((stop - start).toString() + 'ms has elapsed');
  }
}

function loopy() {
  let sum = 0;
  for (let i = 0; i < 1000000000; i += 1) {
    sum += i;
  }
  console.log('sum of every num between 1 and 1000000000 are: ' + sum);
}

let timedLoopy = timed(loopy);
timedLoopy();