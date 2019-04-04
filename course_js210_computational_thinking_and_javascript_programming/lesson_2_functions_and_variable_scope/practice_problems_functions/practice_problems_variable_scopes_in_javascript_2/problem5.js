// Please predict the output of the following programs, and explain why they output what they do.

var a = 'global';

function checkScope() {
  var a = 'local';
  function nested() {
    var a = 'nested';
    function superNested() {
      a = 'superNested';
      return a;
    }

    return superNested();
  }

  return nested();
}

console.log(checkScope());
console.log(a);

/*
Line 20 will output supernested. The chain of function calls wend with a being returned after being assinged to 'superNested'.
The global variable is never reassigned and will result in 'global' being printed on line 21.
*/