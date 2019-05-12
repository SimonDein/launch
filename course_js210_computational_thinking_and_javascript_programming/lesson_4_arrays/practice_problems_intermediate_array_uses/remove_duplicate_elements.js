// Write a function that takes an array, and returns a new array with duplicate elements removed.

function uniqueElements(arr) {
  let uniqueElements = [];
  
  for(let i = 0; i < arr.length; i++) {
    if (!uniqueElements.includes(arr[i])) {
      uniqueElements.push(arr[i])
    }
  }

  return uniqueElements;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));  // returns [1, 2, 4, 3, 5]