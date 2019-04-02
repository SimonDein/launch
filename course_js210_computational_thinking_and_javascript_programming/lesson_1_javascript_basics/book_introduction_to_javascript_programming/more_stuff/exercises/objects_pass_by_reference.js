// What does this code log to the console? Why?

let array1 = [1, 2, 3];
let array2 = array1;
array1[1] = 4;
console.log(array2);

/*
This will log [1, 4, 3] because the array has been mutated. The local variable array2 is referencing the same object in memory as array1 meaning that when the object that array1 is referencing is mutated - so will array2 (they point to the same array). array1 and array2 are alias' for one another.
*/