// Change your output to include the value from the getMonth method. Thus, the logged string will read "Today's date is Mon, 11 6th", where 11 is the month number returned by getMonth.

var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

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
let month = today.getMonth();
let date = dateSuffix(today.getDate());

console.log(`Todays date is ${weekday}, ${month} ${date}`)