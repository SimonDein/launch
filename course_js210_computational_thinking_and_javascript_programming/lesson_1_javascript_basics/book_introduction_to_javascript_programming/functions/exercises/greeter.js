var rlSync = require('readline-sync');

function ask(question) {
  return rlSync.question(question + '\n');
}

let firstName = ask("What's your first name");
let lastName = ask("What's your last name");

console.log(`Oh hello there, ${firstName} ${lastName}`);