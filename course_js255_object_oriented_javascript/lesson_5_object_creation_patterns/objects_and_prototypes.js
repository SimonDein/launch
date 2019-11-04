/*
 * Every object has a special property '[[prototype]]', which points to the object
 * from which they were created. When an object is created from another object,
 * we say that the object from which it was created is the protoype of the new object:
 */
let protoObj = {
  a: 1,
  b: 2,
};

let createdFromProto = Object.create(protoObj);
Object.getPrototypeOf(createdFromProto) === protoObj // True
protoObj.isPrototypeOf(createdFromProto); // True: protoObj is the prototype from which createdFromProto is made

// We can use Object.create to create a prototype chain

let foo = {
  a: 'hello',
  b: 'yo',
}

let bar = Object.create(foo);
let qux = Object.create(bar);
let baz = Object.create(qux);

Object.getPrototypeOf(bar) === foo; // true
Object.getPrototypeOf(qux) === bar; // true
Object.getPrototypeOf(baz) === qux; // true

foo.isPrototypeOf(baz) // true: foo is on baz's prototype chain

// The Object.prototype object is at the end of the prototype chain for all JS objects.
// If you don't create and object from a prototype, it's prototype is the Object.prototype object.

let myObj = {
  something: 'bla bla',
}

Object.getPrototypeOf(myObj) === Object.prototype // true
