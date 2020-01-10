// What does the following code log to the console?

var person = {
  firstName: 'Peter',
  lastName: 'Parker',
  fullName: function() {
    console.log(this.firstName + ' ' + this.lastName +
                ' is the Amazing Spiderman!');
  },
};

var whoIsSpiderman = person.fullName.bind(person);
whoIsSpiderman();

/*
This will log 'Peter Parker is the Amazing Spiderman'.
Line 12 returns a new function that permanently binds the person.fullName() function to the person object.
'this' inside the function will then refer to the person object
*/