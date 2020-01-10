// For an extra challenge, consider this line of code from the previous problem:

var args = [].slice.call(arguments);
// Inside of JavaScript functions, arguments is an object that holds all of the arguments passed to the function. Bearing in mind that the function author wants to iterate over the arguments later in the method using an Array method, why do you think he or she is invoking call?

/*
We can't call forEach() on the arguments array as it isn't an actual array.

Since we want to iterate the items held in the arguments object (available to all functions except arrow functions), we can turn the array like object (arguments) into an actual array by using Array.prototype.slice and then call it on the object. slice will return a actual array, and now - boom -
we have an array we can use forEach on.
*/