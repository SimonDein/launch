// Identify the code that violates the Airbnb JavaScript style guide, and update the code to fix the issues you identify. There may be more than one issue in each code snippet.

// link: https://github.com/airbnb/javascript

// 1.
var title = "The Three-Body Problem";

// Use single qoutes when possible.
// correct:
var tile = 'The Three-Body Problem';


// 2
var title = 'The Three-Body Problem',
    author = 'Cixin Liu',
    page_count = 400;

// Use a const, or let per variable declaration, also variable names should use camelcase:
// correct:
let title = 'The Three-Body Problem';
let author = 'Cixin Liu';
let pageCount = 400;


// 3.
var completed = lastPageRead == 400;

// Use the strict equality operator at all times for safety. Use const / let.
// correct:
let completed = lastPageRead === 400;


// 4.
if (finishedBook())
  console.log('You have finished reading this book');

// Use braces for multiline blocks
// correct:
if (finishedBook()) {
  console.log('You have finished reading this book');
}

// or:
if (finishedBook()) console.log('You have finished reading this book');



// 5.
function read(pages) {
      console.log('You started reading.');
      for (var i=0; i<pages; i++) {
              var message = 'You read page '+i;
              console.log(message);
      }
}

read(400);

/*

Use spaces between variable names, values and operators.
Indent by excactly two spaces for every new scope or block.
Use string interpolation instead of concatenation.
Use += for instead of ++ (and the like) for incrementing, decrementing etc.
ES5 reccommends writing your variable declarations at the top of the function.

*/

// correct:
let read = function read(pages) {
  let message;
  let i;
  
  console.log('You started reading.');
  for (i = 0; i < pages; i += 1) {
    message = `You read page ${i}`;
    console.log(message);
  }
}

read(400);