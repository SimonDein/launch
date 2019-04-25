// Write a function named unshift that accepts two arguments: an Array and a value. The function should insert the value at the beginning of the Array, and return the new length of the array. You will need a for loop for this problem.

function unshift(array, object) {
  for(i = array.length; i > 0; i--) {
    array[i] = array[i - 1];
  }
  array[0] = object;
  return array.length;
}

var count = [1, 2, 3];
console.log(unshift(count, 0));      // 4
console.log(count);                  // [ 0, 1, 2, 3 ]