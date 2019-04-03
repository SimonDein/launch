// Go over the following program. 
// What does it log to the console at lines 7, 11, 15, and 19? Is it what you expected? Why or why not?

var myBoolean = true;
var myString = 'hello';
var myArray = [];
var myOtherString = '';

if (myBoolean) {
  console.log('Hello'); // 'Hello'
}

if (!myString) {
  console.log('World'); // !'hello' evaluates to falsy. Nothing is printed.
}

if (!!myArray) {
  console.log('World'); // 'World'.
}

if (myOtherString || myArray) {
  console.log('!'); // '!'. myArray is truthy.
}