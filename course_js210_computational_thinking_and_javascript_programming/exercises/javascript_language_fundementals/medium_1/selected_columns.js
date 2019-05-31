// The getSelectedColumns function selects and extracts specific columns to a new array. Currently, the function is not producing the expected result. Go over the function and the sample runs shown below. What do you think the problem is?

function getSelectedColumns(numbers, cols) {
  var result = [];

  for (var i = 0, length = numbers.length; i < length; i += 1) {
    for (var j = 0, length = cols.length; j < length; j += 1) {
      if (!result[j]) {
        result[j] = [];
      }

      result[j][i] = numbers[i][cols[j]];
    }
  }

  return result;
}

// given the following arrays of number arrays
var array1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
var array2 = [[1, 2, 3], [1, 2, 3], [1, 2, 3]];

// `array1` in row/column format
// [[1, 2, 3],
//  [4, 5, 6],
//  [7, 8, 9]]

console.log(getSelectedColumns(array1, [0]));     // [[1]]            expected: [[1, 4, 7]]
console.log(getSelectedColumns(array1, [0, 2]));  // [[1, 4], [3, 6]] expected: [[1, 4, 7], [3, 6, 9]]
console.log(getSelectedColumns(array2, [1, 2]));  // [[2, 2], [3, 3]] expected: [[2, 2, 2], [3, 3, 3]]

/*

The trouble probably arises from the length variable defined in both for loops.
The second variable reassigns the first to be the length of the cols array. That means
that the first loop now depends on the number of columns we want to extract instead of the number of 
rows in numbers array.

If we change both variable types to be a let variable that is block scoped instead of a var that is
scoped at the function level we would not run into the variable shadowing / reassingment.
Instead we could just remove the initialization of a length variable and just use the length properties
directly in the break condition.

*/