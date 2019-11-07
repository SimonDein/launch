/*
 * JavaScript unfortunately uses the term prototype about TWO things:
 * Object prototype - describes the next object in the lookup for property access
 * Function prototype - is a property on a function object. In JS functions has this specielt property 'prototype', that is only used
 * when we use the function as a constructor function (ie. call it with the 'new' operator). The propety 'prototype' on functions is by
 * default assigned the object which the constructor function will delegate to and return.
 * Example:
 */
function ConstrFunc() {};
let obj = ConstrFunc.prototype; // The object that ConstrFunc.protpype is assigned to

let test1 = new ConstrFunc;
let test2 = new ConstrFunc;

console.log(Object.getPrototypeOf(test1) === obj); // true
console.log(Object.getPrototypeOf(test2) === obj); // true

test1.constructor === ConstrFunc // true
test2.constructor === ConstrFunc // true
test1 instanceof ConstrFunc // true
test2 instanceof ConstrFunc // true

// Due to the fact that the prototype of an object, created from a constructor function, is the object assigned to a functions
// 'prototype' property - we can assign properties on the object in the function to be used by all the objects created from it.
// Example:
function Programmer(){};
Programmer.prototype.speak = function() {
  console.log('A bunch of nerdy stuff');
}

Programmer.prototype.write = function() {
  console.log('*Writing code*');
}

let tim = new Programmer();
tim.speak(); // A bunch of nerdy stuff
tim.write(); // *Writing code*

// Note that the methods are not defined on the objects instantiated from the constructor function,
// but are defined on the constructor functions prototye property (Programmer.prototype):
Object.getOwnPropertyNames(tim).forEach((name) => console.log(name)); // nothing

let programmerProtoypeProperty = Programmer.prototype; // proxy variable as we can't access the protoype property directly in an expression
Object.getOwnPropertyNames(programmerProtoypeProperty).forEach((name) => console.log(name)); // constructor speak write - all the methods are defined here

// This approach of defining shared behaviors on the constructors prototype property is called "prototype pattern" of object creation.
