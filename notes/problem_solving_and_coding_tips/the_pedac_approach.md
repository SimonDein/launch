# The PEDAC Approach

This approach was mainly "designed" with smaller code challenges / problems in mind. PEDAC can however also be used an approach to bigger application wide challenges if you break down the problems into smaller pieces, and really serves as a process to make you code with intention and to eleminate as many risk as possible before coding.

The goal is to make coding the easy part of tackling a problem. Most of the time should be spent analyzing and understanding the problem all the way through. If you start coding straight away - you'll have to both understand the problem, analyze it, think about a solution, keep any pitfalls in mind, making important decisions all while also thinking and writing in syntax specific language.

All the hard work should be done before coding.

At last - try to always tackle the hardest part of a problem first: write pseudo code and get the idea of how you solve that part. Once that is done the rest is only going to get easier and you'll spend your energy much smarter.

#### PEDAC

| Objective           | Step                       | Description                                                  |
| :------------------ | :------------------------- | :----------------------------------------------------------- |
| Process the Problem | Understand the **P**roblem | - Identify expected input and output<br />- Make the requirements explicit<br />- Identify rules<br />-Mental model of the problem (optional) |
|                     | **E**xamples/Test Case     | Validate understanding of the problem                        |
|                     | **D**ata Structure         | How we represent data that we will work with when converting the input to output. |
|                     | **A**lgorithm              | Steps for converting input to output                         |
| Code with Intent    | **C**ode                   | Implementation of Algorithm                                  |



#Notes

###Understand the Problem

  - Requirements are explicit
    - Take notes
    - The "odd words" problem
  - Requirements are not so explicit and need to be modeled
    - Examples need to be described in computational words
    - "diamond of stars"
  - Implicit knowledge needs to be captured
    - Convert to explicit rules, in computational language
    - "what century is that"
  - Identifying and defining important terms and concepts
    - "queen attack"
    - Same row; same column; especially same diagonal
  - Ask questions to verify your understanding!



###Examples / Test Cases

  - Test cases serve two purposes:
    - help you understand the problem
    - allow you to verify your solution
  - Happy paths
    - combination of requirements; the "obvious" result
  - Edge cases
    - focus on input
    - emptiness (nil/null, "", [], {})
    - boundary conditions
    - repetition / duplication
    - upper case / lower case
    - data types
  - Failures / Bad Input
    - raise exceptions / report errors
    - return a special value (nil/null, 0, "", [], etc.)
  - ask questions to verify your understanding!



###Data Structure

  - Input data
  - Rules/requirements as data
    - hash/object

  - String, array, hash/object, number
    - string
      - concact, strip, reverse, etc.
      - Regular Expression! split, replace, match...
    - Array
      - need to walk through it (iteration)
      - index
      - abstractions!!
        - map
        - reduce
        - select/filter
        - all
        - ...
    - Hash/object
      - Lookup table / dictionary
      - Partition data for more efficient access downstream
      - Digest
    - Dumber
      - Math operations
      - Number as string may have advantage over numbers
  - Compound data structures
    - Array of arrays
    - Hash with array/object values, etc.

    

###Algorithm

  - Algorithms have to be described in the language of chosen data structure!
    - "then solve it" doesn't count
  - Have to be really fluent with
    - String / Regex
    - Array
      - Ruby: Enumerable
      - JavaScript: Higher-Order Functions
    - Hash / Object
      - Creation (default values)
      - Access (default values)
      - Iteration
  - Verify your algorithm with your examples / test cases



#### Small Code Challenge Problems

- 20 - 45 minutes long
- typical solutions: 10 - 40 lines of code
- used extensively in interviews for a reason
  - mastery of a language
  - logic / reasoning
  - communications
- not a skill that you "acquire and file away", but needs a lot of practice

#### Interview Tips

- Communicative

- Getting to a working solution **>** no solution

- De-risking

  - Verify your understanding of a function / method
  - Run small tests in the REPL

  - Test your building blocks before putting them together
    - You reduce the risk of compound bugs
    - run code often
    - debug locally

- Manage your energy

  - Start with the hardest part first