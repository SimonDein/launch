function doubler(number) {
  doubledNumber = number * 2;
  console.log(doubledNumber);

  if (doubledNumber <= 50) {
    doubler(doubledNumber);
  }
}

doubler(1);