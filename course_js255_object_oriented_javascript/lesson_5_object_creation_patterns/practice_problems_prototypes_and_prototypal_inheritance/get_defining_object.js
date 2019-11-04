//Write a function that returns the object on a given object's prototype chain where a property is defined. See the example code below:

// non-recursive
function getDefiningObject(object, propKey) {
  let currentObject = object;
  for(;;) {
    if (currentObject.hasOwnProperty(propKey)) return currentObject;
    if (currentObject === Object.prototype) return null;
      currentObject = Object.getPrototypeOf(currentObject);
  }
}

// recursive
function getDefiningObject(obj, prop) {
  if (obj === Object.prototype) return null;
  if (obj.hasOwnProperty(prop)) return obj;
  return getDefiningObject(Object.getPrototypeOf(obj), prop);
};

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
var baz = Object.create(bar);
var qux = Object.create(baz);

bar.c = 3;

console.log(getDefiningObject(qux, 'c') === bar);     // => true
console.log(getDefiningObject(qux, 'e'));             // => null
