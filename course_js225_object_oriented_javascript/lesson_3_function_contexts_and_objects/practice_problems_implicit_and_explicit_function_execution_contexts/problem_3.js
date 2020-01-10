// What will the code below output?
var message = 'Hello from the global scope!';

function deliverMessage() {
  console.log(this.message);
}

deliverMessage();

var foo = {
  message: 'Hello from the function scope!',
};

foo.deliverMessage = deliverMessage;

foo.deliverMessage();
/*
Line 8 will output => 'Hello from the global scope!'
Line 16 will ouput => 'Hello from the functions scope!'

deliverMessage() is assigned to the foo object on line 14 -
and when called, this will refer to the encapsulating object, which is foo
*/