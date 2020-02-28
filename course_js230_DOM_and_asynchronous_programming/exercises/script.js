/*
Implement a function, sliceTree, that is "similar" to the Array.prototype.slice method, but this time for a DOM tree.
The sliceTree function takes two arguments: the start index which is the parent node's id attribute and, the end index which is the innermost child node's id attribute.
The function returns an array of tagNames.
Take note of the following when implementing the sliceTree function:

It's similar to slice but different in the sense that slice isn't inclusive on the right hand side.
The end index doesn't have to be the id of the "innermost" child node as some of the examples suggest.
Only consider element nodes.
Only elements that have body as an ancestor (parent, grandparent, etc.) are sliceable.
If the id attribute of the start or end index is not in the DOM, return undefined.
If the slice is not feasible — there's no path connecting the element at the starting index to the ending index — return undefined.

input: start ID and end ID

output: array of element names

rules:
  - if any of the id's does not exist on an element - return undefined
  - if two elements cannot be connected - return undefined
  - only consider element nodes
  - only elements that have body as an ancestor is slicable

algorithm:
  - if id's doesn't exist or doens't belong to body (document.body.querySelectorAll(id1 and id 2))
    - return undefined

  - get endElement
  - currentElement = endElement
  - do
    - push currentElement to array
    - currentElement = currentElement.parentElement
  - while currentElement.id !== endID
*/


function sliceTree(startId, endId) {
  if (!idsExistInBody(startId, endId)) return undefined
  
  let treeSlice = [];
  let currentElement = document.getElementById(endId);

  treeSlice.push(currentElement.nodeName);

  do {
    currentElement = currentElement.parentElement;
    treeSlice.push(currentElement.nodeName);

    // if we hit body we know the elements can't connect
    if (currentElement === document.body) return undefined 
  } while (Number(currentElement.id) !== startId)

  return treeSlice.reverse();
}

function idsExistInBody(...ids) {
  for(let i = 0; i < ids.length; i += 1) {
    let queryResult = document.querySelector(`[id='${ids[i]}']`);
    if (queryResult === null) return false;
  }

  return true;
}

console.log(sliceTree(1, 4));
// ["ARTICLE", "HEADER", "SPAN", "A"]
console.log(sliceTree(1, 76));
// undefined
console.log(sliceTree(2, 5));
// undefined
console.log(sliceTree(5, 4));
// undefined
console.log(sliceTree(1, 23));
// ["ARTICLE", "FOOTER"]
console.log(sliceTree(1, 22));
// ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"]
console.log(sliceTree(11, 19));
// ["SECTION", "P", "SPAN", "STRONG", "A"]