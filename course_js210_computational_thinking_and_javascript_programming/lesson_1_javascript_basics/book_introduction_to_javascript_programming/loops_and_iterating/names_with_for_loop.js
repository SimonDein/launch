// for loop
let names = ['kim', 'jenny', 'eva', 'sofia'];
let upperNames = [];

for (let index = 0; index < names.length; index++) {
  if (names[index] === 'jenny') { // skip jenny if
    continue
  }
  upperName = names[index].toUpperCase()
  upperNames.push(upperName);
}

console.log(names);
console.log(upperNames);

// As a do/while loop:
// let names = ['Sandra', 'Peter', 'Camille', 'Mikkel'];
// let upperNames = [];
// let index = 0;

// do {
//   let upperName = names[index].toUpperCase();
//   upperNames.push(upperName);
//   index += 1;
// } while (index < names.length)

// console.log(names);
// console.log(upperNames);