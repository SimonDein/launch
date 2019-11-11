// Create a function that can create an object with a given object as its prototype, without using Object.create.

function createObject(obj) {
  function C() {
  };
  C.prototype = obj;
  return new C;
}

var foo = {
  a: 1
};

var bar = createObject(foo);
console.log(foo.isPrototypeOf(bar));         // true
