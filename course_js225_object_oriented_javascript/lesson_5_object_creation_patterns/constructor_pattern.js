i// It's convention to capitalize the name of the constructor function
// A constructor function is just a function intended to be called with the 'new' operator
function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.fullName = function () {
    return `${firstName} ${lastName}`;
  };
}

peter = new Person('Peter', 'Pedal');
abbadon = new Person('Abbadon', 'Johnson');

peter.constructor; // [Function: Person]
abbadon.constructor; // [Function: Person]

peter instanceof Person // True
abbadon instanceof Person // True

// Capitalizing the name of a constructor function makes it clear what the function is intended for

// What will the code below output? Why?
function Lizard() {
  this.scamper = function() {
    console.log("I'm scampering!");
  };
}

var lizzy = Lizard();
lizzy.scamper(); // ?
// This throw a TypeError as scamper is a property created on the global object,
// and as there was no explicit return - undefined is returned. That means that
// we're trying to call scamper on undefined.
// The 'this' value of functions (not methods) are implicitly the global object,
// and now scamper() is defined on the GO.


// Let's change it to get the desired effect:
function Lizard() {
  this.scamper = function () {
    console.log("I'm scampering!");
  };
}
let lizard = new Lizard();
lizard.scamper();
