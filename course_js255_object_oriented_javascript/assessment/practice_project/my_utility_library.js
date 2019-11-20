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
    without: function(match) {
      return obj.reduce((arr, val) => {
        if (match === val || Number.isNaN(match) && Number.isNaN(val)) {
          return arr;
        }
        arr.push(val);
        return arr;
      }, []);
    },
// range, return an array of values starting at 0 when a single number is supplied.
// If two arguments are supplied, returns an array of values that start with the first argument and ends with the one number less than the second argument.
    range: function(...indexes) {
      let startIndex = 0;
      let endIndex

      if (indexes.length >= 2) {
        startIndex = indexes[0] > 0 ? indexes[0] : 0;
        endIndex = indexes[1] > 0 ? indexes[1] : 0;
      } else {
        endIndex = indexes[0];
      }

      endIndex = endIndex > obj.length - 1 ? obj.length : endIndex;

      let a = [];

      for(let i = startIndex; i < endIndex; i += 1) {
        a.push(obj[i]);
      }

      return a;
    },
// lastIndexOf, return the last index of the supplied value.
    lastIndexOf: function(value) {
      let i = obj.length - 1;
      for(; i >= 0; i -= 1) {
        if (obj[i] === value || Number.isNaN(value) && Number.isNaN(obj[i])) {
          return i;
        };
      }
      return -1;
    },
// sample, return a single value from an array when no argument is supplied. Return an array of multiple, non-repeated elements when a quantity is supplied.
  };
}

module.exports = _; // Export utility library for testing
