// Given the code and desired output below, would it make more sense to use call or apply to supply explicit context and arguments to outputList? Implement a solution using one of the methods, such that the desired output is logged, and explain your choice.

// Desired output:

// A Collection of Fruit:
// Apple
// Banana
// Grapefruit
// Pineapple
// Orange

var fruitsObj = {
  list: ['Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'],
  title: 'A Collection of Fruit',
};


function outputList() {
  console.log(this.title + ':');

  var args = [].slice.call(arguments);

  args.forEach(function(elem) {
    console.log(elem);
  });
}


outputList.apply(fruitsObj, fruitsObj.list);
/*
Answer
Since the property we have interest in is an array (fruitObj.list),
using apply() is natural as we don't have to extract the array beforehand and pass in as seperate args.
*/