// Transformation of an Array is the creation of a new Array that contains values calculated from the values in the original Array. JavaScript supplies the map method for transformation:

// map takes a single argument, a callback Function, and calls this function once for each element in the Array. It passes three arguments to the callback Function on each call:

// The value of the current element in the Array
// The index of the current element
// The Array being processed
// The values returned by the callback Function become the elements in the new Array.


function myMap(array, callback) {
  let mapped = [];
  array.forEach(function (element, index, array) {
    mapped.push(callback(element, index, array));
  })

  return mapped;
}


var plusOne = function (n) { return n + 1; };

console.log(myMap([1, 2, 3, 4], plusOne));       // [ 2, 3, 4, 5 ]


// Make a function that takes book objects and return an array of titles

function getBooksTitle(books) {
  return myMap(books, getTitle);
}

var books = [
  {
    title: 'JavaScript and JQuery: Interactive Front-End Web Development',
    author: 'Jon Ducket',
    edition: '1st',
  },
  {
    title: 'Eloquent JavaScript: A Modern Introduction to Programming',
    author: 'Haverbeke',
    edition: '2nd',
  },
  {
    title: "Learning Web Design: A Beginner's Guide to HTML, CSS, JavaScript, and Web Graphics",
    author: 'Jennifer Niederst Robbins',
    edition: '4th',
  },
];

var getTitle = function (book) {
  return book['title'];
};

console.log(getBooksTitle(books));
// console output
[
  "JavaScript and JQuery: Interactive Front-End Web Development",
  "Eloquent JavaScript: A Modern Introduction to Programming",
  "Learning Web Design: A Beginner's Guide to HTML, CSS, JavaScript, and Web Graphics"
]