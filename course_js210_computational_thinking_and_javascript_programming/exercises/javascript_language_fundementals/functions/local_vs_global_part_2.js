// What will the following code log to the console and why?
// Don't run the code until after you have tried to answer.

var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar);
}

someFunction();

// 'This is local'. The first variable of the name myVar the expression on line 8 encounters,
// is the variable on line 7.