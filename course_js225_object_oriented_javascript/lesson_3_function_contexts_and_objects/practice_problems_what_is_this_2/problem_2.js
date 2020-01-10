// In the previous problem, how would you change the context, or the value of this, to be the parent myObject?

// var myObject = {
//   count: 1,
//   myChildObject: {
//     myMethod: function() {
//       return this.count;
//     },
//   },
// };


// We can call(), or apply() the method from myChildObject on myObject instead:
var myObject = {
  count: 1,
  myChildObject: {
    myMethod: function() {
      return this.count;
    },
  },
};

console.log(myObject.myChildObject.myMethod.call(myObject));