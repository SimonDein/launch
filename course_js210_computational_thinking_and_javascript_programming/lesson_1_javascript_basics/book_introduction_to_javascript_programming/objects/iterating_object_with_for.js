let grades = {michael: 'b',
              sandra: 'a',
              pedro: 'a'};

for(let student in grades) {
  console.log(`${student}'s grade is ${grades[student]}`);
}