// Read through the following code. Currently, it does not log the expected result. Explain why this happens, then refactor the code so that it works as expected.

var person = { name: 'Victor' };
var otherPerson = { name: 'Victor' };

console.log(person === otherPerson);    // false -- expected: true

/*

False is returned as equality on two objects is tested on whethet the two objects are the same object (same objects in memory).
We can test if both objects has the same properties with the same key / value
*/

function equalState(obj1, obj2) {
  if (obj1.length !== obj2.length) return false

  for (let prop in obj1) {
    if (obj1[prop] !== obj2[prop]) return false;
  }

  return true
}

var person = { name: 'Victor' };
var otherPerson = { name: 'Victor' };

console.log(equalState(person, otherPerson));