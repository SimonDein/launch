// The getDay method, like many of the get methods on the date object, returns a zero-based index of the current day of week instead of the day name. This enables support for multiple locales and formats. Modify the output message of the previous problem to show the 3-letter day name abbreviation.

var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

let dayNum = new Date().getDay();
let dayOfTheWeek = daysOfWeek[dayNum];

console.log(`Today is a ${dayOfTheWeek}`);