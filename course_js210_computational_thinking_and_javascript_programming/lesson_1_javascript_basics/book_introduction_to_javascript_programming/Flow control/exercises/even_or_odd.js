function evenOrOdd (num) {
  if (num !== parseInt(num)) {
    console.log("You didn't pass an integer");
    return;
  }
  
  if (num % 2 === 0) {
    console.log(`${num} is even.`);
  } else {
    console.log(`${num} is odd`);
  }
}

evenOrOdd(4);
evenOrOdd(7);
evenOrOdd(9);
evenOrOdd('9');
evenOrOdd(3.2);