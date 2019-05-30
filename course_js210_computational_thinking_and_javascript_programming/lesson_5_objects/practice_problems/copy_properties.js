// Write a function named copyProperties that takes two Objects as arguments. The function should copy all properties from the first object to the second. The function should return the number of properties copied.

function copyProperties(source, destination) {
  let copiedElements = 0;
  
  for (let prop in source) {
    destination[prop] = source[prop];
    copiedElements++;
  }

  return copiedElements;
}

var hal = {
  model: 9000,
  enabled: true,
};

var sal = {};
console.log(copyProperties(hal, sal));  // 2
console.log(sal);                       // { model: 9000, enabled: true }