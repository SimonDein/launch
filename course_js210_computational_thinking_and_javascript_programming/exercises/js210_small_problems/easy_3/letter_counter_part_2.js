// Modify the wordSizes function from the previous exercise to exclude non-letters when determining word size. For instance, the word size of "it's" is 3, not 4.



function wordSizes(sentence) {
  let count = {};
  let words = sentence.split(' ');
  let wordLength;

  words.forEach(function (word) {
    alphabeticalCharacters = word.match(/[a-z]/ig);
    if (alphabeticalCharacters === null) return;
    
    wordLength = alphabeticalCharacters.length;
    count[wordLength] = count[wordLength] || 0;
    count[wordLength] += 1;
  })
  
  return count;
}

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 2 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 3 }
console.log(wordSizes("What's up doc?"));                              // { "5": 1, "2": 1, "3": 1 }
console.log(wordSizes(''));                                            // {}
console.log(wordSizes('Hello ! There'));                               // { "5": 2};
console.log(wordSizes('Fancy a cat'));                                 // { "5": 1, "3": 1, "1": 1};