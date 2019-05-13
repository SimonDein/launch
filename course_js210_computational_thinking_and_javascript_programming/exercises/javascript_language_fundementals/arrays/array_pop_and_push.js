// In this exercise, you will implement your own version of two Array methods: Array.prototype.pop and Array.prototype.push. The pop method removes the last element from an array and returns that element. If pop is called on an empty array, it returns undefined. The push method, on the other hand, adds one or more elements to the end of an array and returns the new length of the array.

// Examples:

// pop
function pop(arr) {
  if (arr.length <= 0) return undefined;
  
  lastElement = arr[arr.length - 1];
  arr.length -= 1;

  return lastElement;
}

var array = [1, 2, 3];
pop(array);                        // 3
console.log(array);                // [1, 2]
pop([]);                           // undefined
pop([1, 2, ['a', 'b', 'c']]);      // ["a", "b", "c"]

function push(arr) {
  for(i = 1; i < arguments.length; i++) {
    arr[arr.length] = arguments[i];
  }

  return arr.length;
}
// push
var array = [1, 2, 3];
console.log(push(array, 4, 5, 6));              // 6
console.log(array);                // [1, 2, 3, 4, 5, 6]
push([1, 2], ['a', 'b']);          // 3
push([], 1);                       // 1
push([]);                          // 0