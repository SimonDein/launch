function getNumberSuffix(number) {
  let lastTwoDigits = number % 100;

  if ([11, 12, 13].includes(lastTwoDigits)) {
    return 'th';
  }
  
  let lastDigit = lastTwoDigits % 10;
  switch (lastDigit) {
    case 1: return 'st';
    case 2: return 'nd'
    case 3: return 'rd';
    default: return 'th';
  }
}

function centurySuffix(year) {
  let century = Math.ceil(year / 100);
  let suffix = getNumberSuffix(century);
  
  return `${century}${suffix}`;
}

console.log(centurySuffix(1)) // => 1st
console.log(centurySuffix(101)) // => 2nd
console.log(centurySuffix(200)) // => 2nd
console.log(centurySuffix(201)) // => 3rd
console.log(centurySuffix(301)) // => 4th
console.log(centurySuffix(1201)) // => 13th
console.log(centurySuffix(2001)) // => 21st
console.log(centurySuffix(2230)) // => 23rd