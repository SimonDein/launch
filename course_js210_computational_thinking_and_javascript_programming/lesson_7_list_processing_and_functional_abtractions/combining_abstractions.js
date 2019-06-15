// If we have a list of names:

// And we want to figure out what first letter of a name that occurs the most
// we can defined to road to the result in the following steps:

// 1. Find the first letter of each name
// 2. Count how many times each letter occurs
// 3. Find the letter that occurs most

// Thinkin of list abstractions to solve each step:

// 1. Get each letter - > map
// 2. Get a count of occurences -> reduce
// 3. Find max -> reduce

// Implementation:


function getFirstLetterOccuringMost (names) {
  let firstLetters = getFirstCharacters(names);
  let firstLetterOccurences = getOccurenceCounts(firstLetters);
  return getKeyOfHighestValue(firstLetterOccurences);
}

var names = ['Heather', 'Gisella', 'Katsuki', 'Hua', 'Katy', 'Kathleen', 'Otakar'];
console.log(getFirstLetterOccuringMost(names)); // "K"

function getFirstCharacters (strings) {
  return strings.map(function (string) {
    return string[0];
  })
}

function getOccurenceCounts (values) {
  return values.reduce(function (counts, value) {
    counts[value] = counts[value] || 0;
    counts[value] += 1;
    return counts;
  }, {});
}

function getKeyOfHighestValue (properties) {
  return Object.keys(properties).reduce(function (lastValue, currentValue) {
    if (properties[lastValue] > properties[currentValue]) {
      return lastValue
    } else {
      return currentValue;
    }
  });
}