// Suppose that we want to extract getDescription from turk, but always have it execute with turk as context. Use one of the methods we've learned in the last lesson to assign such a permanently bound function to a new variable, getTurkDescription.

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

let getTurkDescription = turk.getDescription.bind(turk);

logReturnVal(getTurkDescription);