// What does this point to in the code below?

function whatIsMyContext() {
  return this;
}

whatIsMyContext();

// this will point to the global object. 'Window' in a browser. Functions implictly points to global object.