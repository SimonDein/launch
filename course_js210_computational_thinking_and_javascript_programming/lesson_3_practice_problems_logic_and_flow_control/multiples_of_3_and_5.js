// Write a function that logs the integers from 1 to 100 (inclusive) that are multiples of either 3 or 5. If the number is divisible by both 3 and 5, append an "!" to the number.

function multiplesOfThreeAndFive() {
  for(let i = 3; i <= 100; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(String(i) + '!');
    } else if(i % 3 === 0 || i % 5 === 0) {
      console.log(i);
    }
  }
}


multiplesOfThreeAndFive();

// output on console
'3'
'5'
'6'
'9'
'10'
'12'
'15!'
// ... 