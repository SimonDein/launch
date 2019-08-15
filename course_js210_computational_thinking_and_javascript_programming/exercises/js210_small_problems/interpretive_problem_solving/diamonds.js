/*


Algorithm:
  - get all odd numbers < input
    - odds = []
    - for(num = 1; num < input, num += 2)
      - odds.push(num);
  - get rowStars
    - [[oddNumber < Input], input, [oddNumbers < Input].reverse].flat
  - print each row with padding
    - padding = Math.ceil(width / 2) - rowStars
    - console.log(`${' '.repeat(padding)}${'*'.repeat(rowStars)}`)
*/


function diamond(diamondWidth) {
  let rowsStarCount = getRowsStarCount(diamondWidth)
  rowsStarCount.forEach(function (starCount) {
    let paddingCount = Math.ceil(diamondWidth / 2) - Math.ceil(starCount / 2);
    console.log(`${' '.repeat(paddingCount)}${'*'.repeat(starCount)}`)
  });
}

function getRowsStarCount(width) {
  let top = [];
  for (i = 1; i < width; i += 2) {
    top.push(i);
  }
  return top.concat(width).concat(top.reverse());
}



diamond(1);
// logs
// *
diamond(3);
// logs
//  *
// ***
//  *
diamond(9);
// logs
//     *
//    ***
//   *****
//  *******
// *********
//  *******
//   *****
//    ***
//     *