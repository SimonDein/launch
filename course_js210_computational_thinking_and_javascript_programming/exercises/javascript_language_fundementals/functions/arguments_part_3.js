var a = [1, 2, 3];

function myValue(b) {
  b[2] += 7;
}

myValue(a);
console.log(a);

/*
Line 8 will output '[1, 2, 10]', as the object is mutated in the function.
*/