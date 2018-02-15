# Introduction To Testing With Minitest

> For beginners, write tests to prevent regression -- that's it! That's the only benefit of testing we'll focus on for now. We want to write tests so that when we make changes in our code, we don't have to manually verify everything still works. You can write tests first if you like, or you can write your tests after implementation. Most likely, you'll need to take some mixture of both, jumping back and forth between implementation and testing code.



Minitest is the default testing library that comes with Ruby.

##Assertion vs. Expection format

**Minitest comes in two flavours:**
### Assertion

* Statements / claims **following Ruby's  own syntax**
* Create a test by **defining a method with a name starting with `test_`**
* Create assertions with the methods provided by the `Minitest::Test` class - like `assert_equal`
  * Refutations are the opposite to assertions - though rarely used - be aware of this
* A test suite is **many tests** - a test can be **many assertions**



### Expectation

* Expectations written in a DSL much like to that of RSpec's
  * Looks like it's own language



## Settting Up a Test Suite

* Load the `Minitest` library with `require 'minitest/autorun'` at the top of the document

  * If a coverage tool like **`simplecov`** is used it should be at the very top - before `minitest/autorun`

* Load any other resources needed for the testing suite - classes to be tested, external libraries, `pry` etc.

* Define a test class by **subclassing from the class `Test`** in the `Minitest` module

  * Example of a testclass:  `class SomeClassTest < Minitest::Test; end`


  * It's a naming convention to **end the test class name with `Test`**  - eg. `SomeClassTest`

* **Any tests should start with `test_`** - fx. `test_some_method`

  * define a **`setup`** and **`teardown`** method to run before / after each test as needed

* **Use code coverage as a metric** to gauge test quality. (But not the only metric.)



## The SEAT approach

Follow this general flow for setting up test suites

* The **SEAT** format
  * **Set up** necessary objects
    * `Minitest`'s  **`setup`** method does exactly this before each test is run
  * **Execute** the code against the objects that we're testing
    * Run the methods that has to be tested.
    * Save any results - before and after if needed
  * **Assert** the result of the execution
    * Run the assertions
  * **Tear down** and clean up any lingering artifacts
    * `Minitest`'s  **`tear_down`** method is available for excactly this



