// Our desired output for the code below is: Christopher Turk is a Surgeon. What will the code output, and what explains the difference, if any, between the actual and desired outputs?

var turk = {
  firstName: 'Christopher',
  lastName: 'Turk',
  occupation: 'Surgeon',
  getDescription: function() {
    return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
  }
};

function logReturnVal(func) {
  var returnVal = func();
  console.log(returnVal);
}

logReturnVal(turk.getDescription);

/*
This will output "undefined undefined is a undefined."

The reason is that we remove the method from its context and pass it as a function.
Functions context's is by default the global object.
Since the global object does not have any properties by the names described in the function,
undefined is returned.
*/