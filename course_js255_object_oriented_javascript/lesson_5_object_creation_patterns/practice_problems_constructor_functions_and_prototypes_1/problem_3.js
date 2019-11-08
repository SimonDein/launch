// Write a constructor function Circle, that takes a radius as an argument.
// You should be able to call an area method on the created objects to get the circle's area. Test your implementation with the following code:

// Solution 1 - downside is that every instance will have a full copy of the metodsi
function Circle(radius) {
  this.area = function() {
    return Math.PI * (radius ** 2);
  };
};

// Solution 2 - now the prototype object "owns" the method and any instances can delegate to this object
function Circle(radius) {
  this.radius = radius;
}
Circle.prototype.area = function() {
  return Math.PI * (this.radius ** 2);
}


var a = new Circle(3);
var b = new Circle(4);

console.log(a.area().toFixed(2)); // => 28.27
console.log(b.area().toFixed(2)); // => 50.27


