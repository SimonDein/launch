// Please predict the output of the following programs, and explain why they output what they do.

function hello() {
  a = 'hello';
}

hello();
console.log(a);

/*
Line 7 will not output anything and return 'undefined'.
Any function wihout an explicit return will return undefined.

Line 8 will output hello.
When we invoked the function, a global variable by a was initialized and assigned to 'hello',
as the variable wasn't prepended by var, let or const.
*/
