// What does the following code log? Why is this so?

var startingBalance = 1;
var chicken = 5;
var chickenQuantity = 7;

var totalPayable = function (item, quantity) {
  return startingBalance + (item * quantity);
};

startingBalance = 5;
console.log(console.log(totalPayable(chicken, chickenQuantity)));

startingBalance = 10;
console.log(totalPayable(chicken, chickenQuantity));

/*

Line 12 will output 40
Line 15 will output 45

Functions will "close over" (they're closures) any variables in their scope.
The variable startingBalance is defined in the global scope - and so is totalPayable().
Closures retains access to the environment they close over and will evaluate the variables at the time we call them.
So when startingBalance is reassigned on line 11 and 14 the function will be able to see the change when we call it.

*/