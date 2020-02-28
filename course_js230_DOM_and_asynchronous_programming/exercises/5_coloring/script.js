// Write a function that colors a specific generation of the DOM tree. A generation is a set of elements that are on the same level of indentation.
// We'll be using a "styled" HTML for this exercise to better visualize the generations. You may use the .generation-color class to color the specific generation.
// You can assume that only non-negative integers will be provided as arguments.

function forEachElementAtLevel(targetLevel, callback, currentElement=document.body, currentLevel=0) {
  if (currentLevel === targetLevel) {
    callback(currentElement)
    return;
  }

  for (let i = 0; i < currentElement.children.length; i += 1) {
    forEachElementAtLevel(targetLevel, callback, currentElement.children[i], currentLevel + 1);
  }
}

forEachElementAtLevel(5, function (element) {
  element.classList.add('generation-color');
})