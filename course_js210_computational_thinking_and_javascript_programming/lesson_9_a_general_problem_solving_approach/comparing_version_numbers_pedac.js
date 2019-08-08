function validVersion(version) {
  return /^\d+(\.\d+)*$/.test(version);
}

function padToEqualLength(array1, array2, padding) {
  if (array1.length !== array2.length) {
    let shortest = array1.length > array2.length ? array2 : array1;
    let lengthDifference = Math.abs(array1.length - array2.length);

    for(let i = lengthDifference; i > 0; i -= 1) {
      shortest.push(padding);
    }
  }
}

function compareArrays(array1, array2) {
  let i;
  for(i = 0; i < array1.length; i += 1) {
    
    if (array1[i] > array2[i]) {
      return 1;
    } else if (array1[i] < array2[i]) {
      return -1
    }
  };

  return 0;
}

function compareVersions(vers1, vers2) {
  if (!validVersion(vers1) || !validVersion(vers2)) return null;

  let vers1Sections = vers1.split('.').map(section => Number(section));
  let vers2Sections = vers2.split('.').map(section => Number(section));
  
  padToEqualLength(vers1Sections, vers2Sections, 0);

  return compareArrays(vers1Sections, vers2Sections);
}

console.log(compareVersions('0.1', '0.11'))// => -1
console.log(compareVersions('0.1', '0.1')) // => 0
console.log(compareVersions('0.2', '0.1')) // => 1
console.log(compareVersions('1.3.5', '1.3.4')) // => 1
console.log(compareVersions('1.3.5', '1.13.4'))// => -1
console.log(compareVersions('12.3.5', '1.13.4')) // => 1

// Egde cases:
console.log(compareVersions('.5', '1')) // => null
console.log(compareVersions('5.', '1')) // => null
console.log(compareVersions('1..5', '1.5')) // => null
console.log(compareVersions('1.0.0', '1.0')) // => 0
console.log(compareVersions('1.0.0.0', '1')) // => 0
console.log(compareVersions('1.0', '1.0.5'))// => -1
console.log(compareVersions('1.a', '1.0.5'))// => null
console.log(compareVersions('1.4a.4', '1.0.5'))// => null
console.log(compareVersions('1.23!.4', '1.0.5'))// => null
console.log(compareVersions('@.23.4', '1.0.5'))// => null