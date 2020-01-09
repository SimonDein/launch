# README

## Overview

This is a collection of my notes, assumptions and decisions.

The project is written in `Node.js` (`v11.11.0`) and consists of 4 files:

* `README.md` - notes
* `todoApp.js` - the application file
* `todoApp.test.js` - unit tests 
* `package.json` - project manifest

## Tests

This project is unit-tested using the JavaScript testing framework `Jest`. You must install the dependencies (`jest`) before you can run the test. The dependencies are described in the `package.json` file and by running `npm install` the node package manager will fetch and install these for you. The tests can then be run with the command `npm test`.

The tests for each module are seperated into their own `describe` function. Nested in each `describe` function i have grouped related `test`s into their own `descibe` function as well.

Test data that isn't created inside a `test` is described at the very top and is reset before each test as described in the `beforeEach` function.

## Assumptions and notes

The application is served as three individual components (modules). Since the specifications don't specify how the application should be served i've chosen to go this route for a couple of reasons:

> The `todoManager` should interface with and be able to query a `todoList` to return all or a subset of its `todo`s

This implies that we just need a single todoManager.  It could interface with several `todoLlist`s in a bigger program that would support several `todoList`s. I am aware that this is not a requirement for this project, but it's seems natural for me to think of a Todo app this way.

> The `todoList` is a collection of `todo` objects. It provides an interface for manipulating the collection of objects (i.e., adding, updating, deleting, etc.).

A todolist only hold its respective `todo`s and provide and interface for working with those. That means that if we want more than one list we would need several `todoList`s.

So my mental model of the "bigger picture" looks like this:

* We'll have a single `todoManager` that acts as a query interface for (potentially) several `todoList`s
* We have a `TodoList` constructor that could potentially construct several lists in a program that would support and manage the indidual lists. Managing several lists are outside the scope of this program, but the functionality is there. The todolist manages a collection of `todo`s.
* We have `Todo` constructor for creating `todo`s.

Before is started the project i had OLOO in mind and hoped to utalize this pattern for object creation. However, realised that would be problematic for two reasons: 

* The specification for a `todo` blocks the possibility for a function for initializing state in a `todo`  (fx. `init`)
* A `todoList` is going to have private data

Since i'm assuming this app potentially could have more than one `todoList`, i would have to manage private data for invidual objects. Since every instance would retain access to the same private variables in their functions - and we want to have individual private state - we'd have to use other means. That could fx. be a private object in the prototype (the object we could create lists from), holding state for individual objects created from it and then look up the state for a certain object as needed.

That seems a little overkill to me and i'd prefer true private data - ie. one object could never access another objects private data. Because of the above and that we already have to use another pattern for `todo`s, i found it reasonable to use the same pattern for both.

I settled with the pseudo-classical pattern as it makes it easy to define private data and shared methods. As a bonus we would be able to see where something came from.

### todoManager(todoList)

The `todoManager` does not carry any data, it'is independent of any `todoList` and `todo` - except it has to know how to get the `todo`s from a list. It is always handed a copy of `todo`s from a passed list and serves as an interface for querying `todo`s based on some criteria from the passed list - fx. *give me all completed todos* or *give me all todos made made at this time*

### TodoList(todoSet)

Since i'm assuming we might want several `todoList`s and the `todos` belonging to the list should be private, we have a downside. If a list should be able to operate on it's `todos`, we can't define those methods as shared methods on `TodoList.prototype`. That means that each `todoList` has to carry their own copy of all methods that needs access to private data (all methods in this case), which is somewhat redundant, however, necessary in this case.

The `todoList` should have a collection of `todo` objects. I assume order will be significant as i assume we want the todos in the order they are added by default and the choice of having duplicate values in a `todoList` should be left up to the user - which together make me choose an array as the data structure here. Speed wise this choice has it pros and cons - adding a new `todo` will be very fast - deleting the oldest `todo` will be very slow. I assume deletion won't be too important as we are proably going to access/manipulate state (whether a `todo` is done) more than actually deleting a specific `todo`, and reading/writing from/to an array is also very fast.

`TodoList` should support both the deletion and update of a todo. In my last iteration I called the methods `deleteTodo` and `updateTodo`, but the methods depended only on the `id` of a `todo` . With that in mind it was natural to change them to `deleteTodoWithId` and `updateTodoWithId`. If we later want to be able to delete or update by fx. `title` or `completed` we could add them as needed.

### Todo(todoData)

I've chosen to put the function that generates the unique `id`s inside the constructor `Todo` constructor function. I considered moving it to `TodoList`, but i think it should be a concern of what actually makes the `todo`s not what commands them to be created. That would also split the concern of initializing a `todo` between `TodoList` and `Todo` instead of delegating the concern to one thing.

The unique `id`s are just ever incrementing numbers starting at 1. If i we were to have several `todoLists` it would probably make sense to give them an `id` as well. I have not taken this into account in my program, but a bigger program should probably consider this and potentially dealing with unique id's between all instances of any type. A unique id that also describes the type of the object it is assigned could also be a possibility. Another thing to consider is that if the program is restarted or another instance is made, the `id` counter will start from 1 again. For this project i'm assuming the program will never restart and no other instances will be made. A unique id, for a program supporting several users and instances, could fx. be made with a mix of user id, time, date.

### Errors

Validation of input is not mentioned in the requirements, and are not performed in my program - except to the very (*very*) little extent the functions implicitly will handle what input they might be given and what output they might produce. In a production ready application most of the validation should probably be done on the front end, but safety measures on the back-end would make sense as well. I'm very much aware that this is something that should be taken seriously and be taken care of in a production ready application, but for the scope of this project i chose not take this into account in my code.



### Last Note

I'm not sure how you actually can test whether new `id`s are 100% unique. I know how i've implemented the creation of new id's and i'm certain that a new id's will be unique if the code won't be changed and the `getNextId` is always used, however, implementing the tests such that if someone else could come along and change the code and run my tests and be sure that they are uniqe seems pretty hard. And that applies to pretty much all other tests. I feel like you could write an endless amount of tests and still not cover all bases.

Writing tests such that they can be relied on when modifying code is something i need to practice more.