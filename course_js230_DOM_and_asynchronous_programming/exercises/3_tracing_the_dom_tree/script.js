/*
Write a JavaScript function that takes an element's id and returns the DOM tree of the element in a two-dimensional array. The first subarray contains the element and its siblings, the second contains the parent of the element and its siblings, so on and so forth, all the way up to the "grandest" parent. Assume that the grandest parent is the element with an id of "1".
*/

function domTreeTracer(id) {
  let domStack = [];
  let currentElement = document.getElementById(id);
  let parentNode
  
  do {
      parentNode = currentElement.parentElement;
      domStack.push([].slice.call(parentNode.children));
      currentElement = parentNode;
  } while (parentNode !== document.body)
  
  return domStack;
}


console.log(domTreeTracer(2)); // [["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]

console.log(domTreeTracer(22)); // [["A"], ["STRONG"], ["SPAN", "SPAN"], ["P", "P"], ["SECTION", "SECTION"], ["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]
