// The productOfSums function shown below is expected to return the product of the sums of two arrays of numbers. Read through the following code. Will it produce the expected result? Why or why not?

function productOfSums(array1, array2) {
  var result;
  result = total(array1) * total(array2);
  return result;
}

function total(numbers) {
  var sum;
  var i;

  for (i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];
  }

  sum;
}

/*

No - there is no return statement.

Also total() has not assigned a value to sum and sum will be undefined. We will then add a number to undefined resulting in NaN.
NaN.


*/