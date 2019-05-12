// Write a function that takes two arrays and returns a new array whose even positions come from the first array, and whose odd positions come from the second array. Assume that both arrays have equal length.

function combinedArray(even, odd) {
  let combined = [];

  for(let i = 0; i < even.length; i++) {
    combined.push(even[i]);
    combined.push(odd[i]);
  }

  return combined;
}

var digits = [4, 8, 15, 16, 23, 42];
var letters = ['A', 'L', 'V', 'A', 'R', 'H'];

console.log(combinedArray(digits, letters));  // returns [4, "A", 8, "L", 15, "V", 16, "A", 23, "R", 42, "H"]