function diamonds(diamondSize) {
  if (!Number.isInteger(diamondSize) || diamondSize % 2 !== 1) return undefined
  let rowStars = 1;
  let increment = 2;
  let spaces = [];
  let stars = [];
  
  for(; rowStars >= 1;) {
    spaces.push((diamondSize - rowStars) / 2);
    stars.push(rowStars);

    if (rowStars === diamondSize) increment = - 2;
    rowStars += increment;
  }

  let rowOutput
  let i = 0;

  for(i; i < spaces.length; i += 1) {
    rowOutput = `${' '.repeat(spaces[i])}${'*'.repeat(stars[i])}`;
    console.log(rowOutput)
  }
}

console.log(diamonds(1));
// *
console.log(diamonds(3));
//  *
// ***
//  *
console.log(diamonds(7));
//    *
//   ***
//  *****
// *******
//  *****
//   ***
//    *
console.log(diamonds(0)); // => undefined
console.log(diamonds(-1)); // => undefined
console.log(diamonds('')); // => undefined