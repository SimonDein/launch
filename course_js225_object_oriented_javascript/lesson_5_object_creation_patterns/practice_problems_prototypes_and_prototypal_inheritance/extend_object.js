// Write a function that extends an object (destination object) with contents from multiple objects (source objects).

function extend(destination, ...sources) {
  // iterate each source object
  sources.forEach((src) =>
    // for each property defined directly on current object
    Object.getOwnPropertyNames(src).forEach((prop) =>
      // assign prop to destination object
      destination[prop] = src[prop]
    )
  );

  // return new object with properties of every passed source object propagated to this new object
  return destination;
}

var foo = {
  a: 0,
  b: {
    x: 1,
    y: 2,
  },
};

var joe = {
  name: 'Joe'
};

var funcs = {
  sayHello: function() {
    console.log('Hello, ' + this.name);
  },

  sayGoodBye: function() {
    console.log('Goodbye, ' + this.name);
  },
};

var object = extend({}, foo, joe, funcs);

console.log(object.b.x);          // => 1
object.sayHello();                // => Hello, Joe
