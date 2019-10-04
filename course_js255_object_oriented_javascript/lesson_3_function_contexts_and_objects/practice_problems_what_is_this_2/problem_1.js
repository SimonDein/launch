// What does this point to in the code below, and what does the method return?

var myObject = {
  count: 1,
  myChildObject: {
    myMethod: function() {
      return this.count;
    },
  },
};

console.log(myObject.myChildObject.myMethod());

/*
this will point to the childObject. The implicit context of this in a method is the obj it's called on.
This will return undefined.
The count property is not defined on myChildObject, and when you try to access a non-existing-
property on an object undefined is returned.
*/