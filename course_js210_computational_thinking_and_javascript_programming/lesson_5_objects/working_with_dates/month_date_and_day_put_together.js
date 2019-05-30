// Our call to console.log is getting cluttered. Let's clean things up a bit and refactor the code into a few formatting functions that we can call from anywhere in our code. Create formattedMonth and formattedDay functions to format the month and day, then write a formattedDate function that pulls everything together and logs the fully formatted date.


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
formattedDate(today);