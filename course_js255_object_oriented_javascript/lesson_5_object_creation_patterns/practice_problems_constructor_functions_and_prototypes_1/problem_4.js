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
// This will throw a TypeError.
// This is because when we created the instance from the Ninja constructor class the method swingSword was not defined on it's prototype.
// We reassign the Ninja.prototype object after the creation, and the prototype of ninja is now different from the prototype defined in Ninja.prototype.
