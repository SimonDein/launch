// In the previous exercise, we developed a recursive solution for computing the nth Fibonacci number. In a language that is not optimized for recursion, some (but not all) recursive functions can be extremely slow and may require massive quantities of memory and/or stack space. If you tested for bigger nth numbers, you might have noticed that getting the 50th fibonacci number already takes a significant amount of time.

// Fortunately, every recursive function can be rewritten as a non-recursive (or procedural) function.

// Rewrite your recursive fibonacci function so that it computes its results without using recursion.


// solution 1
function fibonacci(nth) {
  if (nth <= 2) return 1;
  let fib1 = 1, fib2 = 1;
  let temp;
  for (let i = 3; i < nth; i += 1) {
    temp = fib1;
    fib1 = fib1 + fib2;
    fib2 = temp;
  }
  return fib1 + fib2;
}

//solution 2
function fibonacci(nth) {
  previousTwo = [1, 1];

  for(let i = 3; i <= nth; i += 1) {
    previousTwo = [previousTwo[0] + previousTwo[1], previousTwo[0]];
  }
  return previousTwo[0]
}


console.log(fibonacci(20));       // 6765
console.log(fibonacci(50));       // 12586269025
console.log(fibonacci(75));       // 2111485077978050