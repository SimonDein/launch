/* 
JavaScript has many built-in objects. Including Math, Date, Array, String etc.
JavaScript also has 5 primitives: String, Number, Boolean, Undefined, Null.

String, Number and Boolean can be wrapped by their object counterparts.
The primitives themselves does not allow for calling functions on them, however the objects do.
JavaScript allows us to call methods / functions on the primitives and JavaScript will then temporarily coerce
them into their object counterpart to expose the behavior we want.
*/

// We can create a custom object using the object literal
let person = {name: 'Peter Pedal', age: 6};

// The propterties can then be read as well as reassigned using dot notation
person.age = 42;
person.hairColor = 'brown';

// Propterties can be functions (as functions are objects)
person.getAge = function() {return this.age};
person.getAge() // returns 6 in this example

// Objects can be created using the object literal, objects constructor function or with the Object.create() method

// object literal
{wheels: 4};

// object cunstructor function (String in example)
new String('foo');

// Object.create() method
Object.create(anObject);


