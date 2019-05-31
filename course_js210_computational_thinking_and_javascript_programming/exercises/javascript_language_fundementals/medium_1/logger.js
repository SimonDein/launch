// Read through the following code. Why will it log 'debugging'?

function debugIt() {
  var status = 'debugging';
  function logger() {
    console.log(status);
  }

  logger();
}

debugIt();

/*

'debugging' is logged because of JavaScripts lexical scoping rules.
In JavaScript an inner function has access to any variables in it's parents functions inner scopes.
status is in the scope of the logger function declaration and can therefore be accessed when it is
executed on line 9.

*/