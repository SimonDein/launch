#  Closures in Ruby

***See course 130 material and exercises for more information***

### Overview

* A closure is an unnamed "chunk of code" that binds it's sorrounding artifacts to be executed at a later time
  * Closures gives **both the implementer**(the programmer) and the **"method caller"** more free room in that the implementer doesn't have to know exactly how the methods is going to be used - and the method caller can bend the method to his / hers specific needs at invocation time.
  * It's called a "closure" because it's said to **bind its surrounding artifacts** (ie, variables, methods, objects, etc) and build an "enclosure" around everything so that they can be referenced when the closure is later executed.




### Explanation

* There are 3 ways to work with closures in Ruby
  1. Using **blocks**
     - Can be declared using either: `{ }` or `do; end`
     - Implicit blocks **are not objects** - but a grouping of code - a type of closure
     - Any method in Ruby implicitly takes a block
     - Has **loose arity** rules (does not throw an`ArgumentError` if num of arg's vs. params doesn't align)
     - The keyword **yield** yields execution over to the block passed
       - Yield can pass arguments to the block
       - If no block is passed - **yield will throw a `LocalJumpError`**
     - Blocks can take arguments like methods - but is not as strict with the amount of arguments passed
     - `return` from a block defined in `main` (the top level of the program) will result in `LocalJumpError` as we can't return from the top level of a program.
     - The shorthand syntax `&some_proc` *converts* a proc to a block
       - First Ruby will check to see if what follows `&` is indeed a proc
         - If not Ruby will call `to_proc` on the object and then convert it to a block
       - Another useful shorthand syntax Ruby provides is the `&:some_symbol`
         - This will first call `Symbol#to_proc` on `:some_symbol`
         - Then `&` will convert the `proc` to a block 
  2. **Proc** objects
     * A proc **is a block wrapped in a Proc** object and **acts like a block** (see block def)
     * Can be instatiated with `Proc.new { code here }` or `Kernel#proc { code here }`
       * The `&` will try to convert what follows into a block
       * If it can't `:some_symbol` will be called `Symbol#sym_to_proc` on and then `&` will convert the proc into a block
     * `return` from a Proc has the same behavior as a block (see block)
       * Returning inside a method definition will **immediately return and exit** out of that method
  3. **Lambdas**
     * A lamda is just a `Proc` object with **strict argument** rules
       - **Throws an `ArgumentError`** if num of args. vs params doens't match up
     * Can be instatiated with `Kernel#lamda`
     * `return` will **return to the enclosed environtment from which the lambda was called**  -unlike a normal Proc which will return "all the way" out of the method.





## Summary

- blocks are just one way Ruby implements closures. Procs and lambdas are others.
- closures drag their surrounding context/environment around, and this is at the core of how variable scope works.
- blocks are great for pushing some decisions to method invocation time.
- blocks are great for wrapping logic, where you need to perform some before/after actions.
- we can write our own methods that take a block with the `yield` keyword.
- when we `yield`, we can also pass arguments to the block.
- when we `yield`, we have to be aware of the block's return value.
- once we understand blocks, we can re-implement many of the common methods in the Ruby standard library in our own classes.
- the `Symbol#to_proc` is a nice shortcut when working with collections.
- **Implicit `blocks` are nameless `Procs`**
- **`Proc's` are `blocks` assigned to variables**
- **`Lambda's` are `Procs` that enforce the number of arguments**
  - Basically exhibiting the same behavior as methods with regards to arguments and `return`