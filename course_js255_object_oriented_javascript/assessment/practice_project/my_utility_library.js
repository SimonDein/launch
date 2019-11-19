let _ = function(obj) {
  return {
    // ==== Array methods to create: ====
    // first, return the first element in an array.
    first: function() {
      return obj[0];
    },

    // last, return the last element in an array.
    last: function() {
      return obj[obj.length - 1];
    },

// without, return a new array that does not contain the value passed to it.
    without: function(value) {

    },
// range, return an array of values starting at 0 when a single number is supplied.
// If two arguments are supplied, returns an array of values that start with the first argument and ends with the one number less than the second argument.

// lastIndexOf, return the last index of the supplied value.

// sample, return a single value from an array when no argument is supplied. Return an array of multiple, non-repeated elements when a quantity is supplied.
  };
}

module.exports = _; // Export utility library for testing
