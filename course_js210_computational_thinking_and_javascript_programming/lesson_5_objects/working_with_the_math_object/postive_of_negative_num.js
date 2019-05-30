// To convert a positive integer to a negative integer, you can just place a minus sign in front of the variable that contains the integer. However, if you don't know whether the original value is negative you may inadvertently convert your variable to the wrong value. You can use the Math.abs method to simplify matters by forcing a value positive. For this problem, create a variable with a value of -180, then use Math.abs to log the positive value of the variable.

let number = -180;

let postiveNumber = Math.abs(number);

console.log(postiveNumber); // 180;