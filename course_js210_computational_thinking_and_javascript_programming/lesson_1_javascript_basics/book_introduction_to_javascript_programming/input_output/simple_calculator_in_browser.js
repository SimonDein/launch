//funtions
function add(num1, num2) {
  return (num1 + num2);
}

function subtract(num1, num2) {
  return (num1 - num2);
}

function multiply(num1, num2) {
  return (num1 * num2);
}

function divide(num1, num2) {
  return (num1 / num2);
}

questions = "---------- Calculator ----------\n[0] Add\n[1] Subtract\n[2] Multiply\n[3] Divide"
index = Number(prompt(questions))

let num1 = Number(prompt("First number: "))
let num2 = Number(prompt("Second number: "))

let result
switch (index) {
  case 0:
    result = add(num1, num2);
    break;
  case 1:
    result = subtract(num1, num2)
    break;
  case 2:
    result = multiply(num1, num2)
    break;
  case 3:
    result = divide(num1, num2)
    break;
}

prompt(`The result is ${result}`);
