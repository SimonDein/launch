// #1 solution
function oddLengths(arr) {
  let elemLengths = arr.map(elem => elem.length);
  return elemLengths.filter(elem => elem % 2 !== 0);
}

// #2 solution
function oddLengths(arr) {
  return arr.map(string => string.length).filter(length => length % 2 !== 0);
}



// Test
let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];
console.log(oddLengths(arr)); // => [1, 5, 3]