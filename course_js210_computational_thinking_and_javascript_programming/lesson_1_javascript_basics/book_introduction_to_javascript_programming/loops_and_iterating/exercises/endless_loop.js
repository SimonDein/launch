// The following code causes an infinite loop (a loop that never stops iterating). Why?

let counter = 0;

while (counter = 1) {
  console.log(counter);
  counter += 1;

  if (counter > 2) {
    break;
  }
}

/* On line 5 the condition for the while loop is an assignment of the value 1 to the counter variable.
   Line 7 increments the counter by 1 but is not enough for the condition to return true in the conditional on line 9. Had the counter been three of the comparing operator been >= the loop would break.
*/