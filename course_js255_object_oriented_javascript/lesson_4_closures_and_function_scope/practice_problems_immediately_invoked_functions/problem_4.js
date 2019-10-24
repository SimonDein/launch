// Consider the output below:

// countdown(7);
// 7
// 6
// 5
// 4
// 3
// 2
// 1
// 0
// Done!
// Implement a function countdown that uses an IIFE to generate the desired output.

function countdown(start) {
  (function (n) {
    for(let i = n; i >= 0; i -= 1 ) {
      console.log(i);
    }
    console.log('Done!');
  })(start);
}

countdown(7);
