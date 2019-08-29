// A stack is a list of values that grows and shrinks dynamically. A stack may be implemented as an Array that uses two Array methods: Array.prototype.push and Array.prototype.pop.

// A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. An operation that requires two values pops the topmost item from the stack (i.e., the operation removes the most recently pushed value from the stack), operates on the popped value and the register value, and stores the result back in the register.

// Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and stores the result back in the register. For example, if we start with a stack of [3, 6, 4] (where 4 is the topmost item in the stack) and a register value of 7, the MULT operation transforms the stack to [3, 6] (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, the stack is transformed to [3], and the register is left with the value 168.

// Write a function that implements a miniature stack-and-register-based programming language that has the following commands (also called operations or tokens):

// n : Place a value, n, in the register. Do not modify the stack.
// PUSH : Push the register value onto the stack. Leave the value in the register.
// ADD : Pop a value from the stack and add it to the register value, storing the result in the register.
// SUB : Pop a value from the stack and subtract it from the register value, storing the result in the register.
// MULT : Pop a value from the stack and multiply it by the register value, storing the result in the register.
// DIV : Pop a value from the stack and divide it into the register value, storing the integer result in the register.
// MOD : Pop a value from the stack and divide it into the register value, storing the integer remainder of the division in the register.
// POP : Remove the topmost item from the stack and place it in the register.
// PRINT : Print the register value.
// All operations are integer operations (which is only important with DIV and MOD).

// Programs will be supplied to your language function via a string argument. Your function may assume that all arguments are valid programs — i.e., they will not do anything like trying to pop a non-existent value from the stack, and they will not contain any unknown tokens.

// Initialize the stack and register to the values [] and 0, respectively.

// ------------ Further Exploration --------------
// Refactor the minilang function to include some error handling. In particular, the function should detect and report empty stack conditions, and invalid tokens in the program. Ideally, the function should return an error message if an error occurs, or undefined if the program runs successfully.

/*
Input: A string of commands
Output: The program doesn't return anything, however a PRINT command will output the register value

Rules:
  - if command is a number
    - number is placed in the register
  - else the command is carried out according to its rules

Data Structure:
  - commands: array, for iterating the commands one by one
  - stack: array, for keeping track of last-in-first-out
  - register: integer representing current value

Algorithm:
  - get commands
    - split on space
  - run commands
    - iterate commands
      - if command is number (!Number.isNaN(Number(command)))
        - place number in register
      - else
        - Run command
*/
const VALID_OPERATIONS = ['PUSH', 'ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP', 'PRINT'];

function MinilangError (message) {
  this.name = 'MinilangError';
  this.message = message;
}

function notANumber(value) {
  return Number.isNaN(Number(value));
}

function invalidToken(token) {
  return (notANumber(token) && VALID_OPERATIONS.indexOf(token) === -1);
}

function operationOnEmptyStack(stack, token) {
  return ['ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP']. includes(token) && stack.length === 0;
}

function detectMinilangError(stack, token) {
  let error;
  if (invalidToken(token)) {
    error = new MinilangError(`${token} is not a valid operation`)
  } else if (operationOnEmptyStack(stack, token)) {
    error = new MinilangError(`You cannot perform a ${token} operation on an empty stack`);
  }

  return error;
}

var arithmeticOperations = {
  ADD: (a, b) => a + b,
  SUB: (a, b) => a - b,
  MULT: (a, b) => a * b,
  DIV: (a, b) => parseInt(a / b, 10),
  MOD: (a, b) => parseInt(a % b, 10),
};

function isArithmeticToken(token) {
  return Object.keys(arithmeticOperations).includes(token);
}

function minilang(program, stack = [], register = 0) {
  var tokens = program.split(' ');

  tokens.forEach(function (token) {
    try {
      let error = detectMinilangError(stack, token);
      if (error) throw error;

      if (isArithmeticToken(token)) {
        register = arithmeticOperations[token](register, stack.pop());
      } else if (token === 'POP') {
        register = stack.pop();
      } else if (token === 'PUSH') {
        stack[stack.length] = register;
      } else if (token === 'PRINT') {
        console.log(register);
      } else {
        register = parseInt(token, 10);
      }
    } catch(e) {
      console.log(e.name + ": " + e.message);
    }
  });

  return undefined
}


minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT');
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` commands)

minilang('6 SQUEEZE'); 
// MinilangError: SQUEEZE is not a valid operation

minilang('POP');
// MinilangError: You cannot perform a POP operation on an empty stack