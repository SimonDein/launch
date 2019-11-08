// What does the following code log to the console?

var RECTANGLE = {
  area: function() {
    return this.width * this.height;
  },
  perimeter: function() {
    return 2 * (this.width + this.height);
  },
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area();
  this.perimeter = RECTANGLE.perimeter();
}

// We create a new object, and set the width and height properties to 2 and 3.
// Then on line 15 we set the area to the return value of calling the area method on the object assigned to RECTANGLE.
// The area function on line 4 i executed and returns this.width * this.height of that object, which is undefined and undefined.
// undefined * undefined evalutates to NaN. So area is now set to NaN in the rect1 object.
//
// Next we set perimeter which multiplies NaN by 2 which also evaluates to NaN.
var rect1 = new Rectangle(2, 3);
console.log(rect1.area); // We print out NaN
console.log(rect1.perimeter); // And NaN again

// Extra: How do you fix this problem?

// We can use Function.prototype.call to call the methods on the Rectangle object instead:
function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area.call(this);
  this.perimeter = RECTANGLE.perimeter.call(this);
}
