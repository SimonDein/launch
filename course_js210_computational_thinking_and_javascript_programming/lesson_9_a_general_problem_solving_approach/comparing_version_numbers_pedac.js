function invalidVersion(version) {
  return version.match(/[^0-9.]/);
} 

function compareVersions(version1, version2) {
  if (invalidVersion(version1) || invalidVersion(version2)) return null;
  
  let version1Parts = version1.split(/\./);
  let version2Parts = version2.split(/\./);
  let version1Part;
  let version2Part;

  for (let i = 0; i < version1.length; i += 1) {
    version1Part = Number(version1Parts[i]);
    version2Part = Number(version2Parts[i]);
    
    if (version1Part > version2Part) {
      return 1;
    } else if (version1Part < version2Part) {
      return -1;
    }
  }

  return 0;
}

console.log(compareVersions('0.1', '0.11')); // => -1
console.log(compareVersions('1', '1')); // => 0
console.log(compareVersions('0.2', '0.1')); // => 1
console.log(compareVersions('1.3.5', '1.3.4')); // => 1
console.log(compareVersions('1.3.5', '1.13.4')); // => -1
console.log(compareVersions('12.3.5', '1.13.4')); // => 1
console.log(compareVersions('12.3.5h', '1.13.4')); // => null
console.log(compareVersions('12.3.5', '1.13.4.q')); // => null

// Need to cover the rest of the edge cases