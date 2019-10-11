// Write a function named later that takes two arguments: a function and an argument for that function. The return value should be a new function that calls the input function with the provided argument, like this:

function partialApplication(func, argAheadOfTime) {
  return function(argAtInvocation) {
    func(argAheadOfTime, argAtInvocation); // argAheadOfTime is now already set on the function
  };
}

var log = partialApplication(console.log, 'This was applied ahead of time.');
log();
// ...do stuff
log('This was passed at invocation.');
