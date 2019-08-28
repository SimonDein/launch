// Write a function that counts the number of occurrences of each element in a given array. Once counted, log each element alongside the number of occurrences.

function tally (counts, value) {
  if (counts[value]) {
    counts[value] += 1;
  } else {
    counts[value] = 1;
  }
  
  return counts;
};

function displayCounts(items) {
  let itemCounts = items.reduce(tally, {});
  
  let keys = Object.keys(itemCounts);
  keys.forEach((key) => console.log(`${key} => ${itemCounts[key]}`));
}

var vehicles = ['car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];
console.log(displayCounts(vehicles));
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
