// Does the following code produce an error? Why or why not? What output does this code send to the console?

for (let i = 0; i < 5;) {
  console.log(i += 1);
}

/* The code will run and print out the numbers 1 through 5.
   All 3 components of the foor loop are optional and therefore doesn't throw an error.
   In this case, the increment is done in the body, the termination
   requirements are met and the loop terminates at the 5th iteration.
*/