// Write a function that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the function. The smallest such star you need to handle is a 7x7 grid (i.e., when n is 7).

/*
----------- PEDAC -----------
Problem:
  Input:
    - Integer:
      - width of star
      - is odd
      - N >= 7 always

  Output:
    - Printed rows of star

  Rules:
    - the star is 8 pointed
    - each "arm" of the star has the same length
    - each "arm" will be of odd length: Math.floor(N / 2);

Data Structure:
  - Matrix: nested arrays of rows an columns
    - We can "draw" star on a grid

Algorithm:
  - get MiddleIndex
  - get star
    - get halfStar: ['*  *  *', ' * * *'. '  ***']
      halfStar = [];
      - for (i < middleIndex)
        spacing = (middleIndex - i) - 1
        halfStar.push(['*', '*', '*'].join(spacing))
    - star = halfStar.concat('*'.repeat(N)).concat(halfStar.reverse())
  - print star
*/


function star(width) {
  let starRows = getStarRows(width);
  starRows.forEach((row) => console.log(row));
}

function getStarRows(width) {
  let halfStar = getHalfStar(width);
  let middleRow = '*'.repeat(width);
  let star = halfStar.concat(middleRow).concat(halfStar.reverse());
  return star;
}

function getHalfStar(width) {
  let middleIndex = Math.floor(width / 2);
  let halfStar = [];
  let spacing;
  let starRow

  for (rowNum = 0; rowNum < middleIndex; rowNum += 1) {
    stars = ['*', '*', '*'];
    spacing = ' '.repeat(middleIndex - rowNum - 1);
    padding = ' '.repeat(rowNum);
    starRow = padding + stars.join(spacing)
    
    halfStar.push(starRow);
  }

  return halfStar;
}

star(7);
//*  *  * [0, 3, 6]
// * * *  [1, 3, 4]
//  ***   [2, 3, 4]
//******* [3, 0...6]
//  ***   
// * * *
//*  *  *

star(9);
// *   *   *
//  *  *  *
//   * * *
//    ***
// *********
//    ***
//   * * *
//  *  *  *
// *   *   *