// Consider the code below:
// What will the value of foo.a be after this code has executed?

var foo = {
  a: 0,
  incrementA: function() {
    function increment() {
      this.a += 1;
    }

    increment();
  }
};

foo.incrementA();
foo.incrementA();
foo.incrementA();

console.log(a);

/*
foo.a will be 0 when the scripts has executed. Function's implicit context are the global object.
But we now have a global variable named a of the value NaN.
*/