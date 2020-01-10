// What does this point to in the code below?
function foo() {
  function bar() {
    function baz() {
      console.log(this);
    }

    baz();
  }

  bar();
}

foo();

/*
The global object. A functions implicit context is, again, the global object - unless changed.
In a browser that would be 'Window'
*/