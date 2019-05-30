// Write a function named wordCount that takes a single String as an argument. The function should return an Object that contains the counts of each word that appears in the provided String. In the returned Object, you should use the words as keys, and the counts as values.


function wordCount(string) {
  let count = {};
  let words = string.split(' ');

  words.forEach(function(word) {
    if(count[word]) {
      count[word] += 1;
    } else {
      count[word] = 1;
    }
  });
  
  return count;
}


console.log(wordCount('box car cat bag box'));  // { box: 2, car: 1, cat: 1, bag: 1 }