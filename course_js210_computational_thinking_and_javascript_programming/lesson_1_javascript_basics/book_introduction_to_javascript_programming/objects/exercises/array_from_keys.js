// Create an array from the keys of object obj below, with all values converted to uppercase. Your implementation must not mutate obj.

let obj = {
  b: 2,
  a: 1,
  c: 3,
};

let upcaseKeys = Object.keys(obj).map((key) => key.toUpperCase());

console.log(upcaseKeys); // => [ 'B', 'A', 'C' ]
console.log(obj); // => { b: 2, a: 1, c: 3 }