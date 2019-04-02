// Strings can hold any character in the utf-16

//---------- Special characters -----------
// A new line, tab, backspace etc. are also characters - called formatting characters
// All they do is affecting the format of the string and they're written using an escape sequence
let multiline = 'This string...\nspans multiple lines'

// Escape character ---------
// You can escape any character in a string with a backslash to prevent it from being interpreted
// as a special character
var quote = '"It\'s hard to fail, but it is worse never to have tried to succeed." - Theodore Roosevelt';

// -------------- String Concatenation --------------
// You can concatenate two strings by using +
let helloString = 'Hello, ';
let name = 'Boris';

helloString + name; // => 'Hello, Boris'

// ----------- Character Access -----------
// Strings function like an ordered collection of characters.
// To access a character in a string, we can use the String.prototype.charAt() method:
'hello'.charAt(1); // => 'e'

// Or use bracket notation much like on an array:
'hello'[1]; // => 'e'

// ---------- String Length ---------
// Strings also has a 'length' propterty that tells the number of characters in the string:
'cheese'.length; // => 6

// ------------ Working With Long Strings -----------
// Long string literals is an issue when writing the string out in preperation for assigning it to a variable
// You can use concatenation to write the string in chunks and make your code easier to read:
let veryLongString = 'Hello there, my name is Blop and this string will ' +
                     'will continue forever and ever and ever. It\'s a very ' +
                     'long string. And therefore this text is also a bit long ' +
                     'String concatenation like this can help on readability';

// Or use backslash to tell JavaScript to ignore the following newline:
// Be extra cautious when choosing this syntax as spaces before and after a backslash
// can lead to extra spaces and errors in the code.
let veryLongString = 'Hello there, my name is Blop and this string will \
will continue forever and ever and ever. It\'s a very \
long string. And therefore this text is also a bit long \
String concatenation like this can help on readability';

