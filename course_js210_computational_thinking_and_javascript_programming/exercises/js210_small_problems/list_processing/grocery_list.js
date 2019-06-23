// Write a function that takes a grocery list (a two-dimensional array) with each element containing a fruit and a quantity, and returns a one-dimensional array of fruits, in which each fruit appears a number of times equal to its quantity.




console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]

function buyFruit(groceryList) {
  let list = [];
  let i;

  groceryList.forEach(function ([fruit, quantity]) {
    for(i = quantity; i > 0; i -= 1) {
      list.push(fruit);
    }
  });

  return list
}