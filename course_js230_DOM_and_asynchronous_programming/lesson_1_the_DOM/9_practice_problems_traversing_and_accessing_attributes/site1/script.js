// Helpers
function walk(node, callback) {
  callback(node);
  
  for(let i = 0; i < node.childNodes.length; i += 1) {
    walk(node.childNodes[i], callback);
  }
}

function isParagraph(node) {
  return node instanceof HTMLParagraphElement;
}

let html = document.lastChild; // skip doctype
let body = html.lastChild;

let heading = body.childNodes[1];

// change the heading to red and fontsize to 46px
heading.classList.add('red');
heading.style.fontSize = '46px'

// count the number of paragraphs on the page
function countParagraphs(node) {
  let paragraphCount = 0; // private variable
  
  walk(node, function(n) {
    if (isParagraph(n)) paragraphCount += 1;
  });

  console.log(paragraphCount);
}

countParagraphs(body);


// retrieve the first word from each paragraph on the page and log the entire list
function getFirstWordFromParagraphs(node) {
  const words = [];
  let text;
  let firstWord;

  walk(node, function(n) {
    if(isParagraph(n)) {
      text = n.innerText.trim();
      firstWord = text.split(' ')[0];
      words.push(firstWord);
    }
  });

  return words;
}

let firstWords = getFirstWordFromParagraphs(body);
firstWords.forEach((word) => console.log(word));


// Add the class stanza to each paragraph except the first.
function getParagraphs(node) {
  let paragraphs = [];

  walk(node, function(n) {
    if (isParagraph(n)) paragraphs.push(n);
  });
  
  return paragraphs;
}

let paragraphs = getParagraphs(body)
let paragraphsExceptFirst = paragraphs.slice(1);
paragraphsExceptFirst.forEach((p) => p.classList.add('stanza'));