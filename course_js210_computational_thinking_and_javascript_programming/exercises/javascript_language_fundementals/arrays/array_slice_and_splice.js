// In this exercise, you will implement your own versions of the Array.prototype.slice and Array.prototype.splice methods according to the following specifications.

// The slice function takes three arguments: an array, and two integers representing a begin and an end index. The function returns a new array containing the extracted elements starting from begin up to but not including end. slice does not mutate the original array.

// The splice function changes the contents of an array by deleting existing elements and/or adding new elements. The function takes the following arguments: an array, a start index, a deleteCount, and zero or more elements to be added. The function removes deleteCount number of elements from the array, beginning at the start index. If any optional element arguments are provided, splice inserts them into the array beginning at the start index. The function returns a new array containing the deleted elements, or an empty array ([]) if no elements are deleted. splice mutates the original array.

// Additional specifications:

// slice:

// The values of begin and end will always be integers greater than or equal to 0.
// If the value of begin or end is greater than the length of the array, set it to equal the length.
// splice:

// The values of start and deleteCount will always be integers greater than or equal to 0.
// If the value of start is greater than the length of the array, set it to equal the length.
// If the value of deleteCount is greater than the number of elements from start up to the end of the array, set deleteCount to the difference between the array's length and start.
// Takes optional arguments for elements to add to the array; denoted by the parameters element1 up to elementN. If no elements to add are provided, splice only removes elements from the array.

// function slice(array, begin, end) {
//   if(end > array.length) {
//     end = array.length;
//   }
  
//   let slice = []

//   for(i = begin; i < end; i++) {
//     slice.push(array[i]);
//   }

//   return slice;
// }


// // Examples:
// console.log(slice([1, 2, 3], 1, 2));               // [2]
// console.log(slice([1, 2, 3], 2, 0));               // []
// console.log(slice([1, 2, 3], 5, 1));               // []
// console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]

// var arr = [1, 2, 3];
// console.log(slice(arr, 1, 3));                     // [2, 3]
// console.log(arr);                                  // [1, 2, 3]










function splice(array, start, removeCount, element1, elementN) {
  (start + removeCount > array.length) ? removeCount -= removeCount + start - array.length : undefined;
  
  let removedElements = [];
  let insertCount = arguments.length - 3;
  let endOfArrayCopy = array.slice((start + removeCount))
  let currentArgumentsIndex = 3;

  for(let i = start; i < (start + removeCount); i++) {
    removedElements.push(array[i]);
  }

  for(let i = start; i < start + arguments.length - 3; i++) {
    array[i] = arguments[currentArgumentsIndex];
    currentArgumentsIndex += 1;
  }

  for(let i = start + insertCount; endOfArrayCopy.length; i++) {
    array[i] = endOfArrayCopy.shift();
  }

  return removedElements;
}

console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
console.log(splice([1, 2, 3], 1, 0));              // []
console.log(splice([1, 2, 3], 0, 1));              // [1]
console.log(splice([1, 2, 3], 1, 0, 'a'));         // []

var arr = [1, 2, 3];
console.log(splice(arr, 1, 1, 'two'));             // [2]
console.log(arr);                                  // [1, "two", 3]

var arr = [1, 2, 3];
console.log(splice(arr, 1, 2, 'two', 'three'));    // [2, 3]
console.log(arr);                                  // [1, "two", "three"]

var arr = [1, 2, 3];
console.log(splice(arr, 1, 0));                    // []
console.log(splice(arr, 1, 0, 'a'));               // []
console.log(arr);                                  // [1, "a", 2, 3]

var arr = [1, 2, 3];
console.log(splice(arr, 0, 0, 'a'));               // []
console.log(arr);                                  // ["a", 1, 2, 3]