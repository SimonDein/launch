// Add a qux property with value 3 to the myObj object we created in the previous exercise. Now, examine the following code snippets:

let myProtoObj = {
  foo: 1,
  bar: 2,
};

let myObj = Object.create(myProtoObj);
myObj.qux = 5;


// Snippet 1
Object.keys(myObj).forEach(function(key) {
  console.log(key);
});

//Snippet 2
for (key in myObj) {
  console.log(key);
}

// Without running this code, can you determine whether these two snippets produce the same output? Why?

/*
No they don't.
Snippet 1 extracts only the keys of the child object and not any of the prototypes', resulting
in only one key being logged.

Snippet 2 iterates the object using a for/in loop and will also access the prototypes' keys -
resulting in all three keys logged.
We could however produce the same result by implementing a condition checking whether myObj.hasOwnProperty(key).
*/