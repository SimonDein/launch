// JS searches the object itself and all it's prototype chain for any properties
let obj1 = {
  a: 1,
  b: 2,
}

let obj2 = Object.create(obj1);
let obj3 = Object.create(obj2);

obj2.a // 1 - it find the property on object 1 - which is in obj2's prototype chain 
obj3.a // 1 - same
obj3.b // 2 - 2, again due to the prototype chain

obj3.c // undefined - Couldn't find prop c anywhere in obj3's prototype chain

// When we call a method on a object, JS will first see if any object in the prototype chain
// has defined it. If so, it'll return it and then call it on object on which we first tried to call it.
// Ie. As if the method was defined on the object itself
// Example:

let foo = {
  hello: function() {
    console.log(`Hello ${this.name}`);
  },
};

let bar = Object.create(foo);
bar.name = 'Sunshine';
bar.hello(); // Hello Sunshine - the method was found on foo and returned and called with 'this' as bar.


// We can overwrite functions on the prototype chain:
let fish = {
  swim: function() {
    console.log('I am swimming');
  }
}

let fastFish = Object.create(fish);
fastFish.swim = function() {
  console.log('I am swimming really faaaast!');
}

fastFish.swim() // I am swimming really faaaast!
fish.swim() // I am swimming

// Because properties are looked up trough the prototypal inheritance chain,
// we can't check if a property is defined on an object simply by obj.someMethod !== undefined.
// We can use Object.prototype.hasOwnProperty to test for that and list any properties defined directly
// on an object with Object.getOwnProperties:

let proto = {
  a: 1,
};

let myObj = Object.create(proto);

myObj.a !== undefined // true - it's 1. That's a problem if you expect it to not have been set.
myObj.hasOwnProperty('a'); // false - nice.

