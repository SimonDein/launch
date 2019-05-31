// A user wrote a function that takes an array as an argument and returns its average. Given the code below, the user expects the average function to return 5. Is the user's expectation correct? Why or why not?

var myArray = [5, 5];
myArray[-1] = 5;
myArray[-2] = 5;

function average(array) {
  var sum = 0;
  var i;

  for (i = -2; i < array.length; i += 1) {
    sum += array[i];
  }

  return sum / array.length;
}

average(myArray);

/*

No, the function as is will return 10.
Two properties (-1 and -2) are assigned the array (which is really an object) with the value of 5.
In the for loop we add those numbers to the sum so we end up with a total of 20.
Then on line 15 we return the result of dividing 20 by the length of the array which will be 2.
Arrays only count elements as part of the array when their property (index) is a non negative integer.

*/