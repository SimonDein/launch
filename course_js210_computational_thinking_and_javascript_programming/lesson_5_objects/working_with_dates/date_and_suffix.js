// Ideally, the suffix on the day number needs to adjust to the proper suffix for days like the 1st, 22nd, and 3rd. Write a function named dateSuffix that takes the day of month as a numeric value and returns the formatted day of month and suffix. Make sure you use the correct suffixes.

function dateSuffix(date) {
  let suffix = ''

  if (date <= 13 && date >= 11) {
    suffix = 'th';
  } else {
    let lastDigit = date % 10;

    switch (lastDigit) {
      case 1:
        suffix += 'st';
        break;
      case 2:
        suffix += 'nd';
        break
      case 3:
        suffix += 'rd';
        break
      default:
        suffix += 'th';
        break;
    }
  }

  return String(date) + suffix;
}

console.log(dateSuffix(11)); // 11th
console.log(dateSuffix(21)); // 21st
console.log(dateSuffix(31)); // 31st
console.log(dateSuffix(22)); // 22nd
console.log(dateSuffix(23)); // 23rd


