// Given the following code:

function startup() {
  var status = 'ready';
  return function() {
    console.log('The system is ready.');
  };
}

var ready = startup();
var systemStatus = // ?

// How can you set the value of systemStatus to the value of the inner variable status without changing startup in any way?

// You can't. The variable is in the scope of the function and we can't access it from the outside,