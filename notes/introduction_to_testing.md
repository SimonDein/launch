# Introduction To Testing

> For beginners, write tests to prevent regression -- that's it! That's the only benefit of testing we'll focus on for now. We want to write tests so that when we make changes in our code, we don't have to manually verify everything still works. You can write tests first if you like, or you can write your tests after implementation. Most likely, you'll need to take some mixture of both, jumping back and forth between implementation and testing code.



* Minitest comes in two flavours:
  * Assertion style format
    * Statements / claims in the normal Ruby style syntax
    * Create a **test class** by subclassing the `Minitest::Test` class
      * The Min
    * Create **a test** by defining a method with a name starting with `test_`
    * Create **assertions** with the methods provided by the `Minitest::Test` class - like `assert_equal`
      * **Refutations** are the opposite to assertions - though rarely used - be aware of this
    * Colorize the terminal output by using the `minitest-reporters`
    * You can skip tests with the keyword `skip`
  * Expectation style format
    * Expectations written in a DSL much like to that of RSpec's
* The **SEAT** format
  * **Set up** necessary objects
  * **Execute** the code against the objects that we're testing
  * **Assert** the result of the execution
  * **Tear down** and clean up any lingering artifacts