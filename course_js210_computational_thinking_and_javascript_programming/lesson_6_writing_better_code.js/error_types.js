// Common JavaScript erros:

// ReferenceError
// A ReferenceError occurs when you reference a variable or function that doesn't exist.
a;    // Referencing a variable that doesn't exist results in a ReferenceError.
a();  // The same is true of attempting to call a function that doesn't exist.


// TypeError
// A TypeError usually occurs when you try to access a property on a value that does not have any properties, such as null. Trying to call something that isn't a Function can also raise a TypeError:
var a;      // a is declared but is empty, as it has not been set to a value.
typeof(a);  // "undefined"

a.name;     // TypeError: Cannot read property 'name' of undefined

a = 1;
a();        // TypeError: Property 'a' is not a function


// SyntaxError
// A SyntaxError is special in that one usually occurs immediately after loading a JavaScript program, and before it begins to run. Unlike ReferenceError and TypeError, which are dependent upon specific variables and values encountered at runtime, JavaScript detects SyntaxErrors solely from the text of your program.
function ( {}                   // SyntaxError: Unexpected token (
There are several cases where JavaScript can throw a SyntaxError while a program is running. For instance, this code raises a SyntaxError at runtime.

JSON.parse('not really JSON');  // SyntaxError: Unexpected token i in JSON at position 0
There are a few other errors that can occur in a JavaScript program, including RangeError, URIError, among others; these tend to be rarer.