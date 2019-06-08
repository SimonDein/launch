# JS210 Test: What We've Learned So Far

Be able to explain clearly the following topics

##Primitive values, types and type conversions

### Primitive Values

A primitive is the most basic of data types. A primitive value is immutable, they can't be broken further down into smaller pieces and provide the building blocks to create "complex" datatypes like Object or a custom object like HumongousGodzillaOfPeaceAndPolitics, which can consist of all the different datatypes. A primitive are non-objects and do not a have any properties or methods and basically represents excactly what they are in themselves - a number, a string, a boolean etc. Most of the time a primitive is represented directly at the lowest level of the language implementation.

### Types

JavaScript (ES5) has 5 primitives:

* String - A list of characters representing text
* Number
  * Represents any number. Where other languages have implemented several datatypes to represent different kinds of numbers (fx. floats and real numbers etc.) -  JavaScript's Number type represents any kind of number.
* Boolean
  * Represents the logical binery state of either true of false - ei. "on or off" / 1 or 0.
* Undefined
  * Represents the primitive value undefined. A variable that has not be assigned a value has the value of undefined. A function / method or statement will return undefined if there is no explicit return statement or if it returns a variable that hasn't been assigned a value.
* Null
  * Represents the primitive value null. Null in JavaScript is supposed to be an intentional value of "nothing" in contrast to undefined that represents something that hasn't been defined (intentional or not).

And 1 complex / composite:

* Object
  * Represents a collection of properties. Properties consists of a key and value where the key always will be either a String or a Symbol (added in EC6) and the value can be of any type, including Object and Function (which are just a callable object) that all combined, provides us the ability to create complex data structures.

### Type Conversion

There are two types of conversion: **implicit** and **explicit**.

Explicit coercion / conversion is when the programmer directly chooses how to convert a value to another as fx. in the expression `String(5) => '5'` that translates to "We want a string representation of this number 5". Implicit conversion is when the engine decides for you fx. in the expression  `'5' + 5 => '55'` that translates to "we have this string 5 and number 5 - please coerce one of the types to the same type of the other and do the operation that was defined for the operator for that data type".

Implicit coercion typically happens when you use operators with different data types or in if statements where the expression will evaluate to true or false. The loose equality operator `==` will implicitly coerce datatypes when one is different from the other, unlike the strict equality operator `===` which doesn't do any conversions.





###Variable scopes and hoisting

#### Variable Scope



###Function declarations, expressions and scopes

###Object properties and mutation

###Assignments and comparison

###Pure functions and side effects