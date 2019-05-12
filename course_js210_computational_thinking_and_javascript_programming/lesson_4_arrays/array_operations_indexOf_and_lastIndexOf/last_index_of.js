// Write a function lastIndexOf that accepts two arguments: an array and a value. The function returns the last index at which the value can be found in the array, or -1 if the value is not present.

function lastIndexOf(arr, obj) {
  let lastIndex = arr.length - 1;
  
  for(let i = lastIndex; i >= 0; i--) {
    if (arr[i] === obj) {
      return i;
    }
  }
  
  return -1;
}



console.log(lastIndexOf([1, 2, 3, 3], 3));     // 3
console.log(lastIndexOf([1, 2, 3], 4));     // -1