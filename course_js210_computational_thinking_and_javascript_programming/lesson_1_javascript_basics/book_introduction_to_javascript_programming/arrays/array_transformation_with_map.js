let numbers = [1, 2, 3, 4];

let squares = numbers.map(function(number) {
  return (number ** 2);
})

console.log(numbers);
console.log(squares);


// ------------------------------------------------
// The same example with forEach
// Don't do this!
let numbers = [1, 2, 3, 4];
let squares = [];

numbers.forEach(function(number) {
  squares.push(number ** 2);
})

console.log(numbers);
console.log(squares);

/* The reason why this is a bad idea is that:
   #1 we alter the squares variable inside the callback function and the two are now connected directly.
   #2 If we where to run the same code again we would end up with duplicates: [1, 4, 9, 14, 1, 4, 9, 14]

   When we use the map method instead; The callback function isn't connected to any outside variables,
   but just do the logic - the map method takes care of returning the result.
   And we also don't end up with duplicates if we run the same code twice.
*/