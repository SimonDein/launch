// Write a function that will take a short line of text, and write it to the console log within a box.

// Further Exploration
// Modify this function so that it truncates the message if it doesn't fit inside a maximum width provided as a second argument (the width is the width of the box itself).
// You may assume no maximum if the second argument is omitted.
// For a real challenge, try word wrapping messages that are too long to fit, so that they appear on multiple lines but are still contained within the box.


/*
get messageLines = bannerMaxLength / 
get 


*/

function logInBox(string) {
  let border = '';
  let spacing = '';

  for(i = 0; i < string.length; i++) {
    border += '-';
    spacing += ' ';
  }

  
  console.log(`+-${border}-+`);
  console.log(`| ${spacing} |`);
  console.log(`| ${string} |`);
  console.log(`| ${spacing} |`);
  console.log(`+-${border}-+`);
}



// tests
logInBox('To boldly go where no one has gone before.');
// logs:
// +--------------------------------------------+
// |                                            |
// | To boldly go where no one has gone before. |
// |                                            |
// +--------------------------------------------+

logInBox('');
// logs:
// +--+
// |  |
// |  |
// |  |
// +--+

logInBox('Hello this string is supposedly supposed in certain circumstances to be very long', 2);

