function numberRange(num) {
  if (num < 0) {
    console.log("The number is less than 0")
  } else if (num <= 50) {
    console.log("The number is between 0 and 50");
  } else if (num <= 100) {
    console.log("The number is between 51 and 100");
  } else {
    console.log("The number is bigger than 100");
  }
}

numberRange(-1)
numberRange(0)
numberRange(12)
numberRange(50)
numberRange(51)
numberRange(100)
numberRange(101)