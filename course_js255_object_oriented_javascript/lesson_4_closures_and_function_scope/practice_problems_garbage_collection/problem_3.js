// In the code below, is the value referenced by outerFoo eligible for garbage collection on line 10?

var outerFoo;

function bar() {
  var innerFoo = 0;
  outerFoo = innerFoo;
}

bar();

// can outerFoo's 0 be garbage collected here?

// more code

/*
ANSWER

No it can't. As long as 0 is pointed to by outerFoo in the global scope - it can't be GC.
InnerFoo's 0 can be GC as soon as bar returns though.

*/