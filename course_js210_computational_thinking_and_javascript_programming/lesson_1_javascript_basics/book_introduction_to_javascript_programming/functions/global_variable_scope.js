// Any variable declared inside a function is not a global variable, but everything else is a global variable.

// The variable is global as it is not defined inside a function
let greetingMessage = 'Hello there young padawan!';

// The variable is accessible inside the function as it's globally defined
function greetPeople() {
  console.log(greetingMessage);
}

function changeGreetingMessage(newMessage) {
  greetingMessage = newMessage;
}

greetPeople();
changeGreetingMessage("Yo this is new!");
greetPeople();