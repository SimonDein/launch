// Please predict the output of the following programs, and explain why they output what they do.

function hello() {
  var a = 'hello';
}

hello();
console.log(a);

/*
On line 8 a ReferenceError will be raised as there is no variable by the name of a accessible in the scope
of the expression.
*/