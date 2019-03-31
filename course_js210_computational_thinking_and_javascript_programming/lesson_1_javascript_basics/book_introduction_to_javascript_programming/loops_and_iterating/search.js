let numbers = [1, 4, 6, 3, 7, 4, 5, 9];
indexOfFive = -1;

for (i = 0; i < numbers.length; i++) {
  if (numbers[i] === 5) {
    indexOfFive = i;
    break;
  }
}

console.log(indexOfFive);