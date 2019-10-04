// We decide that we want each invocation of foo.incrementA to increment foo.a by 3, rather than 1, and alter our code accordingly:
// Calling apply three times seems repetitive, though. Use bind to permanently set foo as increment's execution context.

var foo = {
  a: 0,
  incrementA: function() {
    let increment = function() {
      this.a += 1;
    }.bind(this);

    increment();
    increment();
    increment();
  }
};

foo.incrementA()
console.log(foo.a)