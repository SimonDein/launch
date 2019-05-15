// In this exercise, you will implement your own version of the Array.prototype.reverse method. Your implementation should differ from the built-in method in the following two ways:

// It should accept either a string or an array as an argument.
// It should return a new string or array.


function reverseArray(array) {
  let reversedArray = []

  for(let i = array.length - 1; i >= 0; i--) {
    reversedArray.push(array[i]);
  }

  return reversedArray;
}

function reverseString(string) {
  reversedString = '';
  
  for(let i = string.length - 1; i >= 0; i--) {
    reversedString += string[i]
  }

  return reversedString;
}

function reverse(input) {
  let isArray = Array.isArray(input)
  let reversed = isArray ? reverseArray(input) : reverseString(input);

  return reversed;
}

Examples:
console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

var array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]