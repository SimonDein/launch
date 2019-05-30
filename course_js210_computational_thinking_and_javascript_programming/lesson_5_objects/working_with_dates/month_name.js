// Let's make the month readable. Using the same technique we used in problem 3, convert the month number in the output string to a 3-letter month name abbreviation.

let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

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

let today = new Date();
let weekday = daysOfWeek[today.getDay()];
let month = months[today.getMonth()];
let date = dateSuffix(today.getDate());

console.log(`Todays date is ${weekday}, ${month} ${date}`) // Todays date is Thu, May 30th