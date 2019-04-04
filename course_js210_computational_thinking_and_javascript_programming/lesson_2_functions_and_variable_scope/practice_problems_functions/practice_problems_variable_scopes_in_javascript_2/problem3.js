// Please predict the output of the following programs, and explain why they output what they do.

var a = 'hello';

for (var i = 0; i < 5; i += 1) {
  var a = i;
}

console.log(a);

/*
JavaScript hoists the variable declaration on line 6 to the top of the global scope.
That means a will be declared, then assigned to 'hello' then reassigned times in the for loop,
and at last end up being 5.
The hoisted code would in effect look like this:
*/

var a
a = 'hello'

for (var i = 0; i < 5; i += 1) {
  a = i;
}

console.log(a);