// In JavaScript, comparing two objects either with == or === checks for object identity. In other words, the comparison evaluates to true if it's the same object on either side of == or ===. This is a limitation, in a sense, because sometimes we need to check if two objects have the same key/value pairs. JavaScript doesn't give us a way to do that.

// Write a function objectsEqual that accepts two object arguments and returns true or false depending on whether the objects have the same key/value pairs.

/*
PEDAC
-------- Problem ------------
Input: two objects
Output: boolean describing if two objects are "equal" according to rules

Rules:
  - Objects are equal if following rules are true for both objects
    - has same number of properties
    - each property has same name AND "same value"

  - same value means:
    - if (Object)
      - if it is a Object object
        - call this function on both
      - else
        - obj.contructor.name === otherObj.constructor.name
      - Object has the same
    - if (number (other than NaN), string, boolean, undefined or null)
      - val === otherVal

Algorithm
  - If any passed argument is not an object (check constructor)
    - return false
  - If both objects don't have the same number of properties
    - return false

  return true;
*/
const PRIMITIVES = ['number', 'string', 'boolean', 'undefined', 'null', 'symbol'];

function notObject(value) {
  return typeof value !== 'object';
}

function isPrimitive(value) {
  return PRIMITIVES.includes(typeof value);
}

function isFunction(value) {
  return typeof value === 'function';
}

function objectsEqual(obj1, obj2) {
  if (notObject(obj1) || notObject(obj2)) return false;

  let obj1Keys = Object.keys(obj1).sort();
  let obj2Keys = Object.keys(obj2).sort();

  function keysEqual() {
    return obj1Keys.every((key, idx) => key === obj2Keys[idx]);
  };

  function valuesEqual() {
    return obj1Keys.every(function (key, idx) {
      let val1 = obj1[key];
      let val2 = obj2[key];

      if (typeof val1 !== typeof val2) return false;
      if (isPrimitive(val1) || isFunction(val1)) return String(val1) === String(val2);
      if (val1.constructor.name === 'Object' || val1.constructor.name === 'Array') return objectsEqual(val1, val2);
      
      return JSON.stringify(val1) === JSON.stringify(val2);
    });
  }
  
  return keysEqual() && valuesEqual();
}


// ------------- Tests ------------------------------------------------------------------
console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', b: 1}));  // false
console.log(objectsEqual({a: 'foo', b: undefined}, 'hello'));  // false
console.log(objectsEqual({a: 'foo', b: undefined}, 2));  // false
console.log(objectsEqual({a: 'foo'}, {a: 'fo'})); // false
console.log(objectsEqual({a: NaN}, {a: NaN})); // true
console.log(objectsEqual({a: [1, 2], b: 4}, {b: 4, a: [1, 2]})); // true

let bigObject1 = {
  a: 1,
  b: 'hello',
  c: true,
  d: undefined,
  e: NaN,
  f: [7, false],
  g: {
    numbers: [1, 2, 3, 4],
    count: 4
  },
  h: function(x) {
    return x;
  },
};

let bigObject2 = {
  a: 1,
  b: 'hello',
  c: true,
  d: undefined,
  e: NaN,
  f: [7, false],
  g: {
    numbers: [1, 2, 3, 4],
    count: 4
  },
  h: function(x) {
    return x;
  },
};
console.log(objectsEqual(bigObject1, bigObject2)); // true;

let bigObjectAlt1 = {
  a: 1,
  b: 'hello',
  c: true,
  d: undefined,
  e: NaN,
  f: [7, false],
  g: {
    numbers: [1, 2, 3, 7],
    count: 4
  },
  h: function(x) {
    return x;
  },
};

let bigObjectAlt2 = {
  a: 1,
  b: 'hello',
  c: true,
  d: undefined,
  e: NaN,
  f: [7, false],
  g: {
    numbers: [1, 2, 3, 4],
    count: 4
  },
  h: function(x) {
    return x;
  },
};
console.log(objectsEqual(bigObjectAlt1, bigObjectAlt2)); // false;

let today = new Date();
let aLongTimeAgo = new Date('1981');
console.log(objectsEqual({a: today}, {a: aLongTimeAgo})); // false

let seventies1 = new Date('1970');
let seventies2 = new Date('1970');
console.log(objectsEqual({a: seventies1}, {a: seventies2})); // true