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
