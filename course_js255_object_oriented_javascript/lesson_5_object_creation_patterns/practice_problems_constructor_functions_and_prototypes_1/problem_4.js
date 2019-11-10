// What will the following code log out and why?

var ninja;
function Ninja() {
  this.swung = true;
}

ninja = new Ninja();

Ninja.prototype.swingSword = function() {
  return this.swung;
};

console.log(ninja.swingSword());
// This will log 'true'.
// We add the method on the prototype from which our instance "inherits"
// from. So the method is on it's chain of prototypes for resolving properties.
