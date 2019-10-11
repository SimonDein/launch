// Write a function named makeMultipleLister that, when invoked and passed a number, returns a function that logs every positive integer multiple of that number less than 100. Usage looks like this:

function makeMultipleLister(number) {
  let multiples = [];
  for(let i = number; i < 100; i += number) {
    multiples.push(i);
  }
  
  return function() {
    multiples.forEach((mult) => console.log(mult));
  }
}

var lister = makeMultipleLister(13);
lister();
// 13
// 26
// 39
// 52
// 65
// 78
// 91