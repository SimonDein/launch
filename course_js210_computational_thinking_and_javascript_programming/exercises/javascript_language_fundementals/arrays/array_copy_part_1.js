// Read through the code shown below. What does it log to the console at lines 7 and 10?

var myArray = [1, 2, 3, 4];
var myOtherArray = myArray;

myArray.pop();
console.log(myOtherArray); // [1, 2, 3] - myOtherArray has been mutated

myArray = [1, 2];
console.log(myOtherArray); // The same as above. myOtherArray is still assigne to the same object in memory
