// Is the named function in this IIFE accessible in the global scope?

(function foo() {
  console.log('Bar');
})();

foo() // ?

/*
 No it's not. The the function is named it's lexical scope is enclosed within the grouping operator ().
 */
