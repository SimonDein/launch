// What does the following code log to the console?
var foo = {
  a: 1,
  bar: function() {
    console.log(this.baz());
  },

  baz: function() {
    return this;
  },
};

foo.bar();
var qux = foo.bar;
qux();

/*
Line 13 will log the obj foo.
Line 15 will return a TypeError - baz is not a function in the scope of bar function when -
assigned to the global variable qux.
*/