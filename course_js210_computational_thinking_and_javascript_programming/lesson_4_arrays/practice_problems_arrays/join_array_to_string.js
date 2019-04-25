// Write a function that returns a string of all the values in an array with no intervening content. For example, your function should return '1a4' if the argument is [1, 'a', 4]. Use a for loop to process the array elements in sequence, and coerce each value in the array to a String before concatenating it to the result string.

function arrayToString(arr) {
  let joined = ''
  
  for(i = 0; i < arr.length; i++) {
    joined += String(arr[i]);
  }
  
  return joined;
}

array1 = ['hello', 1, 2, 3, 'help me!'];
array2 = [false, 'yo'];

console.log(arrayToString(array1));
console.log(arrayToString(array2));