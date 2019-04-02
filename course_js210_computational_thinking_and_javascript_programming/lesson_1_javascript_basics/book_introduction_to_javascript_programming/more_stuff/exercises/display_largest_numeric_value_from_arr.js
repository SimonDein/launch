// Given a list of numbers, write some code to find and display the largest numeric value in the list.
function findMax(arr) {
  return arr.reduce(function(max, number) {
    if (number > max) {
      return number;
    } else {
      return max;
    }
  });
}


console.log(findMax([1, 6, 3, 2])) // =>	6
console.log(findMax([-1, -6, -3, -2])) // => -1
console.log(findMax([2, 2])) // =>	2
