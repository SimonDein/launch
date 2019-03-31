let myArray = [
  1, 3, 6, 11,
  4, 2, 4, 9,
  17, 16, 0,
];

// Using arrow function
let evenOddArray = myArray.map((num) => (num % 2 === 0) ? 'even' : 'odd');

console.log(evenOddArray);

// Using function expression
let evenOddArray2 = myArray.map(function(num) {
  if (num % 2 == 0) {
    return 'even';
  } else {
    return 'odd';
  }
})

console.log('------');
console.log(evenOddArray2);

// The same as above, but with a ternary operator instead of if / else statements
let evenOddArray3 = myArray.map(function(num) {
  return (num % 2 === 0) ? 'even' : 'odd';
})

console.log('------');
console.log(evenOddArray3);