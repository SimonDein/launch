var rlSync = require('readline-sync');

function greet(firstName, lastName) {
  console.log(`Hello, ${firstName} ${lastName}!`);
}

firstName = rlSync.question("What's your first name? ");
lastName = rlSync.question("What's your last name? ");
greet(firstName, lastName);