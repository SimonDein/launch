// --------- Converting Strings Into numbers ---------
// We can use the Number() function to turn strings that contain numeric values into a number:
Number('2'); // => 2

// If a string cannot be converted into a number, Number() returns Nan:
Number('asdf123'); // => NaN (not a number)

// parseInt() and parseFloat() can be used to coerce a string or a number into an integer or float:
parseInt('123', 10);     // 123
parseInt('123.12', 10);  // 123, will only return whole numbers
parseInt('123.12');      // 123
parseFloat('123.12');    // 123.12, can handle floating point value

// --------- Converting Numbers To Strings ---------
// You can use the String() function to turn numbers into strings:
String(23); // => '23'

// You can also call the toString() method on numbers:
(42).toString(); // => '123'

// --------- Booleans To Strings ---------
// Booleans can also be turned to strings using the String() function and toString() method:
String(true); // => 'true'

false.toString(); // => 'false'

// --------- Converting Any Value To A Boolean ---------
// You can use the Boolean() function to convert any value into a boolean value based on the truthy
// and falsy rules in JavaScript:
Boolean(null);           // false
Boolean(NaN);            // false
Boolean(0);              // false
Boolean('');             // false
Boolean(false);          // false
Boolean(undefined);      // false
Boolean('abc');          // other values will be true
Boolean(123);            // true
Boolean('true');         // including the string 'true'
Boolean('false');        // but also including the string 'false'!

// The double '!' operator (!!) provides a simpler way to coerce any value into a boolean value
// A single ! will return the opposite of the value's boolean equivalent.
// Double !! returns the value's boolean equivalent:
!!(null);                // false
!!(NaN);                 // false
!!(0);                   // false
!!('');                  // false
!!(false);               // false
!!(undefined);           // false

!!('abc');               // true
!!(123);                 // true
!!('true');              // true
!!('false');             // this is also true! All non-empty strings are truthy in JavaScript