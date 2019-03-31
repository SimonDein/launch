let myArray = [
  [1, 3, 6, 11],
  [4, 2, 4],
  [9, 17, 16, 0],
];

myArray.forEach(function(arr){
  arr.forEach(function(num){
    if (num % 2 === 0) {
      console.log(num);
    }
  })
})


//another solution
for(let i = 0; i < myArray.length; i++) {
  let innerArray = myArray[i]

  for(let i = 0; i < innerArray.length; i++) {
    let num = innerArray[i];
    if (num % 2 === 0) {
      console.log(num)
    }
  }
}