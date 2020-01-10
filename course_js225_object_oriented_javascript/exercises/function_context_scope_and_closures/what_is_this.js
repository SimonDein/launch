// Read the following code carefully. What do you think is logged on line 7. Try to answer the question before you run the code.

var person = {
  firstName: 'Rick ',
  lastName: 'Sanchez',
  fullName: this.firstName + this.lastName,
};

console.log(person.fullName);

/*
 * It will return NaN. Anywhere outside a function 'this' will be bound to the global object.
 * this.firstName and this.lastName will both return undefined - and undefined + undefined will result in NaN.
 */
