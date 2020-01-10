// Read the following code carefully. Will the JavaScript garbage collection mechanism garbage collect the variable count after the function counter is run on line 10?

function makeCounter() {
  var count = 1;

  return function() {
    console.log(count++)
  };
}

var counter = makeCounter();
counter();

// No. makeCounter returns a closure and retains access to the count variable until counter doesn't reference
// the closure any more fx. by setting counter = null.
