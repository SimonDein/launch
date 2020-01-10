// The method franchise.allMovies is supposed to return the following array:

/*
[
  'How to Train Your Dragon 1',
  'How to Train Your Dragon 2',
  'How to Train Your Dragon 3'
]
*/
// Explain why this method will not return the desired object? Try fixing this problem by taking advantage of JavaScript lexical scoping rules.

var franchise = {
  name: 'How to Train Your Dragon',
  allMovies: function() {
    return [1, 2, 3].map(function(number) {
      return this.name + ' ' + number;
    });
  },
};

/*
 * This won't work as this on line 16 will be bound to the global object.
 */

// We can solve it considering JS's lexical scoping rules by assigning the object's context to a variable outside the call to map:
franchise = {
  name: 'How to Train Your Dragon',
  allMovies: function() {
    let self = this;
    return [1, 2, 3].map(function(number) {
      return self.name + ' ' + number;
    });
  },
};

console.log(franchise.allMovies()); // Prints the desired output
