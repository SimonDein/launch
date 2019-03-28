// Function declaration
/* A function declaration can be called befor it's
   definition in the code */
function functionName(arg) {
  //...
}

// Function expression
/* A function expression lets the programmer assign and pass around the          function like any basic datatype like Numbers, Strings, booleans etc.
   This type of function has to be defined before invoked */
let varName = function(arg) {
  //...
}

// Arrow function (also an expression)
/* Arrow fnctions have properties that makes them useful in object oriented
   programming.
   They provide implicit returns, however you have to explicitly return and use curly braces if you have more than one expression. */
let varName = (arg) => //...