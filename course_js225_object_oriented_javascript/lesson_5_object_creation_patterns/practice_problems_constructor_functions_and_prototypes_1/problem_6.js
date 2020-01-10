// Implement the method described in the comments below:

var ninjaA;
var ninjaB;
function Ninja() {
  this.swung = false;
}

Ninja.prototype.swing = function() {
  this.swung = true;
  return this;
};

ninjaA = new Ninja();
ninjaB = new Ninja();

// Add a swing method to the Ninja prototype which
// returns the calling object and modifies swung

console.log(ninjaA.swing().swung);      // must log true
console.log(ninjaB.swing().swung);      // must log true
