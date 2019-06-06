// Build a program that randomly generates Teddy's age, and logs it to the console. Have the age be a random number between 20 and 200 (inclusive).

// Example Output:
// Teddy is 69 years old!


let randomBetween = function randomBetween(max, min) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

let displayAge = function displayAgeWithName(name, age) {
  console.log(`${name} is ${age} years old!`);
}

displayAge('Teddy', randomBetween(20, 200));