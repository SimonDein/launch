// Build a program that logs when the user will retire and how many more years the user has to work until retirement.

let readlinesSync = require('readline-sync').question;

let age = Number(readlinesSync('What is your age? '));
let retirementAge = Number(readlinesSync('At what age would you like to retire? '));

let currentYear = new Date().getFullYear();

console.log(`It's ${currentYear}. You will retire in ${retirementAge - age + currentYear}`);
console.log(`You only have ${retirementAge - age} of work to go!`);