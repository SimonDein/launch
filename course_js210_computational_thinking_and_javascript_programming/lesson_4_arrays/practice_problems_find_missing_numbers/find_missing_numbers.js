// Write a function that takes a sorted array of integers as an argument, and returns an array that includes all the missing integers (in order) between the first and last elements of the argument.

function missing(arr) {
  let missingNumbers = [];

  for(let i = 0; (i < arr.length - 1); i++) {
    let currentNum = arr[i];
    let nextNum = arr[i + 1];
    
    while(currentNum + 1 !== nextNum) {
      currentNum += 1;
      missingNumbers.push(currentNum);
    }
  }

  return missingNumbers;
}

// Examples:
console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []
