// Consider the code below:

function makeEvenCounter() {
  var index = 0;
  return function() {
    return index += 2;
  };
}

var evenCounter = makeEvenCounter();

// is 0 eligible for GC here?

// more code
// Is 0 eligible for garbage collection on line 10?

/*
ANSWER

No. The function returned by makeEvenCounter closes over and retains a reference to the 0 pointed to by the variable "index".
*/