// What will the code below output? Explain the difference, if any, between this output and that of problem 1.

var o = {
  func: function() {
    return this;
  },
};

var context = o.func();

console.log(context);

/*
This will output [Object object]
This will refer to the encapsulating object of the method
*/