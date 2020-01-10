
// //================== Implicit execution context ==================

// // The implicit bound function execution context is the calling object:
// function foo() {
//   console.log(`This here is: ${this}`);
// }

// foo() // This here is: [object global]; - foo a property on the global object

// // The execution context is bound on the invocation:
// var object = {
//   foo: function () {
//     console.log('this here is: ' + this);
//   },
// };

// object.foo();              // "this here is: [object Object]" - the context is our object

// var bar = object.foo;
// bar();                     // "this here is: [object Global]" - the context is the global object (or Window in the browser)


// // Again the context is bound on the invocation
// // Even though bar starts it's life as a function on the foo object, once it's reassigned on line 29 - it's now a
// // function on the global object. 
// var foo = {
//   bar: function () {
//     return this;
//   },
// };

// var baz = foo.bar;

// // baz() === foo;    // false
// // baz() === window; // true



//================== Explicit execution context ==================
var a = 1;

var object = {
  a: 'hello',
  b: 'world',
};

function foo() {
  return this.a;
}

console.log(foo());                  // 1 (context is global object)
foo.call(object);       // "hello" (context is object)