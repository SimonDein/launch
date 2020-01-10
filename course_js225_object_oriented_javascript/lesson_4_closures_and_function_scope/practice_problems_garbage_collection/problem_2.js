// Consider the code below:

var myNum = 1;

function foo() {
  var myStr = 'A string';
  // what is eligible for GC here?
}

foo();

// what is eligible for GC here?

// more code

// Are either of the values 1 or "A string" eligible for garbage collection on line 5? What about on line 10?

/*
ANSWER

"A string" is eligable for GC as soon as the function is executed at line 10.
'1' reference in the global scope and is not eligable for GC as long as the reference to it is kept.
*/