/*
Low level programming languages, like fx. C, have manual memory management. You'll have to allocate
the needed memory, then read/write from the variable and then when you don't need it, free up the memory.

JavaScript, and many other high level programming languages, allocates and frees up memory automatically.
As part of the automization, a new term called garbage collection is introduced.
Garbage collection means that when a program is run and as memory is allocated - the runtime will detect
when allocated memory is no longer needed - and frees it up.

An example of how low level languages implement manual memory management might look like this (fake implementation):
*/

var name = claim(32); // Claim 32 bytes of memory for use by name
if (memoryNotAllocated(name)) {
  // handle allocation error here
  return;
}

copy(name, 'Sarah');  // Copies "Sarah" into claimed memory referenced by name
console.log(name);    // Do something with object referenced by name
release(name);        // Release memory for use by others

// In real JS it would look like this:
var name = 'Sarah';   // Declare a variable and set its value. The JavaScript
                      // runtime automatically allocates the memory.
console.log(name);    // Do something with name


// The GC garbage collect when something when some allocated memory is "no longer needed":
function logName() {
  var name = 'Sarah'; // Declare a variable and set its value. The JavaScript
                      // runtime automatically allocates the memory.
  console.log(name);  // Do something with name
}

logName();
// "Sarah" is now eligible for GC
// more code below this line

/*
The alogrithm used for garbage collecting has developed over the years and today most browsers are
shipped with a mark-and-sweep algorithm. mark-and-sweep solves certain types of memory leaks that earlier
algorithms has been unable to catch - fx. circular references.


Here are more JS examples of how GC works:
*/

function logName() {
  var name = 'Sarah'; // Declare a variable and set its value. The JavaScript
                      // runtime automatically allocates the memory.
  console.log(name);  // Do something with name
  return name;        // Returns "Sarah" to caller
}

var loggedName = logName(); // loggedName variable is assigned the value "Sarah"
                            // the "Sarah" assigned to `loggedName` is NOT eligible for GC
                            // the "Sarah" assigned to `name` IS eligible for GC
// more code below this line


// returned object will here will not be GC
function logName() {
  var name = {
    firstName: 'Sarah'          // Declare a variable and set its value. The JavaScript
  };                            // runtime automatically allocates the memory.

  console.log(name.firstName);  // Do something with name
  return name;                  // Returns the `name` object to caller
}

var loggedName = logName();     // loggedName variable is assigned the value stored in name
                                // which is a reference to the object literal { firstName: "Sarah" }
                                // The value returned is NOT eligible for GC.
                                // This value is the same value that is assigned to name
// more code below this line