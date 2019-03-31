// Using if / else to return true or false
function removeNonIntegers(arr) {
  return arr.filter(function(value) {
    if (typeof value !== 'number') return false;

    if (value === parseInt(value)) {
      return true;
    } else {
      return false;
    }
  })
}

// Another solution using Number.isInteger()
function removeNonIntegers(arr) {
  return arr.filter(function(value) {
    return Number.isInteger(value);
  });
}

// The previous solution can be written even shorter:
function removeNonIntegers(arr) {
  return arr.filter(Number.isInteger);
}


// Test
let array = [1, 'a', '1', 3, NaN, 3.1415, -4, null, false];

let newArray = removeNonIntegers(array);
console.log(newArray);