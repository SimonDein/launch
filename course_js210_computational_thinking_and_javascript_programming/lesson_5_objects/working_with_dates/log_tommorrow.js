// Create a new date object variable named tomorrow that contains a Date object. Initialize the variable by setting it to the value of today. You can get the value of today using the getTime method. Next, change the date on the tomorrow object to the day after today: you should use setDate to change the date. Finally, log the tomorrow object with your formattedDate function.

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

function formattedDay(date) {
  const DAYS_OF_WEEK = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  return DAYS_OF_WEEK[date.getDay()];
}

function formattedMonth(date) {
  const MONTHS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  return MONTHS[date.getMonth()];
}

function formattedDate(date) {
  let day = formattedDay(date);
  let month = formattedMonth(date);
  
  console.log(`Today is ${day}, ${month} ${dateSuffix(date.getDate())}`)
}

let today = new Date();
let tommorrow = new Date(today.getTime());
tommorrow.setDate(tommorrow.getDate() + 1);

formattedDate(tommorrow); // Today is Fri, May 31st (would be tommorrow)

let today = new Date();
let anotherToday = new Date(today.getTime());