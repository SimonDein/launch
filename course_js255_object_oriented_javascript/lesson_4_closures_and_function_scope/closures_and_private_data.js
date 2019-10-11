// Functions close over or enclose the context at their definition point, so we call them closures.
// They always have access to that context, regardless of when and where the program invokes the function.
// Here's some code that uses a closure to increment and log a number with each call:

function makeCounter() {
  var count = 0;       // declare a new variable
  return function() {
    count += 1;        // references count from the outer scope
    console.log(count);
  };
}

// We can use that closure to create private data
let counter = makeCounter();
counter() // 1
counter() // 2
counter() // 3

// Each closure contains their own count variable created by makeCounter():
let counter2 = makeCounter()
counter2() // 1
counter() // 4 - counter2 doesn't interfere with the counter created earlier



function makeCounterLogger(start) {
  return function(end) {
    for(let i = start; i !== end;) {
      console.log(i);
      i > end ? i -= 1 : i += 1;
    }
    console.log(end);
  }
}

var countlog = makeCounterLogger(5);
countlog(8);
// 5
// 6
// 7
// 8
countlog(2);
// 5
// 4
// 3
// 2