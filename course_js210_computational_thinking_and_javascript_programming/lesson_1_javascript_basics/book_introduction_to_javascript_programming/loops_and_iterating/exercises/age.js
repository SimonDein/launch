var rlSync = require('readline-sync');

let age = rlSync.question("What's your age?");
age = parseInt(age);

console.log(`You are ${age} old`);
for (let years = 10; years <= 40; years += 10) {
  console.log(`In ${years} years, you will be ${age + years} years old`);
}

