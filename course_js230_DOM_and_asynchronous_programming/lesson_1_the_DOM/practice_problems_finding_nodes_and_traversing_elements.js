// Using this extracted HTML: https://d3905n0khyu9wc.cloudfront.net/the_dom/polar_bear_wiki.html

// Write some JavaScript code to retrieve a word count for each h2 heading on the page.
let h2s = document.body.getElementsByTagName('h2');
let h2sWordCount = [];

let words = [];
for(let i = 0; i < h2s.length; i += 1) {
  let text = h2s[i].textContent;
  let wordCount = text.trim().split(' ').length;
  h2sWordCount.push(wordCount);
}

console.log(h2sWordCount);


// The page has a table of contents with the title "Contents" and links to the different content sections on "Naming and etymology," "Taxonomy and evolution," etc.

// Use three different DOM methods to retrieve a reference to the div element that contains the table of contents.
let toc1 = document.querySelector('div #toc');
let toc2 = document.getElementById('toc');
let toc3 = document.getElementsByClassName('toc')[0];

// Write some JavaScript code to change the color for every other link in the table of contents to green.
let toc = document.querySelector('div #toc');
let tocLinks = toc.getElementsByTagName('a');

for(let i = 0; i < tocLinks.length; i += 1) {
  if (i % 2 !== 0) continue;
  tocLinks[i].style.color = 'green';
}

// Write some JavaScript code to retrieve the text of every thumbnail caption on the page.
let thumbCaptions = document.querySelectorAll('div .thumbcaption');
let thumbCaptionsText = [].slice.call(thumbCaptions).map((element) => element.textContent.trim());

// You can think of the scientific classification of an animal as a series of key-value pairs. Here, the keys are taxonomic ranks (Domain, Kingdom, Phylum, etc.). The values are the specific groups to which the animal belongs.

// Write JavaScript code that extracts the classification of animals from the web page and logs an Object that uses the ranks as keys and the groups as values. You may assume the taxonomic ranks to use as keys is provided for you as an array.

/*
Input: Table Body
Output: Object with classification and values according to rules

Rules: If a value for a given rank exists we want to add it to classification along with value

Algorithm:
  - Iterate each table row
    - For each RANK
      - if first tablecell contains the current word in rank
        - Add a new key to classification with rank and value

*/


let tableCells = document.querySelectorAll('.infobox td')

const RANKS = ['Domain', 'Kingdom', 'Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species'];
let classification = {};

for(let i = 0; i < tableCells.length; i += 1) {
  let cell = tableCells[i]
  
  RANKS.forEach((rank) => {
    if (cell.textContent.includes(rank)) {
      classification[rank] = cell.nextElementSibling.textContent;
    };
  });
}

classification;