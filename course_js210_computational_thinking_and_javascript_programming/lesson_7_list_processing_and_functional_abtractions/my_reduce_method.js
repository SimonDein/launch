// The reduce method takes a required first argument, which should be a Function: reduce invokes this callback Function once for each element in the Array. It passes four arguments to the callback Function on each call:

// accumulator: The return value of the previous callback invocation (this is the initial value on the first iteration)
// currentValue: The value of the current element in the Array
// currentIndex: The index of the current element
// array: The array being processed
// reduce passes the accumulator to the next callback invocation, and uses the return value of the final callback invocation as the overall return value of reduce.

// reduce accepts an optional second argument, the initialValue. It provides the value to use as the first argument in the first call to the callback. If the caller does not provide the initialValue, reduce uses the first element of the array; when this happens, reduce starts processing with the second element of the Array.

// reduce returns the value returned by the final callback invocation.

// Write a function named myReduce that's similar to the Array.prototype.reduce method. It takes an array and a function as arguments, and optionally, a third argument that serves as an initial value. If the caller omits the initial value, myReduce should use the first element of the Array as the initial value. myReduce should return the value returned by the last invocation of the callback function.

function myReduce(array, func, initial) {
  let accumulator = initial || 0;
  let startIndex = 0;
  let i = 0;

  if (!initial) {
    accumulator = array[0];
    startIndex = 1;
  }

  array.slice(startIndex).forEach(function (value, index) {
    accumulator = func(accumulator, value, index, array);
  })

  return accumulator;
}

var smallest = function (result, value) {
  return result <= value ? result : value;
};

var sum = function (result, value) {
  return result + value;
};

console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49



// Let's implement a function that takes a list of words as an argument and returns the word with the most characters:

function longestWord(words) {
  return myReduce(words, longest);
}

var longest = function (result, currentWord) {
  return currentWord.length >= result.length ? currentWord : result;
};

console.log(longestWord(['abc', 'launch', 'targets', '']));      // "targets"