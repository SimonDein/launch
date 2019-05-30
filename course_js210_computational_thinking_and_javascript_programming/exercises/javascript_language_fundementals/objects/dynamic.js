// What will the following code log to the console and why? Don't run the code until after you have tried to answer.

var myObject = {
  prop1: '123',
  prop2: '234',
  'prop 3': '345',
};

var prop2 = '456';
myObject['prop2'] = '456';
myObject[prop2] = '678';

console.log(myObject[prop2]); // 678
console.log(myObject.prop2); // 456

/*

Line 13 uses the value of prop2 on line 9 to access the value that was set on line 11.
Line 14 will access the value that was set on line 10.

Expressions can be used to access a value in an object.
*/