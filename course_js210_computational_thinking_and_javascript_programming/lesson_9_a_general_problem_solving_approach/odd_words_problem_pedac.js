function reverseString(string) {
  return string.split('').reverse().join('');
}

function oddWords(string) {
  let words = string.match(/[a-z]+/gi);
  let oddWordsReversed = words.map(function (word, index) {
    if (index % 2 !== 0) {
      return reverseString(word);
    } else
    return word;
  });

  return oddWordsReversed.join(' ') + '.';
}


console.log(oddWords('H.'))
console.log(oddWords('Hello      .'))
console.log(oddWords('Hello there.'))
console.log(oddWords('Hello         there   .'))
console.log(oddWords('abdredksleosldkehfil hey yo.'))