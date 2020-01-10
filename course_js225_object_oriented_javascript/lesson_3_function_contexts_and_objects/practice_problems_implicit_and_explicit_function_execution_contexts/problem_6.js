// In the code below, use call to invoke add as a method on bar but with foo as execution context. What will this return?

var foo = {
  a: 1,
  b: 2,
};

var bar = {
   a: 'abc',
   b: 'def',
   add: function() {
     return this.a + this.b;
   },
};

bar.add.call(foo); // 3
// We're the add() method on bar and calling it on foo as if it was defined on foo