// Create a new variable named nextWeek that is a new Date copied from the today object. Compare nextWeek and today, and log the results. Are they equal? Why or why not?

const DAYS_IN_WEEK = 7;
let today = new Date();
let nextWeek = new Date(today.getTime());

nextWeek.setDate(today.getDate() + DAYS_IN_WEEK);

console.log(nextWeek.getDate()); // 6 - today is the 30th of May and so it will be the 6th of June a week from now

console.log(nextWeek === today); // false

/*
The two variables nextWeek and today are not equal.
They are not equal because they are both of objects type "Object".
For two objects of Object to be equal - they have to point to the same obect in memory - which they don't.

If we had set nextWeek to point to the same object - they would be true.
*/