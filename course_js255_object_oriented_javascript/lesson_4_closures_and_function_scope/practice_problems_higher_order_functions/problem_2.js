// Consider the code below:

var numbers = [1, 2, 3, 4];
function checkEven(number) {
  return number % 2 === 0;
}

numbers.filter(checkEven); // [2, 4]
// Of the two functions invoked (checkEven and filter), which is a higher-order function and why?

/*
filter is a higher order function. It takes a function as an argument.
checkEven is not a higher order function as i niether takes a function as argument nor returns one.
*/