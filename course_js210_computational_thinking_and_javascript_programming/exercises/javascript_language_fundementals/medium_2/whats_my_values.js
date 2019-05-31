var array = ['Apples', 'Peaches', 'Grapes'];

array[3.4] = 'Oranges';
console.log(array.length);
console.log(Object.keys(array).length);

array[-2] = 'Watermelon';
console.log(array.length);
console.log(Object.keys(array).length);

/*

Line 4 will output 3. Arrays only count non-negative indexed elements as elements of the array.
Line 5 will output 4. A '3.4' property was still added to the array.

Line 8 will still return 3. See above.
Line 9 will output 5. Again a new property was added to the array.

Arrays are of object type Object. But the way JavaScript has implemented arrays means that only properties
of the object (array) with a non-negative integer property is counted as elements of the array.
We can add other random properties, but the length method will only count the "real elements".

*/