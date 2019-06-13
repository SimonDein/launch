// Write a function that's similar to Array.prototype.filter. It takes an array and a function as arguments, and returns an array whose values are only those that the function passed returns as true.

function myFilter(array, callback) {
  let filtered = [];
  array.forEach(function (value, index, array) {
    if (callback(value, index, array)) {
      filtered.push(value);
    }
  });
  
  return filtered;
}

let numbers = [1, 2, 3, 4, 5, 6, 7, 8];

let oddNumber = function (number) {
  return number % 2 === 1;
}

console.log(myFilter(numbers, oddNumber));