// If you remove a method from its containing object and execute it, it loses its context:

var john = {
  firstName: 'John',
  lastName: 'Doe',
  greetings: function() {
    console.log('hello, ' + this.firstName + ' ' + this.lastName);
  },
};

var foo = john.greetings;
foo();

// => hello, undefined undefined

/*
We could use call(), to restore the context, but if we don't want to execute the function right away,
or need to pass it 
*/