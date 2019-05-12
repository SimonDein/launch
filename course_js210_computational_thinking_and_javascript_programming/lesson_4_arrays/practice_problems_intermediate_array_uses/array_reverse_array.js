// Write a function that takes an array argument and returns a new array that contains all the argument's elements in their original order followed by all the argument's elements in reverse order.

function arrayAndReverse (arr) {
  result = [];
  
  for(let i = 0; i < arr.length; i++) {
    result.push(arr[i]);
  }

  for(let i = arr.length - 1; i > 0; i--) {
    result.push(arr[i]);
  }
  
  return result;
}

console.log(arrayAndReverse([1, 2, 3, 4])) // [1, 2, 3, 4 , 4 , 3 , 2, 1]