//Use the times function shown below to write a program that logs the value of 1! (one factorial), 2! (two factorial), 3!, 4!, and 5! (five factorial) to the console.

function times(number1, number2) {
  let result = number1 * number2;
  console.log(result);
  return result;
}

console.log(times(1, 1))
console.log(times(1, 2))
console.log(times(2, 3))
console.log(times(3, 4))
console.log(times(4, 5))