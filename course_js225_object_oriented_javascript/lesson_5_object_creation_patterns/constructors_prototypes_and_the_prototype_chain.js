// We know that objects created from a constructor function will have their prototype set to the object of the functions property 'prototype'.
// That means that we can assign properties, mainly methods, on the ConstrFuncName.prototype object that instantiated objects will inherit (can call through the prototype chain).

function Animal(type) {
  this.type = type;              // value for this can be land, air, or water
}

Animal.prototype.move = function() {
  console.log('Animal is moving.');
};

function Dog() {};
Dog.prototype = Object.create(Animal.prototype);

Dog.prototype.say = function() {
  console.log(this.name + ' says Woof!');
};

Dog.prototype.run = function() {
  console.log(this.name + ' runs away.');
};

fido = new Dog();
fido.name = 'Fido';

fido.move(); // Animal is moving
fido.say(); // Fido says Woof!
fido.run(); // Fido runs away

// We made the object from Animal.prototype and therefor get -
// the type property defined in the Animal constructor.
// This way we only inherit behavior and not properties defined in the constructor.
console.log(fido.type); // undefined
