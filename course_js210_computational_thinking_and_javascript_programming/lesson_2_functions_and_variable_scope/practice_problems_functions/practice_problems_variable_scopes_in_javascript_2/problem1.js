// Please predict the output of the following programs, and explain why they output what they do.

function say() {
  if (false) {
    var a = 'hello from inside a block';
  }

  console.log(a);
}

say();

/*
Hoisting is function level based not block level.
That means that hoisting would effectively look like this:
*/

function say() {
  var a

  if (false) {
    var a = 'hello from inside a block';
  }

  console.log(a); // output will be undefined
}