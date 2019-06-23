// Write a program that asks for a user's name, then greets the user with that name. If the user appends a ! to his name (e.g., 'Bill!'), the computer should "yell" its greeting: that is, it should log everything to the console in uppercase. You can check whether the name ends with a ! using String.prototype.endsWith() (ES6 only). You can remove the ! from the user's name with String.prototype.slice().

let readLineSync = require('readline-sync');
let question = readLineSync.question;

let name = question('What is your name? ');
let greeting;

if (name.endsWith('!')) {
  name = name.slice(0, -1)
  greeting = `HELLO ${name.toUpperCase()}. WHY ARE WE SCREAMING?`
} else {
  greeting = `Hello ${name}.`;
}

console.log(greeting);