// Please predict the output of the following programs, and explain why they output what they do.

var a = 1;

function foo() {
  a = 2;
  function bar() {
    a = 3;
    return 4;
  }

  return bar();
}

console.log(foo());
console.log(a);

/*
Line 15 will print out 4.
When foo() is invoked it returns the return value of bar() - which is 4.

line 16 will return 3. a is last reassigned at line 8.
*/