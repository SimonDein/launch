// Let's add the calendar date (the day of month) to our log message: "Today's date is Mon, the 6th". Use the getDate method to obtain the current day of month. Don't worry about using different suffixes for numbers that end with 1, 2, or 3 just yet; we'll deal with that in the next problem.

var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

let today = new Date();
let dayNum = today.getDay();
let dayOfTheWeek = daysOfWeek[dayNum];
let date = today.getDate();

console.log(`Todays date is ${dayOfTheWeek} the ${date}th`);