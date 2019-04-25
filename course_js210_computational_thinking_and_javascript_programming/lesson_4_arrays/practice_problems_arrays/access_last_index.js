// With arrays, you can access the first element's value with [0], but how do you access the last value? Write a function named lastInArray that returns the value of the last element in the array provided by the function's argument. You may use the length property and the [] operator, but do not use any other methods or properties.

function lastInArray(array) {
  return array[array.length - 1];
}

let myArray = [1, 2, 3];
console.log(lastInArray(myArray)); // 3
