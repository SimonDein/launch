// In the following code, a user creates a person object literal and defines two methods for returning the person's first and last names. What is the result when the user tries out the code on the last line?

var person = {
  firstName: function () {
    return 'Victor';
  },
  lastName: function () {
    return 'Reyes';
  },
};

console.log(person.firstName + ' ' + person.lastName);

/*
function () {
    return 'Victor';
  } function () {
    return 'Reyes';
  }

Just like functions a method must be called by appending parenthesis to the method name.
Functions are first class objects like fx. Numbers and Strings - therefore referecing a function without parentheis
will just return the function itself and not execute it.
*/