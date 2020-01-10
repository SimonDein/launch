// What does this point to in the code below?

var obj = {
  count: 2,
  method: function() {
    return this.count;
  },
};

obj.method();

/*
A methods implicit context is the object it's called on. In this case obj.
*/