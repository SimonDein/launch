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
