// The === operator only returns true with Date objects if the objects are the same object. Since we have two different objects (with the same values), we must instead compare the values represented by those objects. Compare the values returned by toDateString to determine whether the two objects are equal. Finally, add 7 days to the nextWeek date and compare the two objects again.

const DAYS_IN_WEEK = 7;
let today = new Date();
let nextWeek = new Date(today.getTime());

console.log(today.toDateString() === nextWeek.toDateString()); // true

nextWeek.setDate(today.getDate() + DAYS_IN_WEEK);

console.log(today.toDateString() === nextWeek.toDateString()); // false