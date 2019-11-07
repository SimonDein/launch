function Animal() {};

Animal.prototype.move = function() {
  console.log('Animal is moving');
}

function Dog() {};

Dog.prototype.bark = function() {
  console.log('Woof woof');
}

Dog.prototype = Object.create(Animal.prototype);

