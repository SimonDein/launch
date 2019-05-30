// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

var array1 = ['Moe', 'Larry', 'Curly', 'Chemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
var array2 = [];
var i;

for (i = 0; i < array1.length; i += 1) {
  array2.push(array1[i]);
}

for (i = 0; i < array1.length; i += 1) {
  if (array1[i].startsWith('C')) {
    array1[i] = array1[i].toUpperCase();
  }
}

console.log(array2);

/*

Nothing. The second array is pushed all the values of the first.
Then any  indexes that point to strings that starts with a 'C' will be reassigned to an
uppercase version of the string.

The second array will continue pointing to the same strings as it did when they were pushed to it.

*/