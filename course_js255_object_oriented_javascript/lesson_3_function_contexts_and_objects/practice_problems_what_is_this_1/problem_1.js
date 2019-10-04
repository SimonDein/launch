// What does this point to in the code below?

function whatIsMyContext() {
  return this;
}

/*
We don't know the context until execution time.
This function could be assigned as a method on an object, and then 'this' would point to the that object.
It could also be called as is, and 'this' would point to the global object.
*/