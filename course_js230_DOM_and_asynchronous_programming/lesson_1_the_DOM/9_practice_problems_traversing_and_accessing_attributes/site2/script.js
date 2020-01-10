// this script is for https://d3905n0khyu9wc.cloudfront.net/the_dom/polar_bear_wiki.html

// Helper functions
function walk(node, callback) {
  callback(node);
  
  for(let i = 0; i < node.childNodes.length; i += 1) {
    walk(node.childNodes[i], callback);
  }
}

function hasPNGFileExtention(fileExtention) {
  return (/\.png$/).test(fileExtention);
}

let body = document.lastChild.lastChild;

// Count the images on the page, then count the PNG images. Log both results.
let imageCount = 0;
let pngImageCount = 0;

walk(body, (node) => {
  if (!(node instanceof HTMLImageElement)) return;
  imageCount += 1;
  if (hasPNGFileExtention(node.src)) pngImageCount += 1;
})

console.log(imageCount);
console.log(pngImageCount);

// Change the link color to red for every link on the page.
walk(body, function(node) {
  if (node instanceof HTMLAnchorElement) node.style.color = ('red');
})