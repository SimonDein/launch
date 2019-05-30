// Identify the bug in the following code. Don't run the code until after you've tried to answer.

var myObject = {
  a: 'name',
  'b': 'test',
  123: 'c',
  1: 'd',
};

myObject[1];
myObject[a]; // a is not defined: a should be a string ('a');
myObject.a;

/*

JavaScript throws a reference error is a is not a string and thinks it is a variable.
When it goes looking for a variable by the name of a it doens't find any.

*/