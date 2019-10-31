// For an extra challenge, refactor the solution to problem 4 using recursion, bearing in mind that a named function created in an IIFE can be referenced inside of the IIFE.

function countDown(start) {
  (function recursiveSubtract(n) {
    let accountNumber = 2;
    console.log(n);
    if (n <= 0) console.log('Done!');
    else recursiveSubtract(n - 1);
  })(start);
}

countDown(7);
