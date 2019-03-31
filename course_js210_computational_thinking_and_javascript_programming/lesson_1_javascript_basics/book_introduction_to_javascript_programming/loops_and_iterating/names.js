let names = ['kim', 'jenny', 'eva', 'sofia'];
let upperNames = [];
let index = 0;

while(index < names.length) {
  upperName = names[index].toUpperCase()
  upperNames.push(upperName);
  index++;
}

console.log(names);
console.log(upperNames);