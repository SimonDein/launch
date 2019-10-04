// What does the following code log to the console?
var a = 1;
var obj = {
  a: 2,
  func: function() {
    console.log(this.a);
  },
};

obj.func();
obj.func.call();
obj.func.call(this);
obj.func(obj);

var obj2 = { a: 3 };
obj.func.call(obj2);

/*
Line 10 => 2
Line 11 => 1 // the context is the global object
Line 12 => 1 // the same 
Line 13 => 2
Line 16 => 3

this will produce different output between different environments.
Node has a module for its global variables.
*/