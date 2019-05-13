// In the previous exercise, the value of the reference gets copied. For this exercise, only the values of the array should be copied, but not the reference. Implement two alternative ways of doing this.

// Here is the code from the previous exercise:

var myArray = [1, 2, 3, 4];
var myOtherArray = myArray;

myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);

// solution 1
var myArray = [1, 2, 3, 4];
var myOtherArray = myArray.slice(); // Slice provides a concise and fast way of making a shallow copy of an array

// solution 2
var myArray = [1, 2, 3, 4];
var myOtherArray = [];

for(let i = 0; i < myArray.length; i++) {
  myOtherArray.push(myArray[i]);
} // a for loop can be used to explicitly copy every value from the array to another