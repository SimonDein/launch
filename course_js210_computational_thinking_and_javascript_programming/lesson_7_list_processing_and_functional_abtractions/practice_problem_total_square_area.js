// For this practice problem, we'll represent rectangles as Arrays with two elements: a height and a width.
// Write a Function named totalArea that takes an Array of rectangles as an argument. The Function should return the total area covered by all the rectangles.

function totalArea(dimensionOfAreas) {
  let areas = dimensionOfAreas.map( (dimensions) => dimensions[0] * dimensions[1]);
  let totalArea = areas.reduce( (total, area) => total + area);
  return totalArea;
}

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles));    // 141



// Now, write a second Function named totalSquareArea. This Function should calculate the total area of a set of rectangles, just like totalArea. However, it should only include squares in its calculations: it should ignore rectangles that aren't square.

let isSquareArea = function (dimensions) { return dimensions[0] === dimensions[1]};

function totalSquareArea(dimensionsOfAreas) {
  let dimensionsOfSquareAreas = dimensionsOfAreas.filter(isSquareArea);
  return totalArea(dimensionsOfSquareAreas);
}

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalSquareArea(rectangles));    // 121