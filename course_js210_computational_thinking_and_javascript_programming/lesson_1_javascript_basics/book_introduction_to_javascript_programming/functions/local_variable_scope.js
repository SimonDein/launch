function greetPeople() {
  // Here we use a local variable instead of a global in global_variable_scope.js
  let greetingMessage = 'Good morning';
  console.log(greetingMessage);
}

greetPeople();
// If we try to reference the local variable in the outer scope we get a ReferenceError
console.log(greetingMessage);
