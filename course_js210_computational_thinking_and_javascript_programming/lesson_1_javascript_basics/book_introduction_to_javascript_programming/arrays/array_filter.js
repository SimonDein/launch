let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2]

// 2 versions doing the same thing:
// callback function as function expression
let filteredNumbers = numbers.filter(function(number) {
  return (number > 4)
})

// callback function as arrow function
let filteredNumbers = numbers.filter((number) => number > 4)

console.log(numbers);
console.log(filteredNumbers);

arr.sort(function (a, b) {
  return a - b;
})