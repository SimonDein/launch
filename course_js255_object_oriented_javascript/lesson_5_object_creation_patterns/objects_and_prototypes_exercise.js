// Use the method we learned above to assign foo below to a new Object with prot as its prototype.

var prot = {};

var foo = Object.create(prot);
// Use getPrototypeOf to demonstrate the prototypal relationship between prot and foo.
Object.getPrototypeOf(foo) === prot; // true;

// Use isPrototypeOf to demonstrate the prototypal relationship between prot and foo.
prot.isPrototypeOf(foo); // true

// What will the last two lines of the code below return? Why?
var prot = {};

var foo = Object.create(prot);

prot.isPrototypeOf(foo); // True: foo was created from the prototype 'prot'
Object.prototype.isPrototypeOf(foo); // true: Object.prototype is on the prototype chain of all objects (unless explictly changed)
