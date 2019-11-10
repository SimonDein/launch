// In this problem, we'll ask you to create a new instance of an object, without having direct access to the constructor function:

var ninjaA = (function() {
  function Ninja(){};
  return new Ninja();
})();

// create a ninjaB object
let ninjaB = new ninjaA.constructor;

console.log(ninjaB.constructor === ninjaA.constructor);    // should log true

// We can access the constructor of an instance by accessing its constructor property.
// That constructor property "lives on" the constructor functions prototype property.
// In this example that means that we call get access to the constructor of ninjaA by Ninja.protoype.constructor through ninjaA's prototype chain.
