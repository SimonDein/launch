// What does the following function do?

function doSomething(string) {
  return string.split(' ').reverse().map((value) => value.length);
}

/*
It takes a string, splits it into an array or strings where any space might occure,
reverses the order of any string in the array, and maps each string as they occur into a
number representing the length of the string - and finally returns an array of numbers.
*/