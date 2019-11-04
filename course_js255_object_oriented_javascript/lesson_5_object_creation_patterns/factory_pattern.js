/*
 * Factory functions (also called "Factory Object Creation Pattern") provides us with a way
 * for creating objects based on a predefined template
 *
 * Disadvantages:
 * Every object created has a full copy of all methods, which can be redundant.
 * There is no way to tell if an object was created from a factory function - makes it difficult to assert
 * whether an object is of a specific "type".
 */

function createDragon(name, color, canFly) {
  return {
    name: name,
    color: color,
    canFly: canFly,

    spitFire: function() {
      console.log('*spits fire*');
    },

    fly: function() {
      if (canFly === false) console.log("can't fly");
      console.log('*Flies*');
    }
  }
}

// Two different objects created from the same factory
dragon1 = createDragon('Smaug', 'brown', true);
dragon2 = createDragon('Bob', 'green', false);
