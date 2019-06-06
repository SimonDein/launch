// Read through the code below. What values will be logged to the console? Can you explain these results?

var languages = ['JavaScript', 'Ruby', 'Python'];
console.log(languages); // JavaScript,Ruby,Pyhon - The array is turned into a string according to Array.protype.toString()
console.log(languages.length); // 3. Nothing special.

languages.length = 4;
console.log(languages); // JavaScript,Ruby,Python,<empty item>. Setting a longer length will insert undefined at "empty" indexes
console.log(languages.length); // 4

languages.length = 1;
console.log(languages); // JavaScript - only one array element left.
console.log(languages.length); // 1

languages.length = 3; 
console.log(languages); //JavaScript,<2 empty items> 
console.log(languages.length); // 3

languages.length = 1;
languages[2] = 'Python';
console.log(languages); // JavaScript,<empty item>,Python
console.log(languages[1]); // undefined
console.log(languages.length); // 3

/*

The key take away from these these examples are how length works on arrays.
Setting a longer length will expand the array and create "empty slots" / set them to undefined.
Shortening down the length of an array will discard any items that doesn't fit and they will bot be retrievable.

*/