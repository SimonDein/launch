// Please predict the output of the following programs, and explain why they output what they do.

console.log(a);

var a = 1;

/*
Line 3 will output 'undefined' due to hoisting in JavaScript.
Hoisting in this example means that the a variable will be declared (not assigned) at the top of the scope.
Then we console.log() the variable which hasn't been assigned explicly and therefore will
output undefined as all declared variables implictly are assigned to the value undefined.
*/