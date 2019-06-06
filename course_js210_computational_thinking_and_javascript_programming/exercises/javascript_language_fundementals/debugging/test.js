function outerFunction() {
  let number = 5;

  return function innerFunction() {
    console.log(number);
  }
}


let holdingInnerFunction = outerFunction();
holdingInnerFunction()