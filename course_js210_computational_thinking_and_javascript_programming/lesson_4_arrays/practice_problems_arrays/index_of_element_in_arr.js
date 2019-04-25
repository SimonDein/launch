// Create a function that finds the first instance of a value in an array and returns the index position of the value, or -1 if the value is not in the array. The function should take two arguments: the value to search for, and the array to search. Use the break keyword to exit the loop immediately when you find the first instance of the value. If you don't find the value, make sure you don't use the final index value as your return value.

function indexOf(arr, elem) {
  matchIndex = -1
  for(i = 0; i < arr.length; i += 1) {
    if (arr[i] === elem) {
      matchIndex = i;
      break;
    }
  }
  return matchIndex;
}

myArr = [1, 'dog', false, 'Blue'];
console.log(indexOf(myArr, false)); // 3
console.log(indexOf(myArr, 'Blue')); // 2
console.log(indexOf(myArr, 42)); // -1