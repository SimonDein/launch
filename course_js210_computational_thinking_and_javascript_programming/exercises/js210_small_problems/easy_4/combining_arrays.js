// Write a function that takes two arrays as arguments, and returns an array containing the union of the values from the two. There should be no duplication of values in the returned array, even if there are duplicates in the original arrays. You may assume that both arguments will always be arrays.

/*
- concat arrays
- select any value so it only appears once in new array
*/


function isUnique(element, index, array) {
  return array.indexOf(element) === index;
}

function concatUniqe(arr1, arr2) {
  return arr1.concat(arr2).filter(isUnique)
}

console.log(concatUniqe([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9]
