// In the following example we have no control of:
// How to iterate through the array
// What to do with each element

// We have control over:
// Which array to iterate over

function iterate(array) {
  for(let i = 0; i < array.length; i += 1) {
    console.log(array[i]);
  }
}

let numbers = [1, 4, 7, 23, 6, 2];

iterate(numbers);


// In the next example we now only have no control of:
// How to iterate through the array

// However, we now have control over:
// What to do with each element
// Which array to iterate over

function iterate(array, callback) {
  for(let i = 0; i < array.length; i += 1) {
    callback(array[i]);
  }
}

function logger(value) {
  console.log(value);
}

let numbers = [1, 4, 7, 23, 6, 2];

iterate(numbers, logger);