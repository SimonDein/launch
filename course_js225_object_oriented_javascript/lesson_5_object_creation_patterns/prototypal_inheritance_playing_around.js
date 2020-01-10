let dog = {
  bark: function() {
    console.log(`${this.name} is barking`);
  },

  run: function() {
    console.log(`${this.name} is barking`);
  },
}

let fido = Object.create(dog);
fido.name = 'Fido';
fido.run();
fido.bark();

let plet = Object.create(dog);
plet.name = 'Plet';
plet.run();
plet.bark();
