// Implement makeListTransformer below such that timesTwo's return value matches the commented return value.

function makeListTransformer(func) {
  // ... implement this function
  return function(numbers) {
    return numbers.map((num) => func(num))
  }
}

var timesTwo = makeListTransformer(function(number) {
  return number * 2;
});

timesTwo([1, 2, 3, 4]); // [2, 4, 6, 8]

