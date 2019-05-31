// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

var myArray = ['a', 'b', 'c'];

console.log(myArray[0]);
console.log(myArray[-1]);

myArray[-1] = 'd';
myArray['e'] = 5;
myArray[3] = 'f';

console.log(myArray[-1]);
console.log(myArray['e']);
console.log(myArray);

/*

line 5 will output 'a' - just using normal bracket notation to access an index in the array.
line 6 will output undefined. There is no property in the array (object) called '-1'.
line 12 will output 'd'. A property and value was assigned on line 8. Arrays are just objects.
line 13 will output 5. Again a property and value was asssigned on line 9.
line 14 will output ['a', 'b', 'c', 'f' '-1': 'd', e: 5]. The array has 4 elements - 'a', 'b', 'c' and 'f'.
And the length will be 4, however it now has two properties - '-1' and e. Only elements with a property (index) 0 or posive -
will be counted as elements by the array

*/