// Write a function that rotates an array by moving the first element to the end of the array. Do not modify the original array.

// If the input is not an array, return undefined.
// If the input is an empty array, return an empty array.

// Review the test cases below, then implement the solution accordingly.

/*
Input: array
Output: array rotated

Algorithm
  - if input NOT array
    - return undefined
  - if input array is empty
    - return empty array

  - Rotate array
    - first item = arr.unshift()
    - arr[length] = first item

  - return array
*/

function notArray(obj) {
  return !Array.isArray(obj)
}

function rotateArray(array) {
  if (notArray(array)) return undefined;
  if (array.length === 0) return [];
  
  let arrayRotated = array.slice(1).concat(array[0]);
  return arrayRotated;
}







console.log(rotateArray([7, 3, 5, 2, 9, 1]));       // [3, 5, 2, 9, 1, 7]
console.log(rotateArray(['a', 'b', 'c']));          // ["b", "c", "a"]
console.log(rotateArray(['a']));                    // ["a"]
console.log(rotateArray([1, 'a', 3, 'c']));         // ["a", 3, "c", 1]
console.log(rotateArray([{ a: 2 }, [1, 2], 3]));    // [[1, 2], 3, { a: 2 }]
console.log(rotateArray([]));                       // []

// return `undefined` if the argument is not an array
console.log(rotateArray());                         // undefined
console.log(rotateArray(1));                        // undefined


// the input array is not mutated
var array = [1, 2, 3, 4];
console.log(rotateArray(array));                    // [2, 3, 4, 1]
console.log(array);                                 // [1, 2, 3, 4]