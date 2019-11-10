// What will the following code log out and why?

var ninja;
function Ninja() {
  this.swung = true;
}

ninja = new Ninja();

Ninja.prototype = {
  swingSword: function() {
    return this.swung;
  },
};

console.log(ninja.swingSword());
// This will throw a TypeError as Ninja.prototype.swingSword is not available
// Ninja.prototype is reassigned to a different object than the object ninja was made from on line 8,
// so when we call the method on our ninja instance, JS can't find it on it's chain of prototypes.
//
//
