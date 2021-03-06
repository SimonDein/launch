# Data Types

## Overview

JavaScript has two catagories for its data types: primitives and object.

### Primitives

*Are the most basic building blocks in a given language, they are usually implemented at the lowest level of a language and therefore, cannot be further deconstructed.*

* Number (floating-point system with their inherent imprecision, including `Infinity` and `NaN`)
* String (arbitrary size with any character from the UTF-16 character set, single or double quoted)
* Boolean
* Null
* Undefined

### Objects

*Are complex values, that is they are build of several "pieces". The most basic object are not represented at the lowest level of the language. Primitives combined with basic objects can together make for greater and more complex values.*

- Object (including `Function`, `Array`, etc.)

#### Data types and the typeof operator

typeof` returns one of the following:

* `"boolean"`
* `"number"`
* `"string"`
* `"undefined"`
* `"function"`
* `"object"`

In order to test whether an object is an array, use `Array.isArray(object)`.

## Null and Undefined

* The value `null` indicates a non-object, i.e. occurs where an object is expected. `typeof` tags it as `"object"` (see _The history of typeof null_ in [Chapter 9 of Speaking JavaScript](http://speakingjs.com/es5/ch09.html)).
* The value `undefined` indicates a non-value, i.e. is the value of uninitialized variables, missing parameters and missing properties, as well as the implicit return value of functions without an explicit `return` statement.

Trying to access a property on `null` or `undefined` throws an error.

## Objects vs primitives

Objects are mutable, all other values are primitives and immutable.

Primitives are compared by value and passed by value. Beware that `NaN` does not equal anything, not even itself.

Objects are compared by reference (thus are strictly equal only to themselves) and passed by reference.

The primitive types Boolean, Number, String have object constructors that create wrapper objects holding the corresponding primitive value.
When a function is called on a primitive value, as in `"fnord".toUpperCase()`, the corresponding constructor is called in order to create a temporary object of the appropriate type. In this case, a function is called on a string, which leads to the creation of a temporary object by means of the `String` constructor function. That object has `String.prototype` as its prototype, which implements methods like `toUpperCase`. This method's return value will be returned an the temporary object again destroyed. In this way, primitive values can "borrow" methods from the relevant constructor's prototype object. 

## Type coercion

Type coercion is the conversion of a value of one type to a value of another type.

JavaScript can convert to String, Number, and Boolean.

### Explicit type coercion

As functions, constructors can convert to the corresponding primitive type.

* `Number(undefined) ==> NaN`
* `Number(null) ==> 0`
* `Number(false) ==> 0`, `Number(true) ==> 1`
* Given a string, it parses it as a number, e.g. `Number('3.14') ==> 3.14`. If that fails, it return `NaN`.
  Alternatively use `+x`, or `parseInt(x, 10)` and `parseFloat(x)`, which is especially useful if the input string also contains a unit:
  ```js
  parseInt('20pt', 10) // 20
  Number('20pt')      // NaN
  ```

* `String()` does the obvious (except for conversion to primitives, see end of [Chapter 8: Values](http://speakingjs.com/es5/ch08.html)).
  Preferred over `x.toString()`, as the latter throws an error when called on `null` or `undefined` and can be overridden by individual objects (and thus lead to unexpected results). If you want a JSON string, use `JSON.stringify(x)`, which prints everything as `null` that doesn't convert into a JSON value (e.g. functions and `undefined`). When called on an object that implements `toJSON()`, it calls that method.

* `Boolean(x)` converts `x` to `false` if it is falsy, and to `true` otherwise. Falsy values are:
    * `false`
    * `null`, `undefined`
    * `0`, `NaN`
    * `''`

  Alternatively, `!!x` can be used to convert any value into a Boolean, due to the way `!` works (see [Booleans](booleans.md)).

### Implicit type coercion

Many operators and methods try very hard to coerce operands and arguments to the type they need, as the first version of JavaScript did not have exception handling.

Binary operators in general trigger numeric conversion:
* comparison operators (`>`, `<`, `<=`, `>=`)
* arithmetic operators (`-`, `+`, `*`, `/`, `%`)
* loose/lenient equality (`==`, `!=`)

With the exception that comparison and equality operators don't trigger numeric conversion if both operands are strings, or any operand is `null` or `undefined`, and `+` triggers string conversion if any operand is a string.

If an operand is an object, it is first converted to a primitive (meaning to a Number or String), roughly following [this algorithm](https://gist.github.com/samoshkin/baf070ab19b73f4f39ec54149fb37c30#file-js-to-primitive-internal-js). Note that, as a result, arrays are converted to strings.

Also note that `{` at the beginning of a line is always interpreted as a block statement, not as an object, thus for the operation it is ignored:
```js
{}+[]+{}
==> +[]+{}
==> 0 + {}
==> 0 + '[object Object]'
==> '0[object Object]'
```

Strict equality (`===`, `!==`) does not perform type coercion.
