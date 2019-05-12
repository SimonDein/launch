// Write a function named concat that accepts two Array arguments. The function should return a new Array that contains the values from each of the original Arrays.

// You may use functions that were answers to previous practice problems to complete this problem, but do not use any built-in Array methods.

function push(arr, obj) {
  arr[arr.length] = obj;
  return arr.length;
}

function pushArray(reciever, array) {
  for(i = 0; i < array.length; i++) {
    push(reciever, array[i]);
  };
}

function concat(array1, array2) {
  let concatenated = [];

  pushArray(concatenated, array1);
  pushArray(concatenated, array2);

  return concatenated;
} 



console.log(concat([1, 2, 3], [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]