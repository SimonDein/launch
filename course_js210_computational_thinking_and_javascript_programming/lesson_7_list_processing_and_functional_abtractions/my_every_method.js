// Array.prototype.some and Array.prototype.every each take a single argument, which should be a Function. Both methods invoke the callback function once for each element in the Array, passing three arguments to the function each time:

// The value of the current element in the Array
// The index of the current element
// The Array being processed
// The every method iterates over all the elements in the array until the callback function returns a falsy value; every immediately returns false when this happens. If no elements produce a falsy result, then every returns true.

// The some method iterates over all the elements in the array until the callback function returns a truthy value; some immediately returns true when this happens. If no elements have a truthy result, then some returns false.

// Array.prototype.some returns true if the callback returns a truthy value for at least one of the elements in the original Array.

// Array.prototype.every returns true if the callback returns a truthy value for all of the elements in the original Array.

function myEvery(array, func) {
  for (let i = 0; i < array.length; i += 1) {
    if (!func(array[i], i, array)) return false;
  }

  return true;
}

var isAString = function (value) {
  return typeof value === 'string';
};

console.log(myEvery(['a', 'a234', '1abc'], isAString));       // true


// Let's write a program that checks whether all elements of an array are Numbers.

function areAllNumbers(array) {
  return myEvery(array, isANumber);
}

var isANumber = function (value) {
  return typeof value === 'number' && !Number.isNaN(value);
};

console.log(areAllNumbers([1, 5, 6, 7, '1']));             // false
console.log(areAllNumbers([1, 5, 6, 7, 1]));               // true
console.log(areAllNumbers([1, 5, 6, 7, NaN]));             // false