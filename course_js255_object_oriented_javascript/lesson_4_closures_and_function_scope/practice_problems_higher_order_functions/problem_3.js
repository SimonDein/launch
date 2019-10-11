// Implement makeCheckEven below, such that the last line of the code returns an array [2, 4].

var numbers = [1, 2, 3, 4];
function makeCheckEven() {
  return function(num) {
    return num % 2 === 0;
  }
}

var checkEven = makeCheckEven();

numbers.filter(checkEven); // [2, 4]

