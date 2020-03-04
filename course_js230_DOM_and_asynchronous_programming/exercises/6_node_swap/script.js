/*
Write a function that takes two element ids as arguments and swaps the positions of the elements represented by the ids.
The function returns true for valid swaps and undefined for invalid.
To put the focus on the node swapping functionality, you can assume that nodes will have a value for the id attribute and two arguments will always be provided.
Use the following HTML and sample codes to test your output:
*/

/*
=== Algo ===

- if ids does not exist
  - return undefined
- if any of the nodes contain the other
  - return undefined

- swap nodes

*/

document.addEventListener('DOMContentLoaded', function (event) {
  function nodeSwap(id1, id2) {
    let element1 = document.getElementById(id1);
    let element2 = document.getElementById(id2);

    if (element1 === null || element2 === null) return undefined;
    if (element1.contains(element2) || element2.contains(element1)) return undefined;

    let element2Copy = element2.cloneNode(true);

    element1.replaceWith(element2Copy);
    element2.replaceWith(element1);

    return true;
  }

  // Invalid Swaps
  // at least one of the id attributes doesn't exist
  console.log(nodeSwap(1, 20)); //undefined
  
  // at least one of the nodes is a "child" of the other
  console.log(nodeSwap(1, 4)); // undefined
  console.log(nodeSwap(9, 3)); // undefined
  
  // console.log(nodeSwap(1, 2)); // true

  // multiple swaps
  console.log(nodeSwap(3, 1)); // true
  console.log(nodeSwap(7, 9)); // true
})