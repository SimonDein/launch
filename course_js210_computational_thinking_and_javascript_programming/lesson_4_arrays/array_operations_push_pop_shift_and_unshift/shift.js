// Write a function named shift that accepts one argument: an Array.
// The function should remove the first value from the beginning of the Array and return it.

function shift(arr) {
  let first_value = arr[0];
  for(let i = 0; i < (arr.length - 1); i++) {
    arr[i] = arr[i + 1];
  }
  arr.length = arr.length - 1;
  return first_value;
}

arr = [2, 4, 6, 3];

console.log(shift(arr)); // 2
console.log(arr); // [ 4, 6, 3 ]