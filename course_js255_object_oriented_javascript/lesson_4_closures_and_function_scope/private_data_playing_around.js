
function makeFarm() {
  animals = [];
  return {
    buyCow: function() {
      animals.push('cow');
      console.log('You bought a cow!');
    },

    displayAnimals() {
      console.log(animals);
    },
  };
}

let farm = makeFarm();
farm.buyCow(); // You bought a cow!
farm.buyCow(); // You bought a cow!
farm.displayAnimals(); // ['cow', 'cow']
console.log(farm.animals) // undefined




