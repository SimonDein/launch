// Write a Function named myForEach that is similar to the built-in Array.prototype.forEach method. Your Function should take an array and another Function as arguments. The Function passed to myForEach should mutate a variable in the outer scope. In the code fragment below, the Function passed to myForEach mutates the min variable.

function myForEach(array, callback) {
  for(let i = 0; i < array.length; i += 1) {
    callback(array[i], i, array);
  }
}

let min = Infinity;

let getMin = function (number) {
  min = number <= min ? number : min;
}

myForEach([6, 7, 3, 2, 8], getMin);
console.log(min);